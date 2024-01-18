import pymysql.cursors
import pandas as pd
from tqdm import tqdm
import argparse

def get_sql_execution_result(sql):
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
            except:
                result = ["SQL语句错误"]
    return result


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--model_name', type=str, default='chatglm3-6b',
                        choices=["chatglm3-6b", "Baichuan2-13B-Chat", "Qwen-14B-Chat",
                                 "gpt-3.5-turbo", "gpt-4", "Yi-34B-Chat", "Qwen-74B-Chat"])
    args = parser.parse_args()
    model_name = args.model_name

    sql_df = pd.read_csv(f"./data/test_data-{model_name}.csv")
    sql_df["sql-预期执行结果"] = ""
    sql_df[f"sql-{model_name}执行结果"] = ""
    for i in tqdm(range(len(sql_df))):
        row = sql_df.iloc[i]
        sql_pred = row[f"sql-{model_name}"]
        if sql_pred.startswith("SQLQuery:"):
            sql_pred = sql_pred.replace("SQLQuery:", "").strip(' "')
        elif "SQLQuery:" in sql_pred:
            sql_pred = sql_pred.split("SQLQuery:")[-1].strip(' "')
        # print(sql_pred)
        sql_df[f"sql-{model_name}执行结果"][i] = get_sql_execution_result(sql_pred)
        sql_df["sql-预期执行结果"][i] = get_sql_execution_result(row["预期sql"])
    new_sql_df = sql_df[["question", "预期sql", "sql-预期执行结果", f"sql-{model_name}", f"sql-{model_name}执行结果", ]]
    new_sql_df.to_csv(f"./data/test_data-{model_name}-execution.csv", index=False)

    # TODO: compare sql execution result