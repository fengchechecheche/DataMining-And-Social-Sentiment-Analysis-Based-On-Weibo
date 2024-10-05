SOURCE_NAME="../SourceProject/spider"
PACK_NAME="spider/weibo_client/spider.tgz"

# 该 Bash 脚本片段旨在创建两个压缩包：一个是关于 spider 项目的，另一个是关于 webserver 及其相关工具的。

rm ${PACK_NAME} 2>/dev/null
tar -zcvf  ${PACK_NAME} ${SOURCE_NAME}

# 存在问题（1）：在创建第二个压缩包时，SOURCE_NAME 变量被重新赋值为包含多个目录的字符串，但这与 tar 命令的使用方式不兼容，
# 因为 tar 命令期望源目录是一个单独的参数，而不是由空格分隔的多个目录列表（除非您使用了一些特殊选项，如 -C 来改变目录）。
# 存在问题（2）：第二个 PACK_NAME 设置为 webserver/server-tool.tgz，
# 但 SOURCE_NAME 包含了多个与 webserver 相关的目录以及不相关的目录（如 proxymanager, spidermanager, utils）。
# 这可能会导致混淆，因为压缩包的名字暗示它只包含 server-tool，但实际上可能包含更多。
SOURCE_NAME="../SourceProject/server-tool ../SourceProject/proxymanager ../SourceProject/spidermanager ../SourceProject/utils"
PACK_NAME="webserver/server-tool.tgz"

rm ${PACK_NAME} 2>/dev/null
tar -zcvf  ${PACK_NAME} ${SOURCE_NAME}
