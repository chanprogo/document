

在 Docker 当中，包含应用文件的目录   
通常被称为构建上下文（ Build Context）。
通常将 Dockerfile 放到构建上下文的根目录下。









接下来了解一下 Dockerfile 文件当中都包含哪些具体内容。

```
FROM alpine 
LABEL maintainer=" xxx@hotmail.com" 
RUN apk add --update nodejs nodejs-npm 
COPY . /src 
WORKDIR /src 
RUN npm install 
EXPOSE 8080 
ENTRYPOINT ["node", "./app.js"]
```












Dockerfile 主要包括两个用途：
* 对当前应用的描述。
* 指导 Docker 完成应用的容器化（创建一个包含当前应用的镜像）。








<br><br>

1. `FROM`指令指定的镜像，会作为当前镜像的一个基础镜像层，当前应用的剩余内容会作为新增镜像层添加到基础镜像层之上。
2. `RUN apk add --update nodejs nodejs-npm`指令使用 alpine 的 apk 包管理器将 nodejs 和 nodejs-npm 安装到当前镜像之中。
3. `COPY. /src`指令将应用相关文件从构建上下文复制到了当前镜像中。
4. `WORKDIR`指令， 为 Dockerfile 中尚未执行的指令设置工作目录。 
5. `RUN npm install`指令会根据 package.json 中的配置信息，使用 npm 来安装当前应用的相关依赖 包。npm命令会在前文设置的工作目录中执行，并且在镜像中新建镜像层来保存相应的依赖文件。
6. 因为当前应用需要通过 TCP 端口 8080 对外提供一个 Web 服务，所以在 Dockerfile 中通过`EXPOSE 8080`指令来完成相应端口的设置。
7. 最终通过 `ENTRYPOINT`指令来指定当前镜像的入口程序。

