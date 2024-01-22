MYSQL_USER = "user"
MYSQL_PASSWD = "MySQL123456!"
MYSQL_DATABASE = "linewell"
CORPORATE_RELOCATION_TABLE_NAME = "corporate_relocation"
POLICY_PROJECTS_TABLE_NAME = "policy_projects"
POLICY_ENTERPRISE_TABLE_NAME = "policy_enterprise"

CORPORATE_RELOCATION_TABLE_INFO = f"""
CREATE TABLE {CORPORATE_RELOCATION_TABLE_NAME} (
        id INTEGER NOT NULL COMMENT 'id' AUTO_INCREMENT, 
        tyxydm VARCHAR(50) COMMENT '社会统一信用代码', 
        enterprise_name VARCHAR(255) COMMENT '企业名称', 
        registered_capital VARCHAR(255) COMMENT '注册资本（单位:万）', 
        year VARCHAR(255) COMMENT '年份', 
        output VARCHAR(255) COMMENT '产值（万）', 
        taxes VARCHAR(255) COMMENT '税收（万）', 
        is_key_enterprises CHAR(1) COMMENT '重点企业(1是 0不是)', 
        key_enterprises_type CHAR(1) COMMENT '重点企业类别(A,B,C)', 
        employed_num VARCHAR(10) COMMENT '就业人数', 
        industry VARCHAR(255) COMMENT '行业', 
        industry_type VARCHAR(255) COMMENT '产业类型', 
        enterprise_type VARCHAR(255) COMMENT '企业类型', 
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

POLICY_PROJECTS_TABLE_INFO = f"""
CREATE TABLE {POLICY_PROJECTS_TABLE_NAME} (
        id INTEGER NOT NULL COMMENT 'id' AUTO_INCREMENT, 
        project_id VARCHAR(50) COMMENT '政策项目id', 
        project_name VARCHAR(255) COMMENT '项目名称', 
        publish_status CHAR(1) COMMENT '发布状态（1：已发布，0：未发布,2:审核退回,3:待审核,4:审核通过）', 
        is_started CHAR(1) COMMENT '是否启动申报（1:是 0：否）', 
        publish_department VARCHAR(255) COMMENT '发布部门', 
        applicant_count VARCHAR(255) COMMENT '申报企业数', 
        approval_type VARCHAR(255) COMMENT '审批类型', 
        is_quick_approval CHAR(1) COMMENT '是否秒批（1:是 0：否）',
        approved_count VARCHAR(255) COMMENT '审批通过的企业数',
        approval_amount VARCHAR(255) COMMENT '审批金额',
        PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 ENGINE=InnoDB;
"""

POLICY_ENTERPRISE_TABLE_INFO = f"""
CREATE TABLE {POLICY_ENTERPRISE_TABLE_NAME} (
        id INTEGER NOT NULL COMMENT 'id' AUTO_INCREMENT, 
        tyxydm VARCHAR(50) COMMENT '社会统一信用代码',
        enterprise_name VARCHAR(255) COMMENT '企业名称',
        enterprise_type VARCHAR(255) COMMENT '企业类型', 
        industry_distribution VARCHAR(255) COMMENT '行业分布',
        declaration_date VARCHAR(255) COMMENT '申报日期',
        declaration_project_id VARCHAR(50) COMMENT '申报项目id',
        declaration_project_name VARCHAR(255) COMMENT '申报项目名称',
        is_approved CHAR(1) COMMENT '审批是否通过(1是通过，0是不通过)',
        approved_date VARCHAR(255) COMMENT '审批通过日期',
        approval_amount VARCHAR(255) COMMENT '审批金额',
        PRIMARY KEY (id)
) DEFAULT CHARSET=utf8mb4 ENGINE=InnoDB;
"""