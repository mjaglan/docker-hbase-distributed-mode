#!/bin/bash

echo "HADOOP SERVICES"
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

echo "RUN jps - Java Virtual Machine Process Status Tool"
jps -lm

echo "Get basic filesystem information and statistics."
hdfs dfsadmin -report

echo "HBASE SERVICES"
$HBASE_HOME/bin/start-hbase.sh

echo "RUN jps - Java Virtual Machine Process Status Tool"
jps -lm

echo "Give HMaster some time to initialize"
sleep 7s

# LINK: https://stackoverflow.com/a/39664156
echo "Get basic HBASE status from $(hostname)"
echo -e 'status' | $HBASE_HOME/bin/hbase shell

# LINK: https://www.cloudera.com/documentation/enterprise/5-9-x/topics/cdh_ig_hbase_tools.html
# LINK: https://intellipaat.com/tutorial/hbase-tutorial/performance-tunning/
# echo "HBase Read Benchmark: using 3 threads"
# time hbase org.apache.hadoop.hbase.PerformanceEvaluation  randomRead 3

# echo "HBase Write Benchmark: using 3 threads and no MapReduce"
# time hbase org.apache.hadoop.hbase.PerformanceEvaluation --nomapred randomWrite 3
