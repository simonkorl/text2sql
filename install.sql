
DROP DATABASE IF EXISTS linewell;
CREATE DATABASE linewell;
USE linewell;

CREATE TABLE corporate_relocation (
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

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        0 , '', '中原金融投资集团有限公司', '1500', 
        '2022', '5000', '1000', '1', 
        'B', '1000', '批发和零售业', '新一代电子信息', 
        '内资企业', '国家高新技术企业', '南山区', '科技园街道', 
        '10', '1000万', '1', '1', 
        '1', '迁出', '经营成本日益上涨', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        1 , '', '宏基建筑工程有限公司', '1000', 
        '2022', '2000', '800', '1', 
        'B', '600', '信息传输、软件和信息技术服务业', '数字与时尚', 
        '内资企业', '国家高新技术企业', '龙岗区', '平湖街道', 
        '6', '500万', '1', '1', 
        '1', '迁出', '资金紧张', '有', 
        '市内');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        2 , '', '蓝海制药有限公司', '1500', 
        '2022', '1500', '600', '1', 
        'B', '300', '制造业', '高端制造装备', 
        '内资企业', '国家高新技术企业', '龙华区', '观湖街道', 
        '5', '300万', '1', '1', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        3 , '', '华腾汽车有限公司', '1000', 
        '2022', '5000', '1200', '1', 
        'C', '900', '批发和零售业', '绿色低碳', 
        '集团', '规模以上工业', '龙华区', '观湖街道', 
        '12', '1500万', '1', '1', 
        '1', '迁出', '原材料价格上涨', '有', 
        '市内');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        4 , '', '清峰影视投资有限公司', '500', 
        '2022', '1500', '500', '1', 
        'A', '200', '制造业', '新材料', 
        '内资企业', '国家高新技术企业', '南山区', '蛇口街道', 
        '4', '200万', '0', '0', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        5 , '', '泰山电子商务有限公司', '500', 
        '2022', '800', '300', '1', 
        'C', '100', '科学研究和技术服务业', '生物医药与健康', 
        '内资企业', '四上企业,规模以上工业,国家高新技术企业', '福田区', '新洲街道', 
        '2', '100万', '0', '1', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        6 , '', '安达物流有限公司', '50', 
        '2022', '4000', '800', '1', 
        'B', '500', '信息传输、软件和信息技术服务业', '海洋经济', 
        '三来一补', '国家高新技术企业', '宝安区', '福永街道', 
        '8', '1200万', '1', '1', 
        '1', '迁出', '原材料价格上涨', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        7 , '', '东方汇金股份有限公司', '50', 
        '2022', '10000', '1500', '1', 
        'C', '800', '科学研究和技术服务业', '新一代电子信息', 
        '其他类型', '四上企业,限额以上批发和零售业', '南山区', '科技园南区', 
        '10', '2000万', '1', '1', 
        '1', '迁出', '原材料价格上涨', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        8 , '', '鼎瑞物业服务有限公司', '2000', 
        '2022', '3000', '1000', '1', 
        'B', '200', '批发和零售业', '高端制造装备', 
        '内资企业', '四上企业,规模以上工业', '龙华区', '龙华街道', 
        '4', '500万', '1', '1', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        9 , '', '华远智汇科技有限公司', '1500', 
        '2022', '20000', '4000', '1', 
        'B', '1500', '批发和零售业', '绿色低碳', 
        '内资企业', '四上企业,限额以上住宿和餐饮业', '南山区', '科技园南区', 
        '20', '5000万', '1', '1', 
        '1', '迁出', '资金紧张', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        10 , '', '泽锋餐饮管理有限公司', '1000', 
        '2022', '1000', '300', '0', 
        '', '50', '批发和零售业', '高端制造装备', 
        '内资企业', '四上企业', '罗湖区', '翠竹街道', 
        '2', '200万', '0', '1', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        11 , '', '元珺生物科技有限公司', '500', 
        '2022', '2000', '500', '1', 
        'B', '300', '批发和零售业', '新材料', 
        '内资企业', '四上企业,规模以上服务业', '龙华区', '观澜街道', 
        '6', '1000万', '1', '0', 
        '1', '迁出', '原材料价格上涨', '有', 
        '市内');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        12 , '', '宏润航空科技有限公司', '500', 
        '2022', '5000', '1200', '1', 
        'B', '800', '批发和零售业', '生物医药与健康', 
        '内资企业', '四上企业,限额以上批发和零售业,国家高新技术企业', '南山区', '科技园南区', 
        '10', '1500万', '1', '1', 
        '1', '迁出', '经营成本日益上涨', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        13 , '', '汇天电子有限公司', '50', 
        '2022', '6000', '1500', '1', 
        'C', '700', '制造业', '海洋经济', 
        '三来一补', '四上企业,规模以上服务业', '福田区', '新洲街道', 
        '8', '2000万', '1', '1', 
        '1', '迁出', '资金紧张', '有', 
        '市内');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        14 , '', '优家装饰设计有限公司', '50', 
        '2022', '800', '300', '1', 
        'A', '100', '批发和零售业', '高端制造装备', 
        '内资企业', '国家高新技术企业', '宝安区', '福永街道', 
        '2', '100万', '0', '1', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        15 , '', '天空能源科技有限公司', '2000', 
        '2022', '10000', '2000', '1', 
        'C', '1000', '批发和零售业', '绿色低碳', 
        '内资企业', '国家高新技术企业', '南山区', '高新园南区', 
        '12', '3000万', '1', '1', 
        '1', '迁出', '原材料价格上涨', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        16 , '', '兴华实业集团有限公司', '500', 
        '2022', '2000', '800', '0', 
        '', '600', '制造业', '新材料', 
        '外商投资企业', '四上企业,规模以上工业', '龙岗区', '平湖街道', 
        '6', '500万', '1', '1', 
        '1', '迁出', '原材料价格上涨', '有', 
        '市内');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        17 , '', '梦想科技股份有限公司', '300', 
        '2022', '5000', '1000', '1', 
        'B', '800', '批发和零售业', '生物医药与健康', 
        '港、澳、台投资企业', '四上企业,国家高新技术企业', '南山区', '科技园南区', 
        '10', '1500万', '1', '1', 
        '1', '迁出', '供应链影响', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        18 , '', '恒康医疗器械有限公司', '3000', 
        '2022', '3000', '800', '1', 
        'C', '300', '批发和零售业', '海洋经济', 
        '内资企业', '商贸服务业百强企业,四上企业,限额以上批发和零售业', '福田区', '福保街道', 
        '6', '1000万', '1', '1', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        19 , '', '鑫顺物流有限公司', '200', 
        '2022', '2000', '500', '1', 
        'A', '200', '信息传输、软件和信息技术服务业', '新一代电子信息', 
        '内资企业', '四上企业,规模以上工业,省级专精特新企业,国家高新技术企业', '宝安区', '西乡街道', 
        '4', '500万', '1', '0', 
        '1', '迁出', '原材料价格上涨', '有', 
        '市内');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        20 , '', '丰儿教育集团有限公司', '50', 
        '2022', '8000', '2000', '1', 
        'B', '500', '住宿和餐饮业', '高端制造装备', 
        '内资企业', '国家高新技术企业', '南山区', '蛇口街道', 
        '10', '1500万', '1', '1', 
        '1', '迁出', '资金紧张', '有', 
        '市外');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        21 , '', '盛泰贸易有限公司', '2000', 
        '2022', '300', '100', '1', 
        'C', '50', '信息传输、软件和信息技术服务业', '绿色低碳', 
        '内资企业', '四上企业,规模以上工业,国家高新技术企业', '龙华区', '观澜街道', 
        '2', '50万', '0', '1', 
        '1', '迁入', '无', '无', 
        '无');

