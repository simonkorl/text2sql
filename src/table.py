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