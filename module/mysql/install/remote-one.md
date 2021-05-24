
`use mysql`   
`select user,host from user;`  
发现 root 账户只允许 localhost 访问，所以外网无法访问。可以使用如下命令给外网访问授权：  

`create user 'root'@'%' identified by 'yourpassword';`  

`grant all privileges on *.* to 'root'@'%';`                                          
`grant all privileges on *.* to 'root'@'%' identified by 'yourpassword' with grant option;`  
`flush privileges;`  


`select user,host from user;`  
`exit`  






