for model_name in "chatglm3-6b" "Baichuan2-13B-Chat" "Qwen-14B-Chat"
do
    echo "Running $model_name"
    python generate_sql.py --model_name $model_name
done