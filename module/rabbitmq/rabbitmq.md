# 在 CentOS 7 上安装 RabbitMQ



首先需要安装 erlang，完成后安装 RabbitMQ：
先下载rpm：
`wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.15/rabbitmq-server-3.6.15-1.el7.noarch.rpm`

下载完成后安装：`yum install rabbitmq-server-3.6.15-1.el7.noarch.rpm` 


完成后启动服务：`service rabbitmq-server start`

可以查看服务状态：`service rabbitmq-server status`


转到文件位置：`cd /var/log/rabbitmq/`
`cd /etc/rabbitmq/`
`vi rabbitmq.config`
编辑内容如下：
```
[{rabbit, [{loopback_users, []}]}].
```
> 这里的意思是开放使用，rabbitmq 默认创建的用户 guest，密码也是 guest，这个用户默认只能是本机访问，localhost 或者127.0.0.1，从外部访问需要添加上面的配置。

保存配置后重启服务：
`service rabbitmq-server stop`
`service rabbitmq-server start`
此时就可以从外部访问了，但此时再看log文件，发现内容还是原来的，还是显示没有找到配置文件，可以手动删除这个文件再重启服务，不过这不影响使用
`rm rabbit@izwz9j2bnazzy31xwiiq6wz.log`
`service rabbitmq-server stop`
`service rabbitmq-server start`


---

开启管理 UI：
--------

`rabbitmq-plugins enable rabbitmq_management`
在Windows下打开地址：http://10.255.19.111:15672
用户名和密码都是 guest。