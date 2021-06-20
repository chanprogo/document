
CentOS  7.x 下  

`yum install -y m4 autoconf automake gcc gcc-c++ make libtool`  

`yum install -y wget`  

`wget https://cmake.org/files/v3.12/cmake-3.12.0-rc1.tar.gz`  

`tar -zxvf cmake-3.12.0-rc1.tar.gz`  

`cd cmake-3.12.0-rc1`   

`./bootstrap`  

`gmake`  

`gmake install`  

`cmake --version`  




```
wget https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2.tar.gz

tar -zxvf cmake-3.13.2.tar.gz

cd cmake-3.13.2

./bootstrap && make && make install
```








## cmake 编译报错

CMakeFiles/cmTryCompileExec2834106963.dir/CheckSymbolExists.c.o:In function `main':  
CheckSymbolExists.c:(.text+0xc):undefined reference to `pthread_create'  
collect2: ld returned 1exit status  



`ln -s /usr/bin/aclocal /usr/bin/aclocal-1.14`  

`ln -s /usr/bin/automake /usr/bin/automake-1.15`   

`yum install -y texinfo`  


 

### 下载安装最新的 autoconf

`wget http://ftpmirror.gnu.org/autoconf/autoconf-2.69.tar.gz`  

`tar xzf autoconf-2.69.tar.gz`  

`cd autoconf-2.69`  

`./configure --prefix=/usr/local`  

`make`  

`make install`  
