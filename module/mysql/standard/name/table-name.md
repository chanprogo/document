
1. 尽量 说明 是 哪个 应用或者系统 在使用的。  
2. 备份数据表 名 使用 正式表名 加上 备份时间组成。  
3. 表的名称 一般 使用 名词 或者 动宾短语。    
4. 用单数形式 表示名称，例如，使用 employee，而不是 employees。
数据库中用到的临时表以 tmp 为前缀 并以日期 为后缀
5.数据库中 用到的备份表 以bak为前缀 并以日期为后缀




[表命名规范]

1.具备统一前缀，对相关功能的表应当使用相同前缀，如acl_xxx，house_xxx,ppc_xxx；其中前缀通常为这个表的模块或依赖主实体对象的名字，通常来讲表名为：业务_动作_类型，或是业务_类型；

2.表名使用英文小写单词，如果有多个单词则使用下划线隔开；

3.表名简介，使用常见单词，避免使用长单词和生僻词；


9.职责相近的表，命名规则应该相同；如合同申请，账户信息，交友相关等；



举个例子，一张在线冲值记录表： user_bank_deposit 这个 就非常 符合标准，如果叫做 userBankDeposit 或是 user_chongzhi，就非常 不友好。
```sql
CREATE TABLE `house_refresh_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fangid` int(11) NOT NULL COMMENT '房贴子ID',
  `refresh_time` int(11) NOT NULL COMMENT '刷新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fangid` (`fangid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房刷新记录表';
```





二、【常用表名约定】
0. 说明：表前缀 用项目名称 首字母 缩写；所以表名都小写，单词之间 用下划线分开，单词 都用单数形式  

1. user – 用户
2. category – 分类
3. goods – 商品、产品等一切可交易网站的物品都用此命名
4. good_gallery – 物品的相册
5. good_cate – 物品的分类，除了单独作为表名，其他地方分类单词一律用缩写cate
4. attr – 属性
5. article – 文章、新闻、帮助中心等以文章形式出现的，一般都用此命名
6. cart – 购物车
7. feedback – 用户反馈
8. order – 订单
9. site_nav – 包括页头和页尾导航
10. site_config – 系统配置表
11. admin – 后台用户 【RBAC标准表】
12. role – 后台用户角色【RBAC标准表】
13. access – 后台操作权限，相当于action【RBAC标准表】
14. role_admin – 后台用户对应的角色【RBAC标准表】
15. access_role – 后台角色对应的权限【RBAC标准表】
16. 待续