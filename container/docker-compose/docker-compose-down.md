
`docker-compose down [options]` 停止和删除容器、网络、卷、镜像。  

选项包括：
```
--rmi type，删除镜像，类型必须是：all，删除compose文件中定义的所有镜像；local，删除镜像名为空的镜像
-v, --volumes，删除已经在compose文件中定义的和匿名的附在容器上的数据卷
--remove-orphans，删除服务中没有在compose中定义的容器
```
