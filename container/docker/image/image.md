
根据 Dockerfile 中的指令来创建新的镜像。  

一定要 **在 包含应用代码和 Dockerfile 的目录下** 执行这些命令。  

```
docker image build -t test:latest .
docker image ls
docker images
```




```
docker image pull ubuntu:latest
docker image rm containerid
docker image rm $(docker image ls -q) -f
```





移除全部的悬虚镜像：
```
docker image prune
```