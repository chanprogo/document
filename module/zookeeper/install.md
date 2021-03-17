
# 安装 ZooKeeper 3.4.9


`mkdir -p /usr/local/services/zookeeper && cd /usr/local/services/zookeeper`

`wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz`  
`tar -zxvf zookeeper-3.4.9.tar.gz`

`cd zookeeper-3.4.9/conf/`  
`cp zoo_sample.cfg zoo.cfg`  
`vim zoo.cfg`

```
dataDir=/usr/local/services/zookeeper/zookeeper-3.4.9/data

dataLogDir=/usr/local/services/zookeeper/zookeeper-3.4.9/logs

server.1=172.24.18.64:2888:3888
server.2=172.24.18.65:2888:3888
server.3=172.24.18.66:2888:3888

```

`mkdir /usr/local/services/zookeeper/zookeeper-3.4.9/data && mkdir /usr/local/services/zookeeper/zookeeper-3.4.9/logs`

在dataDir目录中，创建一个名为myid的文件，并写入机器对应的数字值，即集群中sever.1=zoo-1:2888:3888中server.后对应的数字。  
`echo "1" > /usr/local/services/zookeeper/zookeeper-3.4.9/data/myid` 





---
`vim /etc/profile`  

并在其尾部追加如下内容：
```
export ZOOKEEPER_HOME=/usr/local/services/zookeeper/zookeeper-3.4.9/
export PATH=$ZOOKEEPER_HOME/bin:$PATH
export PATH
```
`source /etc/profile`

---

`cd ../bin/`  
`./zkServer.sh start`  
`./zkServer.sh status`  
`./zkServer.sh stop`  
`./zkServer.sh restart`


`/usr/local/services/zookeeper/zookeeper-3.4.9/bin/zkServer.sh start`


`/usr/local/services/zookeeper/zookeeper-3.4.9/bin/zkCli.sh -server 127.0.0.1:2181`