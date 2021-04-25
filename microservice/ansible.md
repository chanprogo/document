

ansible 是新出现的自动化运维工具，基于 Python 开发，集合了众多运维工具（puppet、chef、func、fabric）的优点，实现了批量系统配置、批量程序部署、批量运行命令等功能。  

　　ansible 是基于 paramiko 开发的,并且基于模块化工作，本身没有批量部署的能力。真正具有批量部署的是 ansible 所运行的模块，ansible 只是提供一种框架。ansible 不需要 在远程主机上安装 client/agents，因为它们是基于 ssh 来和远
程主机通讯的。ansible目前已经已经被红帽官方收购，是自动化运维工具中大家认可度最高的，并且上手容易，学习简单。是每位运维工程师必须掌握的技能之一。