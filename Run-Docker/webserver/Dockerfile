FROM linukey/webserver

# 该 Dockerfile 片段展示了基于 linukey/webserver 镜像构建自定义 Docker 镜像的过程。
# 在这个过程中，您复制了两个文件到镜像中（server-tool.tgz 和 start-server.sh），
# 解压了 server-tool.tgz，更新了包索引，安装了 python3-pip，使用 pip3 安装了 requests 库，并创建了一个符号链接。

# 注意：将文件复制到镜像的根目录（/）通常不是最佳实践，因为这可能会导致不必要的文件暴露或权限问题。
COPY server-tool.tgz /
COPY start-server.sh /

# 注意：在 RUN 指令中使用 cd 命令通常不是最佳实践，因为 cd 的效果仅在当前 RUN 指令的上下文中有效，不会影响到后续的 RUN、CMD 或 ENTRYPOINT 指令。
RUN cd / \
&&  tar -xzvf server-tool.tgz \
&&  rm server-tool.tgz \
&&  apt-get update \
&&  apt-get install python3-pip -y \
&&  pip3 install requests \
&&  cd /usr/lib \
&&  ln -s /usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/libpython3.5.so libpython3.5.so
