import pandas as pd
from src.table import TABLE_INFO, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWD, MYSQL_TABLE


if __name__ == "__main__":
    df = pd.read_csv('./data/corporate_relocation.csv')
    df = df.fillna('')

    sql = f"""
DROP DATABASE IF EXISTS {MYSQL_DATABASE};
CREATE DATABASE {MYSQL_DATABASE};
USE {MYSQL_DATABASE};
"""
    sql += TABLE_INFO

    # insert each row into table
    for i in range(len(df)):
        row = df.iloc[i]
        sql += f"""
INSERT INTO {MYSQL_TABLE} (
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        {i} , '{row['社会统一信用代码']}', '{row['企业名称']}', '{row['注册资本（万）']}', 
        '{row['年份']}', '{row['产值（万）']}', '{row['税收（万）']}', '{row['是否重点企业']}', 
        '{row['重点企业类别']}', '{row['就业人数']}', '{row['行业']}', '{row['产业类型']}', 
        '{row['企业类型']}', '{row['标签']}', '{row['区']}', '{row['街道']}', 
        '{row['申报数']}', '{row['拨付资金']}', '{row['是否走访']}', '{row['是否领导挂点企业']}', 
        '{row['承诺不搬离']}', '{row['迁入/迁出']}', '{row['迁出原因']}', '{row['外迁预警']}', 
        '{row['迁出位置（市内、市外）']}');
"""
    
    # grant privileges to new user for remote access
    sql += f"""
DROP USER IF EXISTS '{MYSQL_USER}';
CREATE USER '{MYSQL_USER}'@'%' IDENTIFIED WITH mysql_native_password BY '{MYSQL_PASSWD}';
GRANT ALL PRIVILEGES ON *.* TO '{MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
"""
    with open('install.sql', "w") as f:
        f.write(sql)