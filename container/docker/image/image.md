  
```
docker image build -t test:latest .
docker image ls
docker images
```




`docker image rm [OPTIONS] IMAGE [IMAGE...]`  
`docker image rm $(docker image ls -q) -f`  


移除全部的悬虚镜像：
```
docker image prune
```