#!/bin/bash

# 该 Bash 脚本片段执行了几个关键步骤来构建和运行一个服务器应用。

# cd 命令用于更改当前工作目录到 ./SourceProject/server-tool。这里的 ./ 表示当前目录，但通常可以省略，因为 cd 默认在当前目录下查找路径
cd ./SourceProject/server-tool
# 这一行调用了 build.sh 脚本，该脚本可能包含构建服务器应用的步骤。
sh build.sh
# 这一行执行了 run_server 可执行文件，该文件可能负责启动服务器。
./run_server
