
run the following as root or through sudo:                      
`su`

If you are upgrading from an older version of Go you must first remove the existing version. 
`rm -rf /usr/local/go`  

Extract the archive you downloaded into /usr/local, creating a Go tree in /usr/local/go. For example,   
`tar -C /usr/local -zxvf go$VERSION.$OS-$ARCH.tar.gz`    
`tar -C /usr/local -zxvf go1.16.2.linux-amd64.tar.gz` 





<br><br>

`vim /etc/profile`   (for a system-wide installation)  

```
export GOROOT=/usr/local/go
# export PATH=$PATH:$GOROOT/bin
export GOPROXY=https://goproxy.io,direct
export GOPRIVATE=*.gitlab.com,*.gitee.com,*.gitea.com
```

`source /etc/profile`  



<br><br>

执行（如果是平时的开发环境，建议在 root 和普通账号下都执行）以下命令：  
`echo "export PATH=$PATH:$GOROOT/bin" >> ~/.bashrc`  
`source ~/.bashrc`  