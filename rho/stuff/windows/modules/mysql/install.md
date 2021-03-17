

#### 一

`cd /d D:\Development\MySQL57\bin`
`mysqld --initialize`
`mysqld --initialize-secure`
`mysqld --console`





#### 二

从 ComputerName.err 文件中找到临时密码，另外再打开新的 CMD 窗口
`mysql -h localhost -u root -p `
粘贴临时密码






#### 三

```sql
alter user 'root'@'localhost' IDENTIFIED BY 'newpassword';
```