
```sql
select unix_timestamp();
select unix_timestamp(now());
select unix_timestamp('2018-01-15 09:45:16'); -- 时间转时间戳
```

<br><br>


```sql
select now(); -- 获取当前时间  
SELECT NOW() - interval 72 hour; -- 获取三天前的时间
```

<br><br>


```sql
select from_unixtime(1515980716);  -- 时间戳转时间
select from_unixtime(1515980716, '%Y-%m-%d %H:%i:%S'); -- 时间戳格式化
```




<br><br>


```sql
-- 时间格式化
select date_format(now(), '%Y-%m-%d');
select date_format('2018-01-15 09:45:16', '%Y-%m-%d');
```