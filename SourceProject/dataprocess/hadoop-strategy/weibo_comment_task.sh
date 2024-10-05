TASK_NAME=weibo_comment

# 该脚本片段是用于在Hadoop集群上运行一个流处理作业的Bash脚本。
# 这个作业的目的是处理存储在HDFS（Hadoop Distributed File System）上的微博评论数据。
# TASK_NAME：作业的名称，这里设置为weibo_comment。

# HADOOP：Hadoop客户端的完整路径。
HADOOP=/home/users/chenguodong02/influence/hadoop-client/hadoop/bin/hadoop
# INPUT：输入数据的HDFS路径。
INPUT=/user/ccdb/rd/chenguodong02/weibo/input
# OUTPUT：输出数据的HDFS路径
OUTPUT=/user/ccdb/rd/chenguodong02/weibo/output

# 使用$HADOOP fs -rmr ${OUTPUT}命令删除之前可能存在的输出目录，以避免作业失败。
$HADOOP fs -rmr ${OUTPUT}

# 运行Hadoop Streaming作业：
$HADOOP streaming \
    # -input和-output：指定输入和输出目录。
    -input "${INPUT}" \
	-output "${OUTPUT}" \
    # -jobconf：设置作业的多个配置参数，如作业名称、优先级、最大允许的Reduce任务失败百分比、Map和Reduce任务的容量和数量。
    -jobconf mapred.job.name="$TASK_NAME" \
    -jobconf mapred.job.priority="HIGH" \
    -jobconf mapred.max.reduce.failures.percent="10" \
    -jobconf mapred.job.map.capacity="50" \
    -jobconf mapred.map.tasks="50" \
    -jobconf mapred.job.reduce.capacity="50" \
    -jobconf mapred.reduce.tasks="50" \
    # -inputformat：指定输入格式，这里使用NLineInputFormat来按行分割输入数据。
    -inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \
    # -file：将本地文件上传到HDFS，并在作业执行时分发到各个节点。
    -file comment_strategy.py \
    -file weibocomment.py \
    -file weibouser.py \
    -file red.sh \
    # -cacheArchive：缓存一个归档文件，并在作业执行时解压到工作目录。这里的.表示解压到当前工作目录的根。
    -cacheArchive /user/ccdb/rd/chenguodong02/python.tgz#. \
    # -mapper和-reducer：指定Mapper和Reducer脚本或命令。
    # 这里Mapper简单地使用cat命令（这通常不是处理数据的有效方式），而Reducer使用red.sh脚本。
    -mapper "cat" \
    -reducer "red.sh"
