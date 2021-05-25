
https://dev.mysql.com/downloads/repo/yum/  

`yum -y install wget`  

先下载 MySQL 源安装包  
`wget https://repo.mysql.com//mysql80-community-release-el8-1.noarch.rpm`  

安装 MySQL 源：  
`yum install mysql80-community-release-el8-1.noarch.rpm -y`  

查看资源包：  
`yum repolist | grep mysql`   


`yum module disable mysql`  

`yum install mysql-community-server -y`  
