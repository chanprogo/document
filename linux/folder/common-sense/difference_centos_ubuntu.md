


```
Linux 内核  
│ 
├── Debian   
│   └── Ubuntu    
│       └── Linux Mint    
│     
├── Fedora  
│   └── RHEL
│       ├── CentOS
│       └── Oracle Linux
│    
├── SUSE  
│   └── SLES  
│       └── openSUSE   
│   
└── 其它发行版  
```






| CentOS | Ubuntu | 
| :- | :- | 
| 新建的非root用户是没有sudo的权限的，如果需要使用sudo权限必须在`/etc/sudoers`中加入账户和权限，所以切换到root账号的时候只需要输入：su，加入root账号的密码即可。 | 一般使用`sudo+命令`，如果是第一次使用会提示输入当前用户的密码（而不是root的密码）| 
| 在线安装软件中，使用的是`yum`命令。`yum`中还有一个从软件源中搜索某个软件的方法：yum search + 软件名 | 使用的是`apt-get`命令。 | 
| 来自于RedHat，支持rpm格式的安装。 | |



<br><br><br><br>

 1. 很多配置文件的位置和默认的文件路径都有很大区别。
