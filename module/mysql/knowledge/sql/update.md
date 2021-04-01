

# 不使用 select 情况
```sql
UPDATE OldData o, NewData n 
SET 
o.name = n.name, 
o.address = n.address 
where n.nid=234 and o.id=123;
```







# 使用 select 情况
```sql
UPDATE OldData o, (select name, address from NewData where id = 123) n 
SET 
o.name = n.name, 
o.address = n.address 
where n.nid=234;
```