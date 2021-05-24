


### 获取 mysql YUM 源

进入MySQL官网获取[RPM包下载地址](https://dev.mysql.com/downloads/repo/yum/)


点击下载，右击，复制下载链接地址。 


得到这个 https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm  
这个就是 Yum 仓库的 rpm 包，其实就是一个下载地址。

 

### 下载和安装 MySQL 源

先下载 MySQL 源安装包
`wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm`  

如果未找到 `wget` 命令，那我们先安装下 wget ：  `yum -y install wget`  

然后执行 `wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm`  

安装 MySQL 源：  `yum -y localinstall mysql57-community-release-el7-11.noarch.rpm `  

 

## 在线安装 MySQL
`yum -y install mysql-community-server`  

 
















### 启动 Mysql 服务
`systemctl start mysqld`

 

### 设置开机启动
`systemctl enable mysqld`  
`systemctl daemon-reload`  

 