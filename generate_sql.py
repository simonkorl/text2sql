import os
import openai
import pandas as pd
from install import TABLE_INFO
from tqdm import tqdm
from transformers import AutoTokenizer, AutoModel, AutoModelForCausalLM
from transformers.generation.utils import GenerationConfig
import torch
import argparse

def set_proxy():
    proxy = 'http://dell-1.star:7890' # 3090 docker
    os.environ['http_proxy'] = proxy 
    os.environ['HTTP_PROXY'] = proxy
    os.environ['https_proxy'] = proxy
    os.environ['HTTPS_PROXY'] = proxy

def set_openai_key(model_name):
    assert model_name in ["gpt-3.5-turbo", "gpt-4"]
    openai.api_key_path = ".openai-key-gpt4" if model_name == "gpt-4" else ".openai-key-gpt3.5"

def load_model(model_name):
    path = f"/root/share/{model_name}"
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    if "chatglm" in model_name.lower():
        tokenizer = AutoTokenizer.from_pretrained(
            path, trust_remote_code=True
        )
        model = AutoModel.from_pretrained(
            path, trust_remote_code=True, device_map='auto'
        )
        if "chatglm-6b" in model_name.lower():
            model = model.half().to(device)
        model = model.eval()
    elif "baichuan2" in model_name.lower():
        tokenizer = AutoTokenizer.from_pretrained(
            path, trust_remote_code=True, use_fast=False,
        )
        model = AutoModelForCausalLM.from_pretrained(
            path, trust_remote_code=True, device_map='auto', torch_dtype=torch.bfloat16,
        )
        model.generation_config = GenerationConfig.from_pretrained(path)
    elif "qwen" in model_name.lower():
        tokenizer = AutoTokenizer.from_pretrained(
            path, trust_remote_code=True
        )
        model = AutoModelForCausalLM.from_pretrained(
            path, trust_remote_code=True, device_map='auto',
        ).eval()
    elif "gpt-3.5-turbo" in model_name.lower() or "gpt-4" in model_name.lower():
        set_proxy()
        set_openai_key(model_name)
        return None, None
    else:
        raise NotImplementedError
    return model, tokenizer

def gpt_generate(prompt, model_name):
    try:
        response = openai.ChatCompletion.create(
            model=model_name,
            messages=[{"role": "user", "content": prompt}],
            temperature=0,
            max_tokens=4096,
            top_p=1,
            frequency_penalty=0,
            presence_penalty=0,
            stop=["\n\n"]
        )
        return response.choices[0].message.content
    except Exception as e:
        print(e)
        return ""
    
def llm_generate(prompt, model_name, model, tokenizer):
    if model_name in ["gpt-3.5-turbo", "gpt-4"]:
        return gpt_generate(prompt, model_name)
    elif "chatglm" in model_name.lower() or "qwen" in model_name.lower():
        resp, _ = model.chat(tokenizer, prompt, history=[])
    elif "baichuan2" in model_name.lower():
        messages = [{"role": "user", "content": prompt}]
        resp = model.chat(tokenizer, messages)
    else:
        raise NotImplementedError
    return resp
    

PROMPT = """
给定一个输入问题，首先创建一个语法正确的mysql查询语句。
使用以下格式：

问题: "问题"
SQLQuery: "创建的sql语句"

仅使用以下表格：

{table_info}

注意：
一般问题都可以用到分组
未指明不需要用到limit
分组获取数量的时候字段名都用num，并且从大到小排序

问题：{input}
"""

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--model_name', type=str, default='chatglm3-6b',
                        choices=["chatglm3-6b", "Baichuan2-13B-Chat", "Qwen-14B-Chat",
                                 "gpt-3.5-turbo", "gpt-4"])
    args = parser.parse_args()
    model_name = args.model_name
    model, tokenizer = load_model(model_name)

    df = pd.read_csv('./data/test_data.csv')
    df = df[["question", "预期sql"]]
    df = df.fillna('')
    table_info = TABLE_INFO
    tqdm.pandas()
    df[f"sql-{model_name}"] = df.progress_apply(lambda x: llm_generate(
        prompt=PROMPT.format(table_info=table_info, input=x["question"]), 
        model_name=model_name, model=model, tokenizer=tokenizer), axis=1)
    df.to_csv(f"./data/test_data-{model_name}.csv", index=False)
