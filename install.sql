
DROP DATABASE IF EXISTS linewell;
CREATE DATABASE linewell;
USE linewell;

CREATE TABLE corporate_relocation (
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

INSERT INTO corporate_relocation (
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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
        id, tyxydm, corporate__name, registered_capital, 
        year, output, taxes, is_key_enterprises, 
        key_enterprises_type, employed_num, industry, industry_type, 
        company_type, label, district, street, 
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

DROP USER IF EXISTS 'user';
CREATE USER 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'MySQL123456!';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
FLUSH PRIVILEGES;
