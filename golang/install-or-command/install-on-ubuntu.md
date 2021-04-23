
If you are upgrading from an older version of Go you must first remove the existing version. 
`rm -rf /usr/local/go`  

`sudo tar -C /usr/local -zxvf go$VERSION.$OS-$ARCH.tar.gz`    








`vim /etc/profile`   (for a system-wide installation)  

```
export GOROOT=/usr/local/go
export GO111MODULE=off
export GOPROXY=https://goproxy.io,direct
export GOPRIVATE=gitlab.com,gitee.com,gitea.com,gl.zego.im
```

`source /etc/profile`  



`echo "export GOPATH=${HOME}/gopath" >> ~/.bashrc`
`echo "export PATH=$PATH:/usr/local/go/bin:/home/username/go/bin" >> ~/.bashrc`  
`source ~/.bashrc`  