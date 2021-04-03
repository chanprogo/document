


假设我们有张表，结构如下：  
```
create table user(
  id int(11) not null,
  age int(11) not null,
  primary key(id),
  key(age)
);

```





## 锁的类型

mysql 锁分为 读锁 和 写锁。  

读锁是 共享的，可以通过 lock in share mode 实现，这时候 只能读 不能写。  

写锁是 排他的，它会阻塞其他的 写锁和读锁。
从颗粒度 来区分，可以分为 表锁和行锁 两种。
表锁 会锁定整张表 并且 阻塞其他用户 对该表的 所有 读写操作，比如 alter 修改表结构 的时候 会锁表。
行锁 又可以分为 乐观锁 和 悲观锁，
悲观锁 可以通过 for update 实现，
乐观锁 则通过 版本号 实现。  








## 事务的基本特性 和 隔离级别

事务基本特性 ACID 分别是：

Atomicity 原子性 指的是一个事务中的操作 要么全部成功，要么全部失败。

Consistency 一致性 指的是 数据库 总是从一个一致性的状态 转换到 另外一个 一致性的状态。比如 A 转账给 B 100 块钱，假设中间 sql 执行过程中 系统崩溃 A 也不会损失 100块，因为事务 没有提交，修改也就不会保存到 数据库。

Isolation 隔离性 指的是一个事务的修改 在最终提交前，对其他事务 是不可见的。

Durability 持久性 指的是 一旦事务提交，所做的修改 就会 永久保存到 数据库中。



而 隔离性有 4 个隔离级别，分别是：

read uncommit 读未提交，可能会 读到其他事务 未提交的数据，也叫做脏读。  
用户 本来应该 读取到 id=1 的用户 age 应该是 10，结果读取到了其他事务还没有提交的事务，结果读取结果 age=20，这就是脏读。  

read commit 读已提交，两次读取结果 不一致，叫做 不可重复读。不可重复读解决了脏读的问题，他只会读取 已经提交 的事务。
用户开启事务读取 id=1 用户，查询到 age=10，再次读取发现 结果 =20，
在同一个事务里 同一个查询 读取到 不同的结果 叫做 不可重复读。  


repeatable read 可重复复读，这是 mysql 的默认级别，就是每次读取结果 都一样，但是 有可能产生 幻读。  

serializable 串行，一般是不会使用的，他会给每一行读取的数据 加锁，会导致 大量超时和锁竞争 的问题。  






## 那 ACID 靠什么保证的呢？  

A 原子性 由 undo log 日志保证，它记录了需要回滚的日志信息，事务回滚时 撤销已经执行成功的 sql

C 一致性 一般由代码 层面 来保证

I 隔离性 由 MVCC 来保证

D 持久性 由 内存 + redo log 来保证，mysql 修改数据 同时在内存和 redo log 记录这次操作，
事务提交的时候通过 redo log 刷盘，宕机的时候可以从 redo log 恢复  






## 幻读，MVCC  

要说幻读，首先要了解 MVCC，MVCC 叫做 多版本 并发控制，实际上就是保存了 数据 在某个时间节点 的快照。

我们每行数 实际上隐藏了两列，     创建时间 版本号，过期(删除)时间 版本号，
每开始一个 新的事务，版本号 都会自动递增。

还是拿上面的 user 表举例子，假设我们插入 两条数据，他们实际上 应该长这样。
id   name    create_version   delete_version

这时候假设小明去执行查询，此时 current_version=3  
`select * from user where id<=3; `  

同时，小红 在这时候 开启事务 去修改 id=1 的记录， current_version=4  
`update user set name=‘张三三’ where id=1;`  
如果这时候 还有小黑在删除 id=2 的数据，current_version=5
  

由于 MVCC 的原理是 查找 创建版本 小于或等于 当前事务版本，删除版本为空 或者大于 当前事务版本，小明的真实的查询应该是这样   
`select * from user where id<=3 and create_version<=3          and          (delete_version>3 or delete_version is null);`  
所以小明最后查询到的 id=1 的名字还是’张三’，并且 id=2 的记录也能查询到。
这样做是为了保证事务 读取的数据 是在事务开始前 就已经存在的，要么是事务 自己插入 或者 修改的。





明白 MVCC 原理，我们来说什么是幻读 就简单多了。
举一个常见的场景，用户注册时，我们先查询用户名是否存在，不存在就插入，假定用户名是唯一索引。   

小明开启事务 current_version=6 查询名字为’王五’的记录，发现不存在。   
小红开启事务 current_version=7 插入一条数据  

小明执行插入名字’王五’的记录，发现唯一索引冲突，无法插入，这就是幻读。    









## 间隙锁

间隙锁 是 可重复读 级别下 才会有的锁，结合 MVCC 和 间隙锁 可以解决幻读的问题。

我们还是以 user 举例，假设现在 user 表有几条记录


当我们执行：

`select * from user where age=20 for update;` 

`insert into user(age) values(10);` #成功 

`insert into user(age) values(11);` #失败 
`insert into user(age) values(20);` #失败 
`insert into user(age) values(21);` #失败 
`insert into user(age) values(30);` #失败

只有 10 可以插入成功，那么因为表的间隙 mysql 自动帮我们生成了区间(左开右闭)

(negative infinity，10],(10,20],(20,30],(30,positive infinity)

由于 20 存在记录，所以(10,20]，(20,30] 区间 都被锁定了 无法插入、删除。

如果查询 21 呢？就会根据 21 定位到(20,30)的区间(都是开区间)。

需要注意的是唯一索引 是不会 有间隙索引的。  