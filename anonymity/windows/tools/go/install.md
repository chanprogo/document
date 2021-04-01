

### MSI installer
Open the MSI file and follow the prompts to install the Go tools. 

By default, the installer puts the Go distribution in `c:\Go`. 

The installer should put the `c:\Go\bin` directory in your PATH environment variable. You may need to restart any open command prompts for the change to take effect.


<br><br><br><br>
### 测试是否安装成功
Check that Go is installed correctly by setting up a workspace and building a simple program, as follows.

* Create your workspace directory, `%USERPROFILE%\go`. (If you'd like to use a different directory, you will need to set the `GOPATH` environment variable.)

* Next, make the directory `src/hello` inside your workspace, and in that directory create a file named `hello.go` that looks like:

```go
package main
import "fmt"
func main() {
	fmt.Printf("hello, world\n")
}
```
Then build it with the go tool:
```
C:\> cd %USERPROFILE%\go\src\hello
C:\Users\Gopher\go\src\hello> go build
```

---

You can run go install to install the binary into your workspace's bin directory or go clean -i to remove it.
