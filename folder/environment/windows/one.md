
# 如何删除远程桌面连接的记录

1. 开始=>运行=>输入`regedit`命令打开注册表
2. 找到注册表里面的  
`计算机\HKEY_CURRENT_USER\Software\Microsoft|Terminal Server Client\Default`  
其中右边的就是你连接过的记录了。删除您需要清除的文件即可。