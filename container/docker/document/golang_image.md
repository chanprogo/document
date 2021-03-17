

## Start a Go instance in your app

The most straightforward way to use this image 
is to use a Go container as both the build and runtime environment.  

In your `Dockerfile`, writing something  
along the lines of the following  
will compile and run your project:   



```
FROM golang:1.8

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["app"]
```



You can then build and run the Docker image.
















<br><br><br>

## Compile your app inside the Docker container

There may be occasions 
where it is not appropriate to run your app inside a container.  

To compile, but not run your app inside the Docker instance, 
you can write something like:

`$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.8 go build -v`





This will add your current directory as a volume to the container,  
set the working directory to the volume,  

and run the command `go build` which will tell go 
to compile the project in the working directory       and output the executable to `myapp`.   

Alternatively, if you have a `Makefile`, you can run the `make` command inside your container.  

`$ docker run --rm -v "$PWD":/usr/src/myapp -w /usr/src/myapp golang:1.8 make`

