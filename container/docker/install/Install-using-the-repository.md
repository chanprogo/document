
Before you install Docker Engine for the first time on a new host machine, 
you need to set up the Docker repository. 
Afterward, you can install and update Docker from the repository.  

## SET UP THE REPOSITORY

`sudo apt-get update`  

`sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release`  

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`  

```
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```


## INSTALL DOCKER ENGINE 

`sudo apt-get update`  

`sudo apt-get install docker-ce docker-ce-cli containerd.io`  

`sudo docker run hello-world`  



## Manage Docker as a non-root user

`sudo groupadd docker`  
`sudo usermod -aG docker $USER`  

`newgrp docker`  
`docker run hello-world`  