INSERT INTO corporate_relocation (
        id, tyxydm, enterprise_name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        enterprise_type, label, district, street, 
        declaration_num, disbursed_funds, is_interview, is_reporting_line, 
        is_commitment_not_relocate, relocation_type, relocation_reason, is_relocation_warning, 
        relocation_location) VALUES (
        22 , '', '巨星传媒集团有限公司', '500', 
        '2022', '5000', '1200', '1', 
        'C', '800', '建筑业', '高端制造装备', 
        '内资企业', '四上企业,规模以上服务业,国家高新技术企业', '南山区', '科技园南区', 
        '8', '1500万', '1', '1', 
        '1', '迁出', '缺原材料', '有', 
        '市外');

CREATE TABLE policy_projects (
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

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        0 , '03AB003002', '会展企业成长奖励', '1', 
        '1', '区工业和信息化局', '1', '秒批', 
        '1', '1', '250000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        1 , '03AB003003', '科技项目配套奖励', '0', 
        '0', '区科技创新局', '0', '秒批', 
        '1', '0', '0');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        2 , '03AB003006', '2022年商贸业企业纾困发展补贴项目', '1', 
        '1', '区工业和信息化局', '2', '人工', 
        '0', '2', '200000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        3 , '03AB003008', '新引进制造业企业落户奖励', '4', 
        '0', '投资推广署', '0', '秒批', 
        '1', '0', '0');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        4 , '03AB003009', '博士后工作站（创新实践基地）日常经费补助', '0', 
        '0', '区人力资源局', '0', '秒批', 
        '1', '0', '0');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        5 , '03AB003010', '新引进零售业企业落户奖励', '1', 
        '1', '投资推广署', '3', '秒批', 
        '1', '3', '100000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        6 , '03AB003011', '新引进总部企业落户奖励', '1', 
        '1', '投资推广署', '8', '人工', 
        '0', '6', '1600000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        7 , '03AB003012', '加强企业落户空间保障', '1', 
        '1', '投资推广署', '5', '人工', 
        '0', '4', '1000000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        8 , '03AB003013', '支持企业技改投资倍增', '1', 
        '1', '区工业和信息化局', '8', '秒批', 
        '1', '6', '800000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        9 , '03AB003014', '2022年度深圳高新区发展专项计划品牌建设项目', '1', 
        '1', '区科技创新局', '6', '人工', 
        '0', '6', '300000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        10 , '03AB003015', '龙头企业奖励', '0', 
        '0', '市市场监督管理局宝安监管局', '0', '秒批', 
        '1', '0', '0');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        11 , '03AB003018', '博士后工作的工作站（创新实践基地、合作研究基地）建设配套资助', '1', 
        '1', '区人力资源局', '6', '人工', 
        '0', '6', '300000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        12 , '03AB003020', '“四上企业”租金补贴奖励', '1', 
        '1', '投资推广署', '7', '秒批', 
        '1', '7', '700000');

