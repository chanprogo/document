
## Start a Go instance in your app

The most straightforward way to use this image is to use a Go container as both the build and runtime environment.  

In your `Dockerfile`, writing something along the lines of the following will compile and run your project:   



```
FROM golang:1.8

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["app"]
```



You can then build and run the Docker image.  