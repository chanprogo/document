


Kafka 是 分布式 发布-订阅 消息系统，它最初是由 LinkedIn 公司开发的，之后成为 Apache 项目的一部分，  
Kafka 是一个分布式，可划分的，冗余备份的  持久性的 日志服务，它主要用于  处理流式数据。   




kafka 作为 一个 消息队列 中间件 提供了 发布订阅模式（也有 点对点模式），也就是  设计模式 中  的生产者消费者模式。就是 producer 和 consumer ，  
由于消息太多 需要分类，所以出现了 topic 消息主题，也理解为 消息类型 进行分类，  
producer 生产的消息 可以 根据 消息类型 发布到 不同 topic，由 不同的 consumer 订阅 进行消费，这样 就组成了 一个 基本可用的 消息队列 中间件。   







但是 单点问题 出现了，为了 解决 单点问题，引入了 broker 概念。  

一个 Kafka 实例 就叫做一个 broker，单机，多机 部署 出现多个 broker 成为一个 kafka 集群。  
每个 topic 把自己复制到 所在 broker 以外的 broker，复制出来的 topic 叫做副本 replica， 多份 一样的 topic 就可以 用来 解决单点问题。  

当然，为了管理这些 topic 引入了 zk（以 topic 维度 的主从），选举出 leader 和 follower，  
leader 会向 follower 复制 topic 数据，leader 会和 consumer 和 leader 打交道，而 follower 不会 仅做备份，并且 当一台 broker 挂掉后 会重新选举 新的 leader  
（这时 因为 已经同步好 topic 就可以马上接力 成为 leader）






解决了 单机问题后 出现了 性能问题，一个 Topic 如果数据 非常多时，会严重 影响性能 及吞吐量。所以 就出现了 类似 分库分表 的概念，就是分区 partition。  
就一个 topic 可以 把 消息内容 拆分 多个平行的 子 topic 提供 给到外面 进行消费。  
当然，topic 分区后，consumer 也可以 进一步 拆分成 和分区一样的 数量 去消费，也就是 消费组。   









## 为什么要使用 kafka，为什么要使用消息队列  

1. 缓冲和削峰： 上游数据 时有 突发流量，下游可能扛不住，或者下游没有足够多的机器 来保证冗余，kafka 在中间可以起到一个缓冲的作用，把消息暂存在 kafka中，下游服务 就可以按照自己的节奏 进行慢慢处理。  
2. 解耦 和 扩展性：    项目开始的时候，并不能确定 具体需求。消息队列 可以作为一个接口层，解耦 重要的业务流程。  只需要遵守约定，针对数据编程 即可获取扩展能力。  
3. 冗余：可以采用 一对多的方式，一个生产者 发布消息，可以被多个订阅 topic 的服务消费到，供多个毫无关联的业务使用。  
4. 健壮性：消息队列 可以堆积请求，所以消费端业务 即使短时间死掉，也不会影响 主要业务的正常进行。  
5. 异步通信：很多时候，用户不想也不需要 立即处理消息。消息队列 提供了异步处理机制，允许用户 把一个消息放入队列，但并不立即 处理它。想向队列中 放入多少消息 就放多少，然后在需要的时候 再去处理它们。   






## Kafka 中的 ISR、AR 又代表什么？ ISR 的伸缩又指什么

ISR（In-Sync Replicas） 副本同步队列  
AR（Assigned Replicas） 所有副本  

ISR 是由 leader 维护， follower 从 leader 同步数据 有一些延迟（包括延迟时间 replica.lag.time.max.ms 和 延迟条数 replica.lag.max.messages 两个维度, 当前最新的版本 0.10.x 中只支持 replica.lag.time.max.ms 这个维度），任意一个超过阈值都会把 follower 剔除出 ISR, 存入 OSR（Outof-Sync Replicas） 列表，新加入的follower 也会 先存放在 OSR 中。 

AR=ISR+OSR。   




## kafka 中的 broker 是干什么的  

broker 是消息的代理，
Producers 往 Brokers 里面的 指定 Topic 中 写消息，
Consumers 从 Brokers 里面 拉取 指定 Topic 的消息，然后进行 业务处理，
broker 在中间起到一个代理 保存消息的 中转站。



## kafka中的 zookeeper 起到什么作用，可以不用zookeeper么

zookeeper 是一个分布式的协调组件，早期版本的 kafka 用 zk 做 meta 信息存储，consumer 的消费状态，group 的管理 以及 offset 的值。  
考虑到 zk 本身的 一些因素 以及整个架构 较大概率 存在单点问题，新版本中 逐渐弱化了 zookeeper 的作用。  

新的 consumer 使用了 kafka 内部的 group coordination 协议，也减少了对 zookeeper 的依赖，

但是 broker 依然依赖于 ZK，zookeeper 在 kafka 中还用来选举 controller 和 检测 broker 是否 存活等等。




## kafka follower 如何与 leader 同步数据

Kafka 的复制机制 既不是 完全的 同步复制，也不是 单纯的 异步复制。  
完全同步复制 要求 All Alive Follower 都复制完，这条消息 才会被 认为 commit，这种复制方式 极大的 影响了吞吐率。
而异步复制方式下，Follower 异步的 从 Leader 复制数据，数据只要被 Leader 写入 log 就被认为 已经 commit，这种情况下，如果 leader 挂掉，会丢失数据，
kafka 使用 ISR 的方式 很好的均衡了 确保数据不丢失以及吞吐率。  
Follower 可以批量的 从 Leader 复制数据，而且 Leader 充分利用 磁盘顺序 读 以及 send file（zero copy）机制，这样 极大的 提高复制性能，内部 批量写磁盘，大幅减少了Follower 与 Leader 的消息量差。





## 什么情况下一个 broker 会从 isr 中踢出去

leader 会维护 一个 与其 基本保持同步的 Replica 列表，该列表称为 ISR（in-sync Replica)，
每个 Partition 都会有一个 ISR，而且是由 leader 动态维护，
如果一个 follower 比一个 leader 落后太多，或者超过一定时间 未发起 数据复制请求，则 leader 将其从 ISR 中移除 。






## kafka 为什么那么快

1. Cache Filesystem Cache PageCache 缓存
2. 顺序写 由于现代的 操作系统 提供了 预读和写技术，磁盘的顺序写 大多数情况下 比 随机写 内存还要快。
3. Zero-copy 零拷技术 减少拷贝次数
4. Batching of Messages 批量处理。合并小的请求，然后 以流的方式进行交互，直顶网络上限。
5. Pull 拉模式 使用拉模式 进行消息的 获取消费，与消费端 处理能力相符。




## kafka producer 如何优化 打入速度

1. 增加线程
2. 提高 batch.size
3. 增加更多 producer 实例
4. 增加 partition 数
5. 设置 acks=-1 时，如果延迟增大：可以增大 num.replica.fetchers（follower 同步数据的线程数）来调解；
6. 跨数据中心 的传输：增加 socket 缓冲区 设置 以及 OS tcp 缓冲区设置。







## kafka producer 打数据， ack 为 0， 1， -1 的时候代表啥， 设置 -1 的时候，什么情况下，  leader 会认为一条消息 commit 了

1（默认） 数据发送到 Kafka 后，经过 leader 成功接收消息 的 确认，就算是 发送成功了。在这种情况下，如果 leader 宕机了，则会丢失数据。
0 生产者将数据发送出去就不管了，不去等待任何返回。这种情况下数据传输效率最高，但是数据可靠性确是最低的。

-1 producer 需要等待 ISR 中的所有 follower 都确认 接收到 数据后 才算一次 发送完成，可靠性最高。
当 ISR 中所有 Replica 都向 Leader 发送 ACK 时，leader 才 commit，  这时候 producer 才能认为一个请求中 的消息都 commit 了。







## kafka  unclean 配置代表啥，会对 spark streaming 消费有什么影响

unclean.leader.election.enable 为 true 的话，
意味着 非 ISR 集合 的 broker 也可以参与选举，这样有可能就会 丢数据，

