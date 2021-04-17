
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
export GOPROXY=https://goproxy.io,direct
export GOPRIVATE=*.gitlab.com,*.gitee.com,*.gitea.com
export GO111MODULE=off
```

`source /etc/profile`  



<br><br>

普通账号下执行以下命令：  
export GOPATH=${HOME}/gopath
`echo "export PATH=$PATH:/usr/local/go/bin:/home/username/go/bin" >> ~/.bashrc`  
`source ~/.bashrc`  