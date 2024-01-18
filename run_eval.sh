for model_name in "chatglm3-6b" "Baichuan2-13B-Chat" "Qwen-14B-Chat" "gpt-4"
do
    echo "Running $model_name"
    python evaluate_sql.py --model_name $model_name
done