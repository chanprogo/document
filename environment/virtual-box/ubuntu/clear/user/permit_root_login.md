
`sudo passwd root`  

`vim /etc/ssh/sshd_config`  

comment `PermitRootLogin prohibit-password`，then add `PermitRootLogin yes`  

`service ssh restart`  