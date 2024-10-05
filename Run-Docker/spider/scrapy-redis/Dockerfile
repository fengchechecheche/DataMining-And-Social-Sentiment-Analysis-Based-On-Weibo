# 这段 Dockerfile 的内容主要用于创建一个基于 Ubuntu 的 Docker 镜像，
# 该镜像中安装了 Python3、pip3（Python 的包管理工具）、
# vim 编辑器以及 Scrapy 和 scrapy-redis（Scrapy 的一个用于分布式爬取的扩展）。

# 这行指定了基础镜像为 Ubuntu。默认情况下，如果不指定标签，它会使用最新的 Ubuntu 版本。
FROM ubuntu

# install python3 & python3-pip
# 这行开始了一个运行命令，用于更新 Ubuntu 的包索引。
RUN apt update \
# 接下来的两行分别安装了 Python3 和 Python3 的包管理工具 pip3。
&&  apt install python3 -y \
&&  apt install python3-pip -y \
# install vim
# 这行安装了 vim 编辑器。
&&  apt install vim -y \
# install scrapy & scrapy-redis
# 使用 pip3 安装 Scrapy 和 scrapy-redis。
&&  pip3 install scrapy \
&&  pip3 install scrapy-redis \
# clean
# 接下来的两行命令用于清理安装过程中产生的临时文件。
&&  rm -rf /var/lib/apt/lists/* \
&&  apt purge -y --auto-remove python3-pip \
