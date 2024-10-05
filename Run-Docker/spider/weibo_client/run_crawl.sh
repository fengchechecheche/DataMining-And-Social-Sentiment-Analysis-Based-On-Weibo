#!/bin/bash

# 这是一个 Bash 脚本，用于在 Linux 或类 Unix 系统中执行。
# 该脚本的目的是切换到 /root/SourceProject/spider 目录，并使用 Scrapy 框架运行名为 WeiboComment 的爬虫。

# 注意：在 Docker 容器中，通常不建议以 root 用户身份运行应用，因为这可能会带来安全风险。
# 注意：脚本中硬编码了工作目录 /root/SourceProject/spider，这可能在 Docker 容器中不存在。
cd /root/SourceProject/spider
# 注意：确保 Scrapy 已经在容器中正确安装，并且 WeiboComment 爬虫项目也已经在容器中可用。
# 注意：如果您打算将这个脚本作为容器的入口点，您应该在 Dockerfile 中使用 CMD 或 ENTRYPOINT 指令来指定它。
scrapy crawl WeiboComment