INSERT INTO policy_projects (
        id, project_id, project_name, publish_status, 
        is_started, publish_department, applicant_count, approval_type, 
        is_quick_approval, approved_count, approval_amount) VALUES (
        13 , '03AB003021', '金融科技创新企业落户奖励', '1', 
        '1', '区工业和信息化局', '8', '人工', 
        '0', '6', '800000');

CREATE TABLE policy_enterprise (
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

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        0 , '91310115MA1MUWJ018', '中原金融投资集团有限公司', '内资企业',
        '批发和零售业', '2022/10/12', '03AB003002',
        '会展企业成长奖励', '1',
        '2022/10/15', '250000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        1 , '91440300MA59QC1907', '宏基建筑工程有限公司', '内资企业',
        '信息传输、软件和信息技术服务业', '2022/10/13', '03AB003002',
        '会展企业成长奖励', '1',
        '2022/10/16', '250000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        2 , '91320106MA1U9LX18F', '蓝海制药有限公司', '内资企业',
        '制造业', '2022/1/15', '03AB003002',
        '会展企业成长奖励', '1',
        '2022/1/29', '250000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        3 , '91420100MA488U4Y4N', '华腾汽车有限公司', '集团',
        '批发和零售业', '2022/2/11', '03AB003003',
        '科技项目配套奖励', '1',
        '2022/2/18', '250000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        4 , '91330108MA2Q8Q1Y3U', '清峰影视投资有限公司', '内资企业',
        '制造业', '2022/3/9', '03AB003003',
        '科技项目配套奖励', '1',
        '2022/3/14', '225000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        5 , '914403007172045X3T', '泰山电子商务有限公司', '内资企业',
        '科学研究和技术服务业', '2022/4/10', '03AB003002',
        '会展企业成长奖励', '0',
        '', '0');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        6 , '91350100MA34G5TF7J', '安达物流有限公司', '三来一补',
        '信息传输、软件和信息技术服务业', '2022/5/19', '03AB003002',
        '会展企业成长奖励', '1',
        '2022/5/24', '100000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        7 , '91430111MA4KWWW6X8', '东方汇金股份有限公司', '其他类型',
        '科学研究和技术服务业', '2022/6/14', '03AB003002',
        '会展企业成长奖励', '1',
        '2022/6/18', '200000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        8 , '91340113MA2EKMYW62', '鼎瑞物业服务有限公司', '内资企业',
        '批发和零售业', '2022/7/18', '03AB003008',
        '新引进制造业企业落户奖励', '0',
        '', '0');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        9 , '91440300MA5RR6TW1C', '华远智汇科技有限公司', '内资企业',
        '批发和零售业', '2022/8/21', '03AB003008',
        '新引进制造业企业落户奖励', '1',
        '2022/8/28', '200000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        10 , '913201065361UQDYXX', '泽锋餐饮管理有限公司', '内资企业',
        '批发和零售业', '2022/9/13', '03AB003009',
        '博士后工作站（创新实践基地）日常经费补助', '1',
        '2022/9/18', '200000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        11 , '91450100MA5B0HU91K', '元珺生物科技有限公司', '内资企业',
        '批发和零售业', '2023/1/7', '03AB003010',
        '新引进零售业企业落户奖励', '1',
        '2023/1/15', '100000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        12 , '91310100MA1UM5J82L', '宏润航空科技有限公司', '内资企业',
        '批发和零售业', '2023/2/19', '03AB003011',
        '新引进总部企业落户奖励', '1',
        '2023/2/24', '50000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        13 , '914201007177116000', '汇天电子有限公司', '三来一补',
        '制造业', '2023/3/14', '03AB003012',
        '加强企业落户空间保障', '1',
        '2023/3/19', '200000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        14 , '91330113MA2ETF676W', '优家装饰设计有限公司', '内资企业',
        '批发和零售业', '2023/4/18', '03AB003013',
        '支持企业技改投资倍增', '1',
        '2023/4/23', '50000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        15 , '91440101MA52LXYG9H', '天空能源科技有限公司', '内资企业',
        '批发和零售业', '2023/5/15', '03AB003014',
        '2022年度深圳高新区发展专项计划品牌建设项目', '1',
        '2023/5/21', '100000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        16 , '91340114MA2EE6F186', '兴华实业集团有限公司', '外商投资企业',
        '制造业', '2023/6/13', '03AB003015',
        '龙头企业奖励', '0',
        '', '0');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        17 , '91440300MA5C9K5A26', '梦想科技股份有限公司', '港、澳、台投资企业',
        '批发和零售业', '2023/7/17', '03AB003002',
        '会展企业成长奖励', '1',
        '2023/7/25', '100000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        18 , '91350115MA35CBYB2B', '恒康医疗器械有限公司', '内资企业',
        '批发和零售业', '2023/8/25', '03AB003018',
        '博士后工作的工作站（创新实践基地、合作研究基地）建设配套资助', '1',
        '2023/8/30', '100000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        19 , '91430102MA5E8D4W5Y', '鑫顺物流有限公司', '内资企业',
        '信息传输、软件和信息技术服务业', '2023/9/18', '03AB003018',
        '博士后工作的工作站（创新实践基地、合作研究基地）建设配套资助', '1',
        '2023/9/25', '50000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        20 , '9132110030401H8B3L', '丰儿教育集团有限公司', '内资企业',
        '住宿和餐饮业', '2023/10/19', '03AB003020',
        '“四上企业”租金补贴奖励', '0',
        '', '0');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        21 , '91450105MA5PJQQ11W', '盛泰贸易有限公司', '内资企业',
        '信息传输、软件和信息技术服务业', '2023/11/17', '03AB003002',
        '会展企业成长奖励', '1',
        '2023/11/20', '200000');

INSERT INTO policy_enterprise (
        id, tyxydm, enterprise_name, enterprise_type, 
        industry_distribution, declaration_date, declaration_project_id,
        declaration_project_name, is_approved,
        approved_date, approval_amount ) VALUES (
        22 , '91310111MA1RTQMJ49', '巨星传媒集团有限公司', '内资企业',
        '建筑业', '2023/12/14', '03AB003021',
        '金融科技创新企业落户奖励', '1',
        '2023/12/25', '200000');

DROP USER IF EXISTS 'user';
CREATE USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'MySQL123456!';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
FLUSH PRIVILEGES;
