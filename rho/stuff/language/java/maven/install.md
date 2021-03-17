
http://maven.apache.org/download.cgi





`sudo mkdir /opt/maven`  

`chmod -R 777 /opt/maven`  

`tar -C /opt/maven -zxvf apache-maven-3.5.0-bin.tar.gz`  




`vim /etc/profile`  

在文件内容后面添加以下内容：  

```
export M2_HOME=/opt/maven/apache-maven-3.5.0
export CLASSPATH=$CLASSPATH:$M2_HOME/lib
export PATH=$PATH:$M2_HOME/bin
```

`source /etc/profile`  






<br><br><br>

执行（如果是平时的开发环境，建议在 root 和普通账号下都执行）以下命令：  
`echo "export PATH=$PATH:$M2_HOME/bin" >> ~/.bashrc`   
`source ~/.bashrc`  








`mvn -v`  











修改 maven 源为阿里云，以及仓库默认存放路径。这样 maven 下载 jar 包的速度会快很多。  
打开 maven 的配置文件。  

`vim /opt/maven/apache-maven-3.5.0/conf/settings.xml`



