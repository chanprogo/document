
# chmod

该命令用于改变文件的权限，一般的用法如下：

```
chmod [-R] xyz 文件或目录  

-R：进行递归的持续更改，即连同子目录下的所有文件都会更改  

同时，chmod还可以使用u（user）、g（group）、o（other）、a（all）和+（加入）、-（删除）、=（设置）跟rwx搭配来对文件的权限进行更改。
```


```
# 把file的文件权限改变为-rxwr-xr-x  
chmod 0755 file 
# 向file的文件权限中加入用户组可写权限  
chmod g+w file 
```










# chgrp

用于改变**文件所属用户组**，它的使用非常简单，它的基本用法如下：

```
chgrp [-R] dirname/filename  

-R ：进行递归的持续对所有文件和子目录更改  

# 递归地把dir目录下中的所有文件和子目录下所有文件的用户组修改为users 
chgrp users -R ./dir 
```

 
`chown`命令用于改变**文件的所有者**，与`chgrp`命令的使用方法相同，只是修改的文件属性不同，不再详述。


