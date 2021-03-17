



CentOS 7.4 系统默认开启了防火墙。  
可以参考官网文档在防火墙里添加规则，放行 80、443 或 8080 等端口入方向规则。  



关闭防火墙：
```
systemctl stop firewalld.service
```



关闭防火墙开机自启动功能：
```
systemctl disable firewalld.service
```