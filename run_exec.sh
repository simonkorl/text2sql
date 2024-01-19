for model_name in "chatglm3-6b" "Qwen-14B-Chat" "Yi-34B-Chat"
do
    echo "Running $model_name"
    python execute_sql.py --model_name $model_name
done