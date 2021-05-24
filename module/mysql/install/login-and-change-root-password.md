
CentOs:  
MySQL 安装完成之后，在 /var/log/mysqld.log 文件中给 root 生成了一个临时的默认密码。  
`vi /var/log/mysqld.log | grep password`  
`mysql -uroot -p`  

 



Ubuntu: 
`sudo mysql`  







修改 root 本地登录密码  
`ALTER USER 'root'@'localhost' IDENTIFIED BY 'yourpassword';`   
`ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'yourpassword';`  // new  
