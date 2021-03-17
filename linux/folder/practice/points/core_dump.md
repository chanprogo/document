
输出的结果为0，说明默认是关闭。

```
ulimit -c
```



开启

```
ulimit -c unlimited
```


```
vim /etc/security/limits.conf
```
> `* soft core unlimited`