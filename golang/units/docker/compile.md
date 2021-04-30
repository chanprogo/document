
## Compile your app inside the Docker container

There may be occasions where it is not appropriate to run your app inside a container.  

To compile, but not run your app inside the Docker instance, you can write something like:

`$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.8 go build -v`





This will add your current directory as a volume to the container, set the working directory to the volume, and run the command `go build` which will tell go to compile the project in the working directory and output the executable to `myapp`.   

Alternatively, if you have a `Makefile`, you can run the `make` command inside your container.  
`$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.8 make`  