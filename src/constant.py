MAX_ROUND = 3

BASELINE_PROMPT = """
给定一个输入问题，请创建一个语法正确的MySQL查询语句。
使用以下格式：

【问题】
"用户提问"
【SQLQuery】
"创建的sql语句"

仅使用以下表格：
{table_info}

注意：
一般问题都可以用到分组
未指明不需要用到limit
分组获取数量的时候字段名都用num，且不对num额外细分，并按数值从大到小排序

【问题】
{input}
【SQLQuery】
"""

REFINER_PROMPT = """
以下【SQLQuery】用于根据【表格信息】回答【用户提问】，但执行过程中出现一些错误，请根据【MySQL error】和【Exception class】等已有信息修改【SQLQuery】，使其能够正确执行。
【问题】
{input}
【SQLQuery】
{sql}
【表格信息】
{table_info}
【MySQL error】
{mysql_error}
【Exception class】
{exception_class}

现在，请修改【SQLQuery】，使其能够正确执行，注意：
一般问题都可以用到分组
未指明不需要用到limit
分组获取数量的时候字段名都用num，且不对num额外细分，并按数值从大到小排序

【SQLQuery】
"""

SQLCODER_BASE_PROMPT = """
### Task
Generate a SQL query to answer [QUESTION]{user_question}[/QUESTION]

### Instructions
- If you cannot answer the question with the available database schema, return 'I do not know'

### Database Schema
The query will run on a database with the following schema:
{table_metadata_string}

### Answer
Given the database schema, here is the SQL query that answers [QUESTION]{user_question}[/QUESTION]
[SQL]
"""