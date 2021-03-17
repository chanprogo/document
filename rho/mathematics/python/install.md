
`apt-get install python3`  




<br><br>

`cd /usr/local/lib/ && ll | grep python`  
`python3.5 -V`  
`python3.5`  





<br><br> 

`cd /usr/bin && ll | grep python`  

python 默认指向 python2.7，要将其修改指向 python3.5  
`rm python && ln -s /usr/bin/python3.5 /usr/bin/python`  
