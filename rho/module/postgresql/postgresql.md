



资产表 逐笔 更新记录 
更新前后资产

per_change_finacial_record   (root)
before, later 为json格式数据








```
select per_change_finacial_record.before::json->>'use_amount' as before_use_amount,
       per_change_finacial_record.later::json->>'use_amount' as later_use_amount 
from per_change_finacial_record limit 1
```    


查询一条更新操作前后  
用户的可用资产
