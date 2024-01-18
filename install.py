import pandas as pd

MYSQL_USER = "user"
MYSQL_PASSWD = "MySQL123456!"
MYSQL_DATABASE = "linewell"
MYSQL_TABLE = "corporate_relocation"

TABLE_INFO = f"""
CREATE TABLE {MYSQL_TABLE} (
        id INTEGER NOT NULL COMMENT 'id' AUTO_INCREMENT, 
        tyxydm VARCHAR(50) COMMENT '社会统一信用代码', 
        corporate__name VARCHAR(255) COMMENT '企业名称', 
        registered_capital VARCHAR(255) COMMENT '注册资本（单位:万）', 
        year VARCHAR(255) COMMENT '年份', 
        output VARCHAR(255) COMMENT '产值（万）', 
        taxes VARCHAR(255) COMMENT '税收（万）', 
        is_key_enterprises CHAR(1) COMMENT '重点企业(1是 0不是)', 
        key_enterprises_type CHAR(1) COMMENT '重点企业类别(A,B,C)', 
        employed_num VARCHAR(10) COMMENT '就业人数', 
        industry VARCHAR(255) COMMENT '行业', 
        industry_type VARCHAR(255) COMMENT '产业类型', 
        company_type VARCHAR(255) COMMENT '企业类型', 
        label VARCHAR(255) COMMENT '标签', 
        district VARCHAR(255) COMMENT '区', 
        street VARCHAR(255) COMMENT '街道', 
        declaration_num VARCHAR(255) COMMENT '申报数', 
        disbursed_funds VARCHAR(255) COMMENT '拨付资金', 
        is_interview CHAR(1) COMMENT '是否走访(1是,0不是）', 
        is_reporting_line CHAR(1) COMMENT '是否领导挂点企业(1是,0不是）', 
        is_commitment_not_relocate CHAR(1) COMMENT '是否承诺不搬离(1是,0不是）', 
        relocation_type VARCHAR(20) COMMENT '迁入/迁出', 
        relocation_reason VARCHAR(255) COMMENT '迁出原因', 
        is_relocation_warning VARCHAR(255) COMMENT '是否迁出预警', 
        relocation_location VARCHAR(20) COMMENT '迁出位置（市内、市外）', 
        PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 ENGINE=InnoDB;
"""

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
INSERT INTO corporate_relocation (
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