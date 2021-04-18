 
`tar -C /usr/local -zxvf go$VERSION.$OS-$ARCH.tar.gz`    

`sudo vi /etc/profile`   
`source /etc/profile`   



`vi ~/.zshrc`   

```
export GOROOT=/usr/local/go1-12-17
export GOPATH=${HOME}/go1-12-17-path
export GO111MODULE=off
export GOPROXY=https://goproxy.io,direct
export GOPRIVATE=*.gitlab.com,*.gitee.com,*.gitea.com

export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```

`source ~/.zshrc`   