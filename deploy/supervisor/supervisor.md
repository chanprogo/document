

Supervisor is a client/server system   
that allows its users to control 
a number of processes on UNIX-like operating systems.   



`pip3 install supervisor`  

`supervisord -v`  


```
supervisortd：  supervisor 的 守护进程服务（用于接收 进程管理命令）
supervisorctl： 客户端（用于 和守护进程 通信，发送 管理进程 的指令）
echo_supervisord_conf： 生成 初始配置文件 程序。
```


启动 supervisor 服务:  
`supervisord -c supervisord.conf`  

重新加载配置文件:
`supervisorctl reload`  

`supervisorctl -c supervisord.conf restart all`  



`supervisorctl status`  
'INFO spawnerr: unknown error making dispatchers for 'WebApiDemo': EACCES'





`supervisorctl start 服务名`  
`supervisorctl stop 服务名`  