spark streaming 在消费过程中 拿到的 end offset 会突然变小，导致 spark streaming job 挂掉。
如果 unclean.leader.election.enable 参数设置为 true，就有可能发生数据丢失 和数据不一致的 情况，Kafka 的可靠性就会降低；

而如果 unclean.leader.election.enable 参数设置为 false，Kafka 的可用性就会降低。







## 如果 leader crash 时，ISR 为空怎么办

kafka 在 Broker 端提供了一个配置参数：unclean.leader.election,  
这个参数有两个值：
true（默认）：允许不同步副本成为 leader，由于不同步副本的消息 较为滞后，此时成为 leader，可能会出现 消息不一致的情况。
false：不允许不同步副本成为 leader，此时如果发生 ISR 列表为空，会一直等待旧 leader 恢复，降低了 可用性。





## kafka 的 message 格式是什么样的

一个 Kafka 的 Message 由 一个固定长度的 header 和 一个 变长的消息体 body 组成

header 部分由一个字节的 magic(文件格式) 和 四个字节的 CRC32 （用于判断 body 消息体 是否正常） 构成。
当 magic 的值为 1 的时候，会在 magic 和 crc32 之间多一个字节的数据： 
attributes（保存一些相关属性，比如是否压缩、压缩格式等等）;
如果 magic 的值为 0，那么不存在 attributes 属性

body 是由 N 个字节构成的一个消息体，包含了具体的 key/value 消息









## kafka 中 consumer group 是什么概念

同样是 逻辑上的概念，是 Kafka 实现 单播和广播 两种消息模型的手段。  
同一个 topic 的数据，会广播给 不同的 group；同一个 group 中的 worker，只有一个 worker 能拿到 这个数据。  
换句话说，对于同一个 topic，每个 group 都可以拿到 同样的所有数据，但是数据进入 group 后只能被其中的一个 worker 消费。  
group 内的 worker 可以使用多线程或多进程来实现，  也可以将进程分散在 多台机器上，worker 的数量通常不超过 partition 的数量，
且二者最好保持整数倍 关系，因为 Kafka 在设计时 假定了一个 partition 只能被一个 worker 消费（同一group内）。







## Kafka 中的消息 是否会丢失 和重复消费？

要确定 Kafka 的消息 是否 丢失或重复，从两个方面 分析入手：消息发送 和消息消费。

1. 消息发送  
Kafka 消息发送 有两种方式：同步（sync）和异步（async），默认是 同步方式，可通过 producer.type 属性进行配置。
Kafka 通过配置 request.required.acks 属性 来确认消息的生产：  
0---表示 不进行消息接收 是否成功的确认；  
1---表示 当 Leader 接收成功时 确认；  
-1---表示 Leader 和 Follower 都接收成功时 确认；  
综上所述，有 6 种消息生产的情况，  

下面分情况 来分析消息丢失的场景：  
（1）acks=0，不和 Kafka 集群进行消息接收确认，则当网络异常、缓冲区 满了等情况时，消息可能丢失；  
（2）acks=1、同步模式下，只有 Leader 确认接收成功后 但挂掉了，副本 没有同步，数据 可能丢失；  

2. 消息消费    
Kafka 消息消费有两个 consumer 接口，Low-level API 和 High-level API：  
Low-level API：消费者 自己维护 offset 等值，可以实现 对 Kafka 的完全控制；  
High-level API：封装了对 parition 和 offset 的管理，使用简单；  

如果使用高级接口 High-level API，可能 存在一个问题 就是 当消息消费者 从集群中 把消息取出来、并提交了 新的消息 offset 值后，
还没来得及 消费就挂掉了，那么下次 再消费时之前 没消费成功的消息 就“诡异”的消失了；   

解决办法：  
针对 消息丢失：  
同步模式下，确认机制 设置为-1，即让消息写入 Leader 和 Follower 之后 再确认消息发送成功；  
异步模式下，为防止 缓冲区满，可以在 配置文件 设置 不限制 阻塞超时时间，当缓冲区满时 让生产者一直处于 阻塞状态；

针对 消息重复：  将消息的唯一标识  保存到 外部介质中，每次消费时 判断 是否处理过 即可。     








## 为什么 Kafka 不支持读写分离？

在 Kafka 中，生产者 写入消息、消费者 读取消息 的操作 都是与 leader 副本 进行交互的，从而 实现的 是一种 主写主读 的生产消费模型。

Kafka 并不支持主写 从读，因为主写从读有 2 个很明显的缺点:

(1)数据一致性问题。  
数据 从主节点 转到 从节点 必然会有 一个延时的 时间窗口，这个时间窗口 会导致 主从节点之间的数据 不一致。
某一时刻，在主节点 和 从节点中 A 数据的值都为 X， 之后将主节点中 A 的值修改为 Y，那么在这个变更通知到 从节点之前，应用读取从节点中的 A 数据的值 并不为最新的 Y，由此便产生了数据不一致的问题。

(2)延时问题。  
类似 Redis 这种组件，数据 从写入主节点 到同步至从节点中的过程 需要经历   网络→主节点内存→网络→从节点内存  这几个阶段， 整个过程会耗费一定的时间。 
而在 Kafka 中，主从同步 会比 Redis 更加耗时，它需要经历   网络→主节点内存→主节点磁盘→网络→从节点内存→从节点磁盘   这几个阶段。  
对延时敏感的应用  而言，主写从读的  功能 并不太适用。





## Kafka 中是 怎么体现 消息 顺序性的？

kafka 每个 partition 中 的消息 在写入时 都是有序的，消费时，每个 partition 只能被每一个 group 中的一个消费者消费，
保证了消费时 也是有序的。
整个 topic 不保证有序。  
如果为了保证 topic 整个有序，那么 将 partition 调整为1.












## kafka 如何 实现 延迟队列？

Kafka 并没有使用 JDK 自带的 Timer 或者 DelayQueue 来实现延迟的功能，
而是基于 时间轮 自定义了 一个用于 实现延迟功能 的定时器（SystemTimer）。  

JDK 的 Timer 和 DelayQueue 插入和删除操作的 平均时间复杂度 为 O(nlog(n))，并不能满足 Kafka 的高性能要求，
而基于时间轮 可以 将 插入和删除操作的 时间复杂度 都降为O(1)。  
时间轮 的应用 并非 Kafka 独有，其应用场景 还有很多，在 Netty、Akka、Quartz、Zookeeper 等组件中 都存在 时间轮的踪影。  

底层 使用数组实现，数组中 的每个元素 可以存放 一个 TimerTaskList 对象。
TimerTaskList 是一个 环形 双向链表，在 其中的 链表项 TimerTaskEntry 中 封装了 真正的 定时任务 TimerTask。  


Kafka 中到底是 怎么 推进时间的呢？  
Kafka 中的定时器 借助了 JDK 中的 DelayQueue 来协助 推进时间轮。具体做法 是对于 每个使用到 的 TimerTaskList 都会加入到 DelayQueue 中。
Kafka 中 的 TimingWheel 专门 用来执行 插入和删除 TimerTaskEntry 的操作，而 DelayQueue 专门负责时间推进的 任务。
再试想一下，DelayQueue 中 的第一个 超时任务列表 的 expiration 为 200ms，第二个超时任务 为 840ms，这里获取 DelayQueue 的队头 只需要O(1)的时间复杂度。  
如果采用 每秒定时推进，那么 获取到 第一个 超时的 任务列表时 执行的 200 次 推进中 有 199 次 属于“空推进”，而获取到 第二个 超时任务时 有需要执行 639 次 “空推进”，
这样 会无故 空耗 机器的 性能资源，这里采用 DelayQueue 来辅助 以少量空间 换时间，从而做到了“精准推进”。Kafka 中的定时器 真可谓是 “知人善用”，
用 TimingWheel 做 最擅长的任务 添加和删除 操作，而用 DelayQueue 做 最擅长的时间 推进工作，相辅相成。  
