# Run HBase 1.1.12 on Hadoop 2.7 inside docker container in Multi-Node Cluster mode

## Install Docker CE on Ubuntu

Follow the instructions from [Get Docker CE for Ubuntu](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) page.


## Manage Docker as a non-root user

Follow the instructions from [Post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/#manage-docker-as-a-non-root-user) page.


## How to Run
- Go to your terminal.
- Clone this repository and go inside it
	```
	git clone https://github.com/mjaglan/docker-hbase-distributed-mode.git
	cd docker-hbase-distributed-mode
	```
- Run the following script
	```
	# Here, N = number of slave nodes to create (default value is 3).
	. ./restart-all.sh   N

	```


## After Starting Hadoop System

The [hadoop-services.sh](scripts/hadoop-services.sh) is running following commands after starting Hadoop Multi-Node Cluster -

- Java Virtual Machine Process Status Tool (jps)
	```
   <pid>   <process name>
	142    org.apache.hadoop.hdfs.server.namenode.NameNode
	428    org.apache.hadoop.hdfs.server.namenode.SecondaryNameNode
	579    org.apache.hadoop.yarn.server.resourcemanager.ResourceManager
	```

- Basic Hadoop filesystem information and statistics
	```

	Configured Capacity: 37912903680 (35.31 GB)
	Present Capacity: 11530969088 (10.74 GB)
	DFS Remaining: 11530944512 (10.74 GB)
	DFS Used: 24576 (24 KB)
	DFS Used%: 0.00%
	Under replicated blocks: 0
	Blocks with corrupt replicas: 0
	Missing blocks: 0
	Missing blocks (with replication factor 1): 0

	-------------------------------------------------
	Live datanodes (3):

	...
	```

- Start HBase Services

- Java Virtual Machine Process Status Tool (jps)
	```
   <pid>   <process name>
	1037   org.apache.hadoop.hbase.master.HMaster start
	142    org.apache.hadoop.hdfs.server.namenode.NameNode
	428    org.apache.hadoop.hdfs.server.namenode.SecondaryNameNode
	579    org.apache.hadoop.yarn.server.resourcemanager.ResourceManager
	```


- Get basic HBase status
	```
	HBase Shell; enter 'help<RETURN>' for list of supported commands.
	Type "exit<RETURN>" to leave the HBase Shell
	Version 1.1.12, r2550236ac6193f6da4295ffae3d8b9cafb163283, Sat Aug 12 13:40:24 PDT 2017

	status
	3 servers, 0 dead, 0.6667 average load
	```

- (Optional) HBase Write Performance Evaluation
	```
	INFO  [main] hbase.PerformanceEvaluation: [RandomWriteTest] Summary of timings (ms): [52297]
	INFO  [main] hbase.PerformanceEvaluation: [RandomWriteTest]	Min: 52297ms	Max: 52297ms	Avg: 52297ms
	```

- (Optional) HBase Read Performance Evaluation
	```
	INFO  [main] hbase.PerformanceEvaluation: [RandomReadTest]	Summary of timings (ms): [337290]
	INFO  [main] hbase.PerformanceEvaluation: [RandomReadTest]	Min: 337290ms	Max: 337290ms	Avg: 337290ms
	```
- (Optional) HBase Scan Performance Evaluation
	```
	HBase Performance Evaluation
		Elapsed time in milliseconds=204323
		Row count=1048570
	```


## Web UI

- NameNode can be accessed on browser at [http://CONTAINER-IP:8088/](http://0.0.0.0:8088/)

- Resource Manager can be accessed on browser at [http://CONTAINER-IP:50070/](http://0.0.0.0:50070/)

- Secondary can be accessed on browser at [http://CONTAINER-IP:50090/](http://0.0.0.0:50090/)

- HMaster can be accessed on browser at [http://CONTAINER-IP:16010/](http://0.0.0.0:16010/)


## Tools
```
Docker version 17.06.0-ce
Ubuntu Trusty 14.04 Host OS
Eclipse IDE for Java EE Developers Oxygen (4.7.0)
Eclipse Docker Tooling 3.1.0
```


## Configuration References
- [Apache Hadoop 2.7.3 docs](https://hadoop.apache.org/docs/r2.7.3/)
- [core-default.xml](https://hadoop.apache.org/docs/r2.7.3/hadoop-project-dist/hadoop-common/core-default.xml)
- [hdfs-default.xml](https://hadoop.apache.org/docs/r2.7.3/hadoop-project-dist/hadoop-hdfs/hdfs-default.xml)
- [mapred-default.xml](https://hadoop.apache.org/docs/r2.7.3/hadoop-mapreduce-client/hadoop-mapreduce-client-core/mapred-default.xml)
- [yarn-default.xml](https://hadoop.apache.org/docs/r2.7.3/hadoop-yarn/hadoop-yarn-common/yarn-default.xml)
- [DeprecatedProperties.html](https://hadoop.apache.org/docs/r2.7.3/hadoop-project-dist/hadoop-common/DeprecatedProperties.html)
- [Fully-distributed configuration to fully test HBase](http://hbase.apache.org/book.html#quickstart_fully_distributed)


<!--
## Fix Docker Networking DNS Config

See the article on [Fix Docker's networking DNS config](https://robinwinslow.uk/2016/06/23/fix-docker-networking-dns/)
-->
