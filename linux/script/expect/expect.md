
expect 是用来进行自动化控制和测试的工具。主要是和交互式软件telnet ftp ssh 等进行自动化的交互。

检测是否安装：  
`ls /usr/bin |grep expect`

如果不存在，则进行安装：  
`apt-get install expect`



`spawn` 是进入 expect 环境后才可以执行的 expect 内部命令。expect 是一种脚本语言，它能够代替我们实现与终端的交互，我们不必再守候在电脑旁边输入密码，或是根据系统的输出再运行相应的命令。