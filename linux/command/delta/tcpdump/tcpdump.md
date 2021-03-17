

```
ip addr
```





```
tcpdump -i eth0 -w 001.pcap
```









监视指定网络接口的数据包（如果不指定网卡，默认`tcpdump`只会监视第一个网络接口，一般是`eth0`）：
```
tcpdump -i eth1
```












## tcpdump 与 Wireshark

Wireshark 是 Windows 下非常简单易用的抓包工具。我们可以用 tcpdump 在 Linux 里抓包，然后在Windows 里分析包。
```
tcpdump tcp -i eth1 -t -s 0 -c 100 and dst port ! 22 and src net 192.168.1.0/24 -w ./target.cap
```
(1)`tcp`: ip、icmp、arp、rarp 和 tcp、udp、icmp这些选项等都要放到第一个参数的位置，用来过滤数据报的类型
(2)`-i eth1`: 只抓经过接口eth1的包
(3)`-t`: 不显示时间戳
(4)`-s 0`: 抓取数据包时默认抓取长度为68字节。加上`-s 0`后可以抓到完整的数据包
(5)`-c 100`: 只抓取100个数据包
(6)`dst port ! 22`: 不抓取目标端口是22的数据包
(7)`src net 192.168.1.0/24`: 数据包的源网络地址为192.168.1.0/24
(8)`-w ./target.cap`: 保存成cap文件，方便用 Wireshark 分析


