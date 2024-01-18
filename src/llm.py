import os
import openai
import torch
from transformers import AutoTokenizer, AutoModel, AutoModelForCausalLM
from transformers.generation.utils import GenerationConfig

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
    elif "yi" in model_name.lower():
        tokenizer = AutoTokenizer.from_pretrained(path, use_fast=False)
        model = AutoModelForCausalLM.from_pretrained(
            path, device_map="auto", torch_dtype='auto'
        ).eval()
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

def yi_generate(prompt, model, tokenizer):
    messages = [{"role": "user", "content": prompt}]
    input_ids = tokenizer.apply_chat_template( #! assure transformer version == 4.35.0
        conversation=messages, 
        tokenize=True,
        add_generation_prompt=True,
        return_tensors="pt"
    )
    output_ids = model.generate(input_ids.to(model.device))
    resp = tokenizer.decode(output_ids[0][input_ids.shape[1]:],
                            skip_special_tokens=True)
    return resp
    
def llm_generate(prompt, model_name, model, tokenizer):
    if model_name in ["gpt-3.5-turbo", "gpt-4"]:
        resp = gpt_generate(prompt, model_name)
    elif "chatglm" in model_name.lower() or "qwen" in model_name.lower():
        resp, _ = model.chat(tokenizer, prompt, history=[])
    elif "baichuan2" in model_name.lower():
        messages = [{"role": "user", "content": prompt}]
        resp = model.chat(tokenizer, messages)
    elif "yi" in model_name.lower():
        resp = yi_generate(prompt, model, tokenizer)
    else:
        raise NotImplementedError
    return resp