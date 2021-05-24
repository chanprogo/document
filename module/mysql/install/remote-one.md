
`use mysql`   
`select user,host from user;`  
发现 root 账户只允许 localhost 访问，所以外网无法访问。可以使用如下命令给外网访问授权：  






`create user 'root'@'%' identified by 'yourpassword';`  // 8.0 之后的版本  
                                          
`grant all privileges on *.* to 'root'@'%' identified by 'yourpassword' with grant option;` // new 
`flush privileges;`  


`select user,host from user;`  
`exit`  




​






​


`update user set authentication_string=password('yourpassword') where user="root"`  
或者  
`alter user ‘用户名’@'主机名' identified with mysql_native_password by 'yourpassword';`    
alter 对密码有安全规范要求，不能设置简单密码（大小写，数字，字符，无序）。update 不做限制。   

查看权限  
`show grants;`  ---查看当前用户的权限  
`show grants for 'abc'@'localhost';`  ---查看用户abc的权限  

回收权限  
`revoke all privileges on *.* from 'abc'@localhost';`   --回收用户abc的所有权限  
`revoke grant option on *.* from 'abc'@localhost';`   --回收权限的传递  
