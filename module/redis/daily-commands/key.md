


<br>


`KEYS *`  
`EXISTS mykey` 检查给定 mykey 是否存在。  
`TYPE mykey` 返回 mykey 所储存的值的类型。  
`DEL mykey` 命令用于删除已存在的键。  
`TTL mykey` 以秒为单位返回 mykey 的剩余过期时间。当 key 不存在时，返回 -2 。 当 key 存在但没有设置剩余生存时间时，返回 -1。  