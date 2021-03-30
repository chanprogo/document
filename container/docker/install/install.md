
下面使用 `wget` 命令来运行一个 Shell 脚本，完成 Docker CE 的安装。  
实际上，如果使用浏览器打开网页 `https://get.docker.com`，会发现这其实就是一个 Shell 脚本，脚本中已经定义好了安装相关的指令，包括设置 Docker 为系统开启自启动。  
```
wget -qO- https://get.docker.com/ | sh
```








<br><br><br><br>

最好通过非 root 用户来使用 Docker。这时需要添加非 root 用户到本地 Docker Unix 组当中。  
下面的命令展示了如何把名为 chan 的用户添加到 Docker 组中，以及如何确认操作是否执行成功。  
```
useradd chan
sudo usermod -aG docker chan
cat /etc/group | grep docker
```









<br><br>

运行下面命令来确认安装结果。  
```
docker --version
docker system info
service docker restart
```
检查 Docker daemon 的状态：`systemctl is-active docker`  


<br>

`sudo docker run hello-world` 。  
