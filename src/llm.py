import os
import openai
import torch
from openai import OpenAI
from zhipuai import ZhipuAI
from transformers import AutoTokenizer, AutoModel, AutoModelForCausalLM, pipeline
from transformers.generation.utils import GenerationConfig
from src.constant import SQLCODER_BASE_PROMPT

def set_proxy():
    proxy = 'http://dell-1.star:7890' # 3090 docker
    os.environ['http_proxy'] = proxy 
    os.environ['HTTP_PROXY'] = proxy
    os.environ['https_proxy'] = proxy
    os.environ['HTTPS_PROXY'] = proxy

def set_openai_key(model_name):
    assert model_name in ["gpt-3.5-turbo", "gpt-4"]
    openai.api_key_path = ".openai-key-gpt4" if model_name == "gpt-4" else ".openai-key-gpt3.5"
    with open(openai.api_key_path, 'r') as f:
        os.environ['OPENAI_API_KEY'] = f.read()

def set_zhipuai_key(model_name):
    assert model_name in ["glm-3.5-turbo", "glm-4"]
    zhipuai_key_path = ".glm-key"
    with open(zhipuai_key_path, 'r') as f:
        os.environ['ZHIPUAI_API_KEY'] = f.read()

def load_model(model_name):
    path = None

    if "gpt-3.5-turbo" in model_name.lower() or "gpt-4" in model_name.lower() or "glm-3.5-turbo" in model_name.lower() or "glm-4" in model_name.lower():
        path = "api"
    else:
        for path_dir in ["/root/share", "/mnt/ssd0/"]:
            if os.path.exists(os.path.join(path_dir, model_name)):
                path = os.path.join(path_dir, model_name)
                break
    if path is None:
        raise FileNotFoundError(f"Model {model_name} not found")
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
    elif "sqlcoder" in model_name.lower():
        tokenizer = AutoTokenizer.from_pretrained("defog/sqlcoder-7b-2")
        model = AutoModelForCausalLM.from_pretrained(
            "defog/sqlcoder-7b-2",
            trust_remote_code=True,
            torch_dtype=torch.float16,
            device_map="auto",
            use_cache=True,
        )
    elif "glm-3.5-turbo" in model_name.lower() or "glm-4" in model_name.lower():
        set_zhipuai_key(model_name)
        return None, None
    else:
        raise NotImplementedError
    return model, tokenizer

def gpt_generate(prompt, model_name):
    client = OpenAI(
        # This is the default and can be omitted
        api_key=os.environ.get("OPENAI_API_KEY"),
    )
    try:
        response = client.chat.completions.create(
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

def glm_generate(prompt, model_name):
    client = ZhipuAI(api_key=os.environ.get("ZHIPUAI_API_KEY"))
    try:
        response = client.chat.completions.create(
            model=model_name,
            messages=[{"role": "user", "content": prompt}],
            temperature=0.01,
            max_tokens=4096,
            top_p=0.99,
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

def sqlcoder_generate(model, tokenizer, question, table_info):
    assert question is not None
    assert table_info is not None

    prompt = SQLCODER_BASE_PROMPT
    prompt = prompt.format(user_question=question, table_metadata_string=table_info)

    # make sure the model stops generating at triple ticks
    # eos_token_id = tokenizer.convert_tokens_to_ids(["```"])[0]
    eos_token_id = tokenizer.eos_token_id
    pipe = pipeline(
        "text-generation",
        model=model,
        tokenizer=tokenizer,
        max_new_tokens=300,
        do_sample=False,
        return_full_text=False, # added return_full_text parameter to prevent splitting issues with prompt
        num_beams=5, # do beam search with 5 beams for high quality results
    )
    generated_query = (
        pipe(
            prompt,
            num_return_sequences=1,
            eos_token_id=eos_token_id,
            pad_token_id=eos_token_id,
        )[0]["generated_text"]
        .split(";")[0]
        .split("```")[0]
        .strip()
        + ";"
    )
    return generated_query

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
    elif model_name in ["glm-3.5-turbo", "glm-4"]:
        resp = glm_generate(prompt, model_name)
    else:
        raise NotImplementedError
    return resp