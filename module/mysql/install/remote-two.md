

`vim /etc/mysql/mysql.conf.d/mysqld.cnf`  
找到如下内容的一行并注释掉：  `bind-address          = 127.0.0.1`   


重启 MySQL 服务：          `systemctl restart mysql`     



