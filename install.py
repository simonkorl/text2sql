import pandas as pd
from src.table import (
    MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWD, 
    CORPORATE_RELOCATION_TABLE_NAME, 
    CORPORATE_RELOCATION_TABLE_INFO,
    POLICY_PROJECTS_TABLE_NAME,
    POLICY_PROJECTS_TABLE_INFO,
    POLICY_ENTERPRISE_TABLE_NAME,
    POLICY_ENTERPRISE_TABLE_INFO
)


if __name__ == "__main__":
    sql = f"""
DROP DATABASE IF EXISTS {MYSQL_DATABASE};
CREATE DATABASE {MYSQL_DATABASE};
USE {MYSQL_DATABASE};
"""
    
    df = pd.read_csv('./data/corporate_relocation.csv')
    df = df.fillna('')
    sql += CORPORATE_RELOCATION_TABLE_INFO
    for i in range(len(df)):
        row = df.iloc[i]
        sql += f"""
INSERT INTO {CORPORATE_RELOCATION_TABLE_NAME} (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
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
    
    df = pd.read_csv('./data/policy_projects.csv')
    df = df.fillna('')
    sql += POLICY_PROJECTS_TABLE_INFO
    for i in range(len(df)):
        row = df.iloc[i]
        sql += f"""
INSERT INTO {POLICY_PROJECTS_TABLE_NAME} (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        {i} , '{row['政策项目id']}', '{row['项目名称']}', '{row['发布状态（1：已发布，0：未发布,2:审核退回,3:待审核,4:审核通过）']}', 
        '{row['是否启动申报（1:是 0：否）']}', '{row['发布部门']}', '{row['申报企业数']}', '{row['审批类型']}', 
        '{row['是否秒批']}', '{row['审批通过的企业数']}', '{row['审批金额']}');
"""
        
    df = pd.read_csv('./data/policy_enterprise.csv')
    df = df.fillna('')
    sql += POLICY_ENTERPRISE_TABLE_INFO
    for i in range(len(df)):
        row = df.iloc[i]
        sql += f"""
INSERT INTO {POLICY_ENTERPRISE_TABLE_NAME} (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        {i} , '{row['统一社会信用代码']}', '{row['企业名称']}', '{row['企业类型']}',
        '{row['行业分布']}', '{row['申报时间']}', '{row['申报项目id']}',
        '{row['申报项目名称']}', '{row['审批是否通过(1是通过，0是不通过)']}',
        '{row['审批通过时间']}', '{row['审批金额']}');
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