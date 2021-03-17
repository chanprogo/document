

## 什么是 patch
patch 即补丁之意，记录文件中的不同，能够与文件进行整合，从而改变文件中的内容

## 如何制作 patch
在 Linux 系统中提供了`diff`程序，可以使用`diff`程序，比较文件之间的不同从而制作出patch文件。

在系统中（这里是Ubuntu）创建 diff 文件夹,创建 test1.txt 和 test2.txt：
```
mkdir diff
vi test1.txt
vi test2.txt
```
test1.txt 文件内容如下
```
aaaa
```
test2.txt 文件内容如下
```
aaaa
bbbb
```

使用`diff`命令制作 patch 文件
```
diff -Naur test1.txt test2.txt > test.patch
```
之后在当前目录中会存在三个文件：
test1.txt
test2.txt 
test.patch

test.patch 文件的内容：
```
--- test1.txt   2018-08-01 13:17:33.530350672 +0800
+++ test2.txt   2018-08-01 13:18:54.326350260 +0800
@@ -1 +1,2 @@ 
 aaaa
+bbbb
```
`diff`参数解释
-N 在比较目录时如果某个文件只出现了一次，那么在比较不同时会默认和空文件比较
-a  将所有的文件都作为普通text(之比较文本文件)
-u 以合并的方式显示文件内容的不同
-r 如果是文件夹则进行递归进行比较

---
---
---

## 如何使用patch
准备好 patch 文件和原版本文件，创建 patch 文件夹，将 test1.txt 和 test.patch 文件拷贝进去：
```
mkdir patch
cp test1.txt test.patch../patch/
```

执行patch命令
```
patch -p0 < test.patch
```
test1.txt 文件内容如下。可以看到patch已经打进去了。
```
aaa
bbb
```


参数介绍：
patch命令有很多参数，其中最常用的就是`-pX`这个参数

在上面我们注意到patch文件如下内容
--- test1.txt   2018-08-01 13:17:33.530350672 +0800
此时我们的参数为`-p0`，此时 patch 就会在当前目录下寻找 test1.txt 文件，

如在在patch文件中是这样记录的
---a/b/test1.txt   2018-08-01 13:17:33.530350672 +0800
那么`-p0`会在当前目录下寻找 a 目录，a 目录下寻找 b，之后在 b 中寻找 test1.txt 文件。
如果是`-p1`，patch 命令就会舍弃 a，先寻找 b 再寻找 test1.txt
如果是`-p2` ,会舍弃 a/b，直接寻找 test1.txt

所以`-pX`中`X`代表就是所要舍弃的层级目录