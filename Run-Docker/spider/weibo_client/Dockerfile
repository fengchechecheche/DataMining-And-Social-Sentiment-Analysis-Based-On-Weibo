# 该 Dockerfile 片段展示了一个基于 linukey/scrapy-redis 镜像的自定义 Docker 镜像的构建过程。
# 这个过程包括复制文件到镜像中、解压文件以及删除临时文件。
FROM linukey/scrapy-redis

COPY spider.tgz /root
# 注意：如果 run_crawl.sh 是一个脚本，需要确保它在容器内有执行权限。
COPY run_crawl.sh /

# 注意：在 RUN 指令中使用 cd 命令通常不是最佳实践，因为 cd 的效果仅在当前 RUN 指令的上下文中有效，不会影响到后续的 RUN、CMD 或 ENTRYPOINT 指令。
# 注意：将文件复制到镜像的根目录（如 /）或 /root 通常不是最佳实践，因为这可能会导致权限问题或不必要的文件暴露。
RUN cd /root \
&&  tar -xzvf spider.tgz \
&&  rm spider.tgz \
