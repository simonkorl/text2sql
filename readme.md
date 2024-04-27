# text2sql 测试仓库

由 wangtz19 实现的 text2sql 运行与测试的仓库

需求：准备一个 openai gpt4 和 gpt3.5 的 key。分别放在 .openai-key-gpt3.5 和 .openai-key-gpt4 文件中

## 部分使用说明

1. 这个测试仓库需要搭配 mysql 数据库进行使用。首先运行 install.py 得到 install.sql，之后运行类似 `mysql -uroot -p < install.sql` 的命令录入对应数据库。这个时候如果出现关于 id 的报错，则请删掉 install.sql 中 id 一行最后的 AUTO_INCREMENT