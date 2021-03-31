
Using these scripts is not recommended for production environments.  


`curl -fsSL https://get.docker.com -o get-docker.sh`  
 
`sudo sh get-docker.sh`  

`sudo usermod -aG docker <your-user>`  Remember to log out and back in for this to take effect!    
 
`cat /etc/group | grep docker`  

`docker --version`  

`docker run hello-world`


`service docker restart`  

`systemctl is-active docker`  检查 Docker daemon 的状态  