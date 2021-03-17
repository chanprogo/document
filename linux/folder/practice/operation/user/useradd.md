








`useradd username -m`   
`usermod -s /bin/bash username`  
`passwd username`  
`chown username:username -R /home/username`  







当在终端执行 sudo 命令时，系统提示 “hadoop is not in the sudoers file”，其实就是没有权限进行 sudo，解决方法如下：  

1. 切换到超级用户： `su`  
2. `vim /etc/sudoers`  
3. 修改文件内容：找到 `root    ALL=(ALL)       ALL` 一行，在下面插入新的一行，内容是 `username   ALL=(ALL)       ALL`，然后在 vim 键入命令 `:wq!` 保存并退出。
4. 退出超级用户： `exit`