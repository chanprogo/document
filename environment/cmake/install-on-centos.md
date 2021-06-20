
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