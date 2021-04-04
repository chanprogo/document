



## 什么是一致性哈希算法？什么是哈希槽？  









`setnx`  
设置 key 对应的值为 string 类型的 value。如果 key 已经存在，返回 0，nx 是 not exist 的意思。   

## 使用过 Redis 分布式锁么，它是怎么实现的？

先拿 setnx 来争抢锁，抢到之后，再用 expire 给锁加一个过期时间 防止锁忘记了释放。   

## 如果在 setnx 之后执行 expire 之前  进程意外 crash 或者 要重启维护了，那会怎么样？

set 指令有非常复杂的参数，这个应该是可以   同时把 setnx 和 expire  合成一条指令来用的！  










