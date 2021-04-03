
`cd /tmp && wget http://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.2.0/kafka_2.12-2.2.0.tgz`  
`tar -xzvf kafka_2.12-2.2.0.tgz -C /usr/local`  






<br><br>

`vim /usr/local/kafka_2.12-2.2.0/config/server.properties`  
```
broker.id=1
log.dirs=data/kafka-logs
```









<br><br>

```
#advertised.listeners=PLAINTEXT://your.host.name:9092
```
your.host.name 用公网 IP





<br><br>

`cd /usr/local/kafka_2.12-2.2.0`  

`bin/kafka-server-start.sh config/server.properties` : 常规模式启动  
`nohup bin/kafka-server-start.sh config/server.properties >/dev/null 2>&1 &` : 进程守护模式启动
 
`/usr/local/kafka_2.12-2.2.0/bin/kafka-server-stop.sh` : Kafka 关闭命令  