for model_name in "chatglm3-6b" "Qwen-14B-Chat" "Yi-34B-Chat" "Qwen-72B-Chat"
do
    echo "Running $model_name"
    python generate_sql.py --model_name $model_name
done