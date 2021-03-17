

```sh
vim /etc/ssh/sshd_config
```

comment `PermitRootLogin prohibit-password`，then add `PermitRootLogin yes`  



```sh
service ssh restart
```