
Run a command in a new container:  
```
docker container run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

使用 docker container run 命令  从镜像来启动容器。  

`-it`参数告诉 Docker 开启容器的交互模式，并将读者当前的 Shell 连接到容器终端。   
按 Ctrl - PQ 组合键，可以在退出容器的同时还保持容器运行。  



| Option | Description | 
| :-:    | -           | 
| -i     |	Keep STDIN open even if not attached|
| -t	 |	Allocate a pseudo-TTY|



```
--name		        Assign a name to the container
--detach , -d		Run container in background and print container ID
--publish , -p		Publish a container's port(s) to the host
--env , -e	    	Set environment variables
--rm	        	Automatically remove the container when it exits
```




```  
docker container run                    --rm                myimage       go version                      
docker container run --name mycontainer -it                 myimage       /bin/bash 
docker container run --name mycontainer -p 8080:8080 -d     myimage
```
