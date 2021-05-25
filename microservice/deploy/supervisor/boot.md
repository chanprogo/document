
进入 /lib/systemd/system 目录，并创建 supervisor.service 文件


`whereis supervisord`  
`whereis supervisorctl`  

`cd /lib/systemd/system`  
`vim supervisor.service`  


配置文件内容如下：  
```
[Unit]
Description=supervisor
After=network.target
 
[Service]
Type=forking
ExecStart=/usr/local/bin/supervisord -c /home/dotnba/supervisor/supervisord.conf
ExecStop=/usr/local/bin/supervisorctl $OPTIONS shutdown
ExecReload=/usr/local/bin/supervisorctl $OPTIONS reload
KillMode=process
Restart=on-failure
RestartSec=42s
 
[Install]
WantedBy=multi-user.target
```


设置开机启动：  
`systemctl enable supervisor.service`    

`systemctl daemon-reload`  

`service supervisor status`


`chmod 766 supervisor.service`   
