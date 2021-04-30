
ZooKeeper：https://github.com/apache/zookeeper  







#### 优点

- 非阻塞 全部 快照（达成 最终一致）
- 高效的 内存管理
- 高可靠
- API 简单
- 连接管理 可以 自动重试
- ZooKeeper recipes 的实现 是经过完整良好的测试的。
- 有一套框架 使得写新的 ZooKeeper recipes 非常简单。
- 支持 监听事件
- 发生 网络分区时，各个区 都会开始选举 leader，那么节点数少 的那个分区 将会停止运行。




#### 缺点

- zookeeper 是 java 写的，那么自然就会继承 java 的缺点，例如 GC 暂停。
- 如果开启了快照，数据会写入磁盘，此时 zookeeper 的读写操作 会有一个暂时的停顿。
- 对于每个 watch 请求，zookeeper 都会打开一个新的 socket 连接，这样 zookeeper 就需要 实时管理 很多 socket 连接，比较复杂。
- 需要自行 实现心跳（或者用SDK）

