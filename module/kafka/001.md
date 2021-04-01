
# Zookeeper 在 Kafka 中的作用

### broker 注册
用来进行 Broker 服务器列表记录的节点：  
`/brokers/ids`  
每个Broker在启动时，都会到 Zookeeper 上进行注册，即到 `/brokers/ids` 下创建属于自己的节点：  
`/brokers/ids/[0...N]`  









<br><br><br><br>

### topic 注册
在 Kafka 中，同一个 Topic 的消息会被分成多个分区并将其分布在多个 Broker 上，这些分区信息及与 Broker 的对应关系也都是由 Zookeeper 在维护，由专门的节点来记录：  
`/brokers/topics`    
`/brokers/topics/[mytopic]`  

Broker 服务器启动后，会到对应 Topic 节点上注册自己的 Broker ID 并写入针对该Topic 的分区总数，如 `/brokers/topics/[mytopic]/3->2`，这个节点表示 Broker ID 为 3 的一个Broker服务器，对于“mytopic”这个 Topic 的消息，提供了 2 个分区进行消息存储。














<br><br><br><br>

### 消费者注册
每个消费者服务器启动时，都会到 Zookeeper 的指定节点下创建一个属于自己的消费者节点：  
`/consumers/[group_id]/ids/[consumer_id]`  
完成节点创建后，消费者就会将自己订阅的 Topic 信息写入该临时节点。


### 消息 消费进度 Offset 记录
在消费者对指定消息分区进行消息消费的过程中，需要定时地将分区消息的消费进度 Offset 记录到 Zookeeper上，以便在该消费者进行重启或者其他消费者重新接管该消息分区的消息消费后，能够从之前的进度开始继续进行消息消费。Offset在Zookeeper中由一个专门节点进行记录，其节点路径为:  
`/consumers/[group_id]/offsets/[topic]/[broker_id-partition_id]`  
节点内容就是Offset的值。



### 分区 与 消费者 的关系
在 Kafka 中，规定了每个消息分区只能被同组的一个消费者进行消费，因此，需要在Zookeeper 上记录消息分区与 Consumer 之间的关系，每个消费者一旦确定了对一个消息分区的消费权力，需要将其 Consumer ID 写入到 Zookeeper 对应消息分区的临时节点上，例如：  

`/consumers/[group_id]/owners/[topic]/[broker_id-partition_id]`  

其中，`[broker_id-partition_id]` 就是一个消息分区的标识，节点内容就是该消息分区上消费者的 Consumer ID。