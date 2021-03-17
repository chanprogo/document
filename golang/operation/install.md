
If you are upgrading from an older version of Go you must first remove the existing version.  

`tar -C /opt -zxvf go$VERSION.$OS-$ARCH.tar.gz`  
`tar -C /opt -zxvf go1.15.linux-amd64.tar.gz`  








<br><br><br><br>

`vim /etc/profile`  

```
export GOROOT=/opt/go
export GOPATH=$HOME/gopath
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# export GO111MODULE=off
export GOPROXY=https://goproxy.io,direct
export GOPRIVATE=*.gitlab.com,*.gitee.com,*.gitea.com
```

`source /etc/profile`  






<br><br><br>

# 3
执行（如果是平时的开发环境，建议在 root 和普通账号下都执行）以下命令：  
```
echo "export PATH=$PATH:$GOPATH/bin:$GOROOT/bin" >> ~/.bashrc
```
```
source ~/.bashrc
```
