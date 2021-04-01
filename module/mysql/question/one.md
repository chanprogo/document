
## 什么是覆盖索引和回表

覆盖索引 指的是  在一次查询中，

如果一个索引  包含或者说覆盖  所有需要查询的字段的值，我们就称之为覆盖索引，而不再需要回表查询。




而要确定一个查询  是否是  覆盖索引，我们只需要 explain sql 语句看 Extra 的结果是否是 “Using index” 即可。

以上面的 user 表来举例，我们再增加一个 name 字段，然后做一些查询试试。
```
explain select * from user where age=1; // 查询的 name 无法从索引数据获取 
explain select id,age from user where age=1; // 可以直接从索引获取
```  
