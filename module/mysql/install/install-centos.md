
## Centos 7.3 安装和配置 MySOL 5.7

### 获取mysql YUM源

进入MySQL官网获取[RPM包下载地址](https://dev.mysql.com/downloads/repo/yum/)


点击下载，右击，复制下载链接地址。 


得到这个 https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm  
这个就是 Yum 仓库的 rpm 包，其实就是一个下载地址。

 

### 下载和安装 MySQL 源

先下载 MySQL 源安装包
`[root@localhost ~]# wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm`
如果未找到`wget`命令，那我们先安装下 wget ：  `yum -y install wget`
然后执行 `wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm`
安装 MySQL 源：  `yum -y localinstall mysql57-community-release-el7-11.noarch.rpm `

 

### 在线安装 MySQL
`yum -y install mysql-community-server`
下载的东西比较多，要稍微等会。

 

### 启动Mysql服务
`systemctl start mysqld`

 

### 设置开机启动
`[root@localhost ~]# systemctl enable mysqld`
`[root@localhost ~]# systemctl daemon-reload`

 

### 修改root本地登录密码
MySQL 安装完成之后，在 /var/log/mysqld.log 文件中给 root 生成了一个临时的默认密码。
`[root@localhost ~]# vi /var/log/mysqld.log`
```bash
[root@localhost ~]#  mysql -u root -p
Enter password: 
```
输入临时密码 进入mysql命令行；
```
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'Mypassword@cc';
Query OK, 0 rows affected (0.00 sec)
```
修改密码为 `Mypassword@cc`（备注 MySQL 5.7 默认密码策略要求密码必须是大小写字母数字特殊字母的组合，至少8位）。

 

### 设置允许远程登录
MySQL 默认不允许远程登录，我们需要设置下，并且防火墙开放3306端口。
```
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'Mypassword@cc' WITH GRANT OPTION;
Query OK, 0 rows affected, 1 warning (0.01 sec)
mysql> exit;
Bye
```
开放3306端口：
```
[root@localhost ~]# firewall-cmd --zone=public --add-port=3306/tcp --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
[root@localhost ~]# 
```


 

### 配置默认编码为 utf8
修改 /etc/my.cnf 配置文件，在 `[mysqld]` 下添加编码配置，如下所示：
```
[mysqld]
character_set_server=utf8
init_connect='SET NAMES utf8'
```
`[root@localhost ~]# vi /etc/my.cnf`
编辑保存完 重启 MySQL 服务：
`[root@localhost ~]# systemctl restart mysqld`

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
 

### 最后测试