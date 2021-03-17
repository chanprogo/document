
`netstat -an | grep 3306`    

`apt-get update`    
`apt-get -y install mysql-server`  





<br><br>

# 配置能让外网连接

<br>

`vim /etc/mysql/mysql.conf.d/mysqld.cnf`  
找到如下内容的一行并注释掉：  `bind-address          = 127.0.0.1`    
重启MySQL服务：            `systemctl restart mysql`     




<br><br>

MySQL 自带的权限控制限制了外网访问 MySQL 服务器，在 Ubuntu 主机上使用命令行连接至本地 MySQL 数据库   
`mysql -uroot -p[你的密码]`   
`use mysql`   
`select user,host from user;`  

发现 root 账户只允许 localhost 访问，所以外网无法访问。可以使用如下命令给外网访问授权：  

其中[允许的ip]如果设置为%的话则表示所有ip都可以访问，[密码]表示外网访问的密码是什么。比如我设置成所有 ip 都可访问，密码是 root，则命令如下：  

`grant all privileges on *.* to 'root'@'[允许的ip]' identified by '[密码]' with grant option;`   
`grant all privileges on *.* to 'root'@'%' identified by 'yourpassword' with grant option;`  
`flush privileges;`  
`select user,host from user;`  
`exit`  