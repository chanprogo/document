


### 配置默认编码为 utf8  


`vi /etc/my.cnf`   on CentOs  




在 `[mysqld]` 下添加编码配置，如下所示：   
```
[mysqld]
character_set_server=utf8
init_connect='SET NAMES utf8'
```






编辑保存完 重启 MySQL 服务：  `systemctl restart mysqld`  



查看下编码：  
```
mysql> show variables like '%character%';
+--------------------------+----------------------------+

| Variable_name            | Value                      |

+--------------------------+----------------------------+

| character_set_client     | utf8                       |

| character_set_connection | utf8                       |

| character_set_database   | utf8                       |

| character_set_filesystem | binary                     |

| character_set_results    | utf8                       |

| character_set_server     | utf8                       |

| character_set_system     | utf8                       |

| character_sets_dir       | /usr/share/mysql/charsets/ |

+--------------------------+----------------------------+

8 rows in set (0.00 sec)
```
