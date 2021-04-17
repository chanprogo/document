



`yum install redis`  
`vi /etc/redis.conf`  
`redis-server /etc/redis.conf`  






## CentOS 7 下安装配置 Redis


### 一、安装


下载 Redis 安装包：
`wget http://download.redis.io/releases/redis-4.0.9.tar.gz`

将压缩包解压到指定目录：
`tar -zxvf redis-4.0.9.tar.gz -C /usr/local/`

安装gcc依赖：
先通过`gcc -v`是否有安装 gcc，如果没有安装，执行命令`sudo yum install -y gcc`

`cd`到 Redis 的解压目录下，并执行`cd /usr/local/redis-4.0.9/`，此处目录根据下载的 Redis 版本及解压路径调整。


编译安装：
`make MALLOC=libc`
将 /usr/local/redis-4.0.9/src 目录下的文件加到 /usr/local/bin 目录
`cd src && make install`


测试是否安装成功：
`cd /usr/local/redis-4.0.9/src/`
`./redis-server`





二、配置 Redis 
-------------------
**以后台进程方式启动：**
修改/usr/local/redis-4.0.9/redis.conf：`vim redis.conf`
修改 daemonize no，将值no改为值yes，保存退出。

指定 redis.conf 文件启动：`./redis-server /usr/local/redis-4.0.9/redis.conf`

**设置 Redis 远程连接：**

*  因为 Redis 默认设置允许本地连接，所以我们要将 redis.conf 中将 bind 127.0.0.1 改为 bind 0.0.0.0 或者注释该行
*  另外，阿里云 ECS 有一个安全组，找到并添加规则允许 6379 端口访问

**设置 Redis 连接密码：**
在 redis.conf中搜索 requirepass 这一行，然后在合适的位置添加配置：
requirepass yourpassword

**设置完成后**
执行`/usr/local/bin/redis-server /usr/local/redis-4.0.9/redis.conf`更新配置






三、设置开机自启动
-------
由于上面我们执行了 redis 进程启动，通过`ps -aux | grep redis`查看 redis 进程，并用`kill -9` 将进程杀死



在 /etc 目录下新建 redis 目录：`mkdir /etc/redis`

将 /usr/local/redis-4.0.9/redis.conf 文件复制一份到 /etc/redis 目录下，并命名为 6379.conf：
`cp /usr/local/redis-4.0.9/redis.conf /etc/redis/6379.conf`

将redis的启动脚本复制一份放到 /etc/init.d 目录下
`cp /usr/local/redis-4.0.9/utils/redis_init_script /etc/init.d/redisd`


设置redis开机自启动
先切换到 /etc/init.d 目录下：`cd /etc/init.d`
然后执行自启命令`chkconfig redisd on`
如果显示 service redisd does not support chkconfig  解决方法：使用 vim 编辑 redisd 文件，在第一行加入如下两行注释，保存退出
```
# chkconfig:   2345 90 10
# description:  Redis is a persistent key-value database
```
注释的意思是，redis 服务必须在运行级 2，3，4，5 下被启动或关闭，启动的优先级是 90，关闭的优先级是 10。







再次执行开机自启命令 `chkconfig redisd on`，这个时候应该就能成功了
现在可以直接已服务的形式启动和关闭 redis 了
启动：`service redisd start`
关闭：`service redisd stop`





四、查看是否有安装 Redis
---------------
检测是否有安装 redis-cli 和 redis-server：  
`whereis redis-cli`
`whereis redis-server`




检测后台进程是否存在：  
`ps -ef |grep redis`
检测 6379 端口是否在监听：  
`netstat -lntp | grep 6379`