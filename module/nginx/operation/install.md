
# 一

**添加运行 nginx 服务进程的用户：**  
`groupadd -r nginx`  
`useradd -r -g nginx nginx`  











**下载源码包解压编译**  
1. `wget http://nginx.org/download/nginx-1.10.2.tar.gz`  
2. `tar xvf nginx-1.10.2.tar.gz -C /usr/local/src`  
3. `yum groupinstall "Development tools" `  
4. `yum -y install gcc wget gcc-c++ automake autoconf libtool libxml2-devel libxslt-devel perl-devel perl-ExtUtils-Embed pcre-devel openssl-devel`
5. `cd /usr/local/src/nginx-1.10.2`  
6. `./configure \`  










```
--prefix=/usr/local/nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/tmp/nginx/client \
--http-proxy-temp-path=/var/tmp/nginx/proxy \
--http-fastcgi-temp-path=/var/tmp/nginx/fcgi \
--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi \
--http-scgi-temp-path=/var/tmp/nginx/scgi \
--user=nginx \
--group=nginx \
--with-pcre \
--with-http_v2_module \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-http_auth_request_module \
--with-mail \
--with-mail_ssl_module \
--with-file-aio \
--with-ipv6 \
--with-http_v2_module \
--with-threads \
--with-stream \
--with-stream_ssl_module
```




`make && make install`  
`mkdir -pv /var/tmp/nginx/client`  







# 二  

添加 SysV 启动脚本：`vim /etc/init.d/nginx`  

```sh
#!/bin/sh 
# 
# nginx - this script starts and stops the nginx daemon 
# 
# chkconfig:   - 85 15 
# description: Nginx is an HTTP(S) server, HTTP(S) reverse \ 
#               proxy and IMAP/POP3 proxy server 
# processname: nginx 
# config:      /etc/nginx/nginx.conf 
# config:      /etc/sysconfig/nginx 
# pidfile:     /var/run/nginx.pid 
# Source function library. 
. /etc/rc.d/init.d/functions
# Source networking configuration. 
. /etc/sysconfig/network
# Check that networking is up. 
[ "$NETWORKING" = "no" ] && exit 0
nginx="/usr/sbin/nginx"
prog=$(basename $nginx)
NGINX_CONF_FILE="/etc/nginx/nginx.conf"
[ -f /etc/sysconfig/nginx ] && . /etc/sysconfig/nginx
lockfile=/var/lock/subsys/nginx
start() {
    [ -x $nginx ] || exit 5
    [ -f $NGINX_CONF_FILE ] || exit 6
    echo -n $"Starting $prog: " 
    daemon $nginx -c $NGINX_CONF_FILE
    retval=$?
    echo 
    [ $retval -eq 0 ] && touch $lockfile
    return $retval
}
stop() {
    echo -n $"Stopping $prog: " 
    killproc $prog -QUIT
    retval=$?
    echo 
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
killall -9 nginx
}
restart() {
    configtest || return $?
    stop
    sleep 1
    start
}
reload() {
    configtest || return $?
    echo -n $"Reloading $prog: " 
    killproc $nginx -HUP
RETVAL=$?
    echo 
}
force_reload() {
    restart
}
configtest() {
$nginx -t -c $NGINX_CONF_FILE
}
rh_status() {
    status $prog
}
rh_status_q() {
    rh_status >/dev/null 2>&1
}
case "$1" in
    start)
        rh_status_q && exit 0
    $1
        ;;
    stop)
        rh_status_q || exit 0
        $1
        ;;
    restart|configtest)
        $1
        ;;
    reload)
        rh_status_q || exit 7
        $1
        ;;
    force-reload)
        force_reload
        ;;
    status)
        rh_status
        ;;
    condrestart|try-restart)
        rh_status_q || exit 0
            ;;
    *)
      echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart|reload|force-reload|configtest}" 
        exit 2
esac
```

赋予脚本执行权限：`chmod +x /etc/init.d/nginx`  
添加至服务管理列表，设置开机自启：  
`chkconfig --add nginx`  
`chkconfig  nginx on`  




# 三

启动服务：`service nginx start`。浏览器访问可看到默认欢迎页面  










# 四

修改 nginx 的配置文件。记得备份默认的配置文件。  
`cp /etc/nginx/nginx.conf /etc/nginx/nginx.confbak`  
`cp /etc/nginx/nginx.conf.default /etc/nginx/nginx.conf`  
编辑 /etc/nginx/nginx.conf：  


```
location ~ (\.jsp)|(\.action)|(\.do)|(\.js)|(\.css)|(\.html)?$ {
             proxy_pass   http://127.0.0.1:8080;
        }
```
         
重新载入nginx的配置文件：`service nginx reload`  



