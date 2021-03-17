
Define and run multi-container applications with Docker.  

`docker-compose -h|--help`  

  
  

```
Usage:
  docker-compose [-f <arg>...] [options] [COMMAND] [ARGS...]
  

Options:
  -f, --file FILE             Specify an alternate compose file  (default: docker-compose.yml) 可以多次指定。
  -p, --project-name NAME     Specify an alternate project name  (default: directory name)

  -c, --context NAME          Specify a context name
  --verbose                   Show more output
  --log-level LEVEL           Set log level (DEBUG, INFO, WARNING, ERROR, CRITICAL)
  --no-ansi                   Do not print ANSI control characters
  -v, --version               Print version and exit
  -H, --host HOST             Daemon socket to connect to

  --tls                       Use TLS; implied by --tlsverify
  --tlscacert CA_PATH         Trust certs signed only by this CA
  --tlscert CLIENT_CERT_PATH  Path to TLS certificate file
  --tlskey TLS_KEY_PATH       Path to TLS key file
  --tlsverify                 Use TLS and verify the remote
  --skip-hostname-check       Don't check the daemon's hostname against the
                              name specified in the client certificate
  --project-directory PATH    Specify an alternate working directory
                              (default: the path of the Compose file)
  --compatibility             If set, Compose will attempt to convert keys
                              in v3 files to their non-Swarm equivalent
  --env-file PATH             Specify an alternate environment file

Commands:
  build              Build or rebuild services
  config             Validate and view the Compose file
  create             Create services

  down               Stop and remove containers, networks, images, and volumes
  events             Receive real time events from containers
  exec               Execute a command in a running container

  help               Get help on a command
  images             List images
  kill               Kill containers

  logs               View output from containers

  pause              Pause services
  port               Print the public port for a port binding
  ps                 List containers
  pull               Pull service images
  push               Push service images
  restart            Restart services
  rm                 Remove stopped containers
  run                Run a one-off command
  scale              Set number of containers for a service

  start              Start services
  stop               Stop services

  top                Display the running processes

  unpause            Unpause services

  up                 Create and start containers

  version            Show the Docker-Compose version information
```



 


<br><br><br>

`docker-compose ps` 列出项目中目前的所有容器  
`docker-compose top` 显示正在运行的进程   
`docker-compose logs` 查看服务容器的输出   
`docker-compose stop` 停止正在运行的容器，可以通过`docker-compose start`再次启动   
  



<br><br><br>

`docker-compose up [options] [--scale SERVICE=NUM...] [SERVICE...]`  
选项包括：
```
-d 在后台运行服务容器
--no-deps 不启动服务所链接的容器

--force-recreate 强制重新创建容器，不能与--no-recreate同时使用
--no-recreate 如果容器已经存在，则不重新创建，不能与--force-recreate同时使用

--no-build 不自动构建缺失的服务镜像
--build 在启动容器前构建服务镜像

--abort-on-container-exit 停止所有容器，如果任何一个容器被停止，不能与-d同时使用
-t, --timeout TIMEOUT 停止容器时候的超时（默认为10秒）
--remove-orphans 删除服务中没有在compose文件中定义的容器

--scale SERVICE=NUM 设置服务运行容器的个数，将覆盖在compose中通过scale指定的参数
```




 
<br><br><br>

`docker-compose down [options]` 停止和删除容器、网络、卷、镜像。  
选项包括：
```
--rmi type，删除镜像，类型必须是：all，删除compose文件中定义的所有镜像；local，删除镜像名为空的镜像
-v, --volumes，删除已经在compose文件中定义的和匿名的附在容器上的数据卷
--remove-orphans，删除服务中没有在compose中定义的容器
```
