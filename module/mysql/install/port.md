




开放 3306 端口：


```
[root@localhost ~]# firewall-cmd --zone=public --add-port=3306/tcp --permanent
success
[root@localhost ~]# firewall-cmd --reload
success
```
