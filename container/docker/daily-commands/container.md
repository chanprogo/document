
```
docker container rm containernameorid
docker container ls
docker container ls -a
```

<br><br>









使用 docker container run 命令    从镜像来启动容器。  

其中`-it`参数告诉 Docker 开启容器的交互模式    并将读者当前的 Shell 连接到容器终端。  
接下来，命令告诉 Docker，用户想基于 ubuntu: latest 镜像启动容器。  
最后，命令告诉 Docker，用户想要在容器内部运行 Bash Shell。  

按 Ctrl - PQ 组合键，可以在退出容器的同时还保持容器运行。  



`docker run [OPTIONS] IMAGE [COMMAND] [ARG...]`

| Option | Description | 
| :-:    | -           | 
| --rm	| Automatically remove the container when it exits  |
| -d	| Run container in background and print container ID|

<br>

| Option | Description | 
| :-:    | -           | 
| -i     |	Keep STDIN open even if not attached|
| -t	 |	Allocate a pseudo-TTY|
| --name	|	Assign a name to the container           |
| --publish |	Publish a container’s port(s) to the host|












```  
docker container run                                              --rm myimage go version                      
docker container run --name mycontainer -it myimage                            /bin/bash 
          docker run --name mycontainer -it                       --rm myimage
          docker run --name mycontainer      --publish 9999:11987 --rm myimage
docker container run --name mycontainer      --publish 8080:8080               -d myimage
```


```
docker container start containernameorid
docker container stop  containernameorid  

docker container exec -it containernameorid bash
```