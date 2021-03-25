
In order to generate Go code, 
the Go package's import path must be provided for every .proto file 
(including those transitively depended upon by the .proto files being generated).     



We recommend declaring it within the .proto file 
so that the Go packages for .proto files can be centrally identified with the .proto files themselves 
and to simplify the set of flags passed when invoking protoc.    



The Go import path is locally specified in a .proto file 
by declaring a go_package option 
with the full import path of the Go package. Example usage:  

```
option go_package = "example.com/project/protos/fizz";
```