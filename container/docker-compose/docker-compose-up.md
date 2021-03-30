
`docker-compose up [options] [--scale SERVICE=NUM...] [SERVICE...]`  
```
Usage: up [options] [--scale SERVICE=NUM...] [SERVICE...]

Options:
    -d, --detach               Detached mode: Run containers in the background, print new container names. Incompatible with
                               --abort-on-container-exit.
    --no-color                 Produce monochrome output.
    --quiet-pull               Pull without printing progress information
    --no-deps                  Don't start linked services.
    --force-recreate           Recreate containers even if their configuration
                               and image haven't changed.
    --always-recreate-deps     Recreate dependent containers.
                               Incompatible with --no-recreate.
    --no-recreate              If containers already exist, don't recreate
                               them. Incompatible with --force-recreate and 
                               --renew-anon-volumes.
    --no-build                 Don't build an image, even if it's missing.
    --no-start                 Don't start the services after creating them.
    --build                    Build images before starting containers.
    --abort-on-container-exit  Stops all containers if any container was
                               stopped. Incompatible with --detach.
    --attach-dependencies      Attach to dependent containers.
    -t, --timeout TIMEOUT      Use this timeout in seconds for container
                               shutdown when attached or when containers are
                               already running. (default: 10)
    -V, --renew-anon-volumes   Recreate anonymous volumes instead of retrieving
                               data from the previous containers.
    --remove-orphans           Remove containers for services not defined
                               in the Compose file.
    --exit-code-from SERVICE   Return the exit code of the selected service
                               container. Implies --abort-on-container-exit.
    --scale SERVICE=NUM        Scale SERVICE to NUM instances. Overrides the
                               `scale` setting in the Compose file if present.

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

