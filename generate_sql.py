import pandas as pd
from tqdm import tqdm
import argparse
import pymysql.cursors
from src.constant import MAX_ROUND, BASELINE_PROMPT, REFINER_PROMPT
from src.table import TABLE_INFO
from src.llm import load_model, llm_generate
    
def preprocess_sql(raw_sql):
    """get sql statement from llm output"""
    sql = raw_sql.split("【SQLQuery】")[-1].strip('\n "')
    return sql

def execute_sql(sql):
    """execute sql statement and get execution result"""
    connection = pymysql.connect(
        host='localhost',
        port=3306,
        user='user',
        password='MySQL123456!',
        database='linewell',
        cursorclass=pymysql.cursors.DictCursor
    )
    with connection:
        with connection.cursor() as cursor:
            try:
                cursor.execute(sql)
                result = cursor.fetchall()
                return {
                    "data": result,
                    "mysql_error": None,
                    "exception_class": None
                }
            except Exception as e:
                return {
                    "data": [str(type(e).__name__)],
                    "mysql_error": str(e.args),
                    "exception_class": str(type(e).__name__)
                }

def llm_generate_safe(question, model_name, model, tokenizer, num_round=0, args=None):
    """generate sql statement and check if it can be executed"""
    if num_round == 0:
        prompt = BASELINE_PROMPT.format(table_info=TABLE_INFO, input=question)
    else:
        assert args is not None
        print(f"Round {num_round}: {args['exception_class']} \nOld SQL: {args['sql']}")
        prompt = REFINER_PROMPT.format(
            input=question, sql=args["sql"], table_info=TABLE_INFO, 
            mysql_error=args["mysql_error"], exception_class=args["exception_class"])
    raw_sql = llm_generate(prompt, model_name, model, tokenizer)
    sql = preprocess_sql(raw_sql)
    result = execute_sql(sql)
    if result["exception_class"] is not None and num_round < MAX_ROUND:
        return llm_generate_safe(question, model_name, model, tokenizer, 
                                 num_round+1, {
                                    "sql": sql,
                                    "mysql_error": result["mysql_error"],
                                    "exception_class": result["exception_class"]
                                })
    else:
        return sql # , result["data"]


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--model_name', type=str, default='chatglm3-6b',
                        choices=["chatglm3-6b", "Baichuan2-13B-Chat", "Qwen-14B-Chat",
                                 "gpt-3.5-turbo", "gpt-4", "Yi-34B-Chat", "Qwen-74B-Chat"])
    args = parser.parse_args()
    model_name = args.model_name
    model, tokenizer = load_model(model_name)

    df = pd.read_csv('./data/test_data.csv')
    df = df[["question", "预期sql"]]
    df = df.fillna('')
    table_info = TABLE_INFO
    tqdm.pandas()
    df[f"sql-{model_name}"] = df.progress_apply(lambda x: llm_generate_safe(
        x["question"], model_name, model, tokenizer), axis=1)
    df.to_csv(f"./data/test_data-{model_name}.csv", index=False)
