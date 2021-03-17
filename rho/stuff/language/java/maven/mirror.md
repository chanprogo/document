
其实方法很简单：maven 是支持镜像的，我们可以在 ${maven_home} 的 conf 目录下的 setting.xml 文件中找到 <mirrors></mirrors> 标签

加入国内镜像

```xml
<mirrors>
    <mirror>
      <id>alimaven</id>
      <name>aliyun maven</name>
      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
      <mirrorOf>central</mirrorOf>        
    </mirror>
</mirrors>
```





下面是一些常用的 maven 国内镜像 

```xml
    <mirror>  
      <id>CN</id>    
      <name>OSChina Central</name>                                                                          
      <url>http://maven.oschina.net/content/groups/public/</url>    
      <mirrorOf>central</mirrorOf>  
    </mirror>  

    <mirror>      
          <id>repo2</id>      
          <mirrorOf>central</mirrorOf>      
          <name>Human Readable Name for this Mirror.</name>      
          <url>http://repo2.maven.org/maven2/</url>      
    </mirror>  

    <mirror>      
          <id>net-cn</id>      
          <mirrorOf>central</mirrorOf>      
          <name>Human Readable Name for this Mirror.</name>      
          <url>http://maven.net.cn/content/groups/public/</url>       
    </mirror>  

    <mirror>      
          <id>ui</id>      
          <mirrorOf>central</mirrorOf>      
          <name>Human Readable Name for this Mirror.</name>      
         <url>http://uk.maven.org/maven2/</url>      
    </mirror> 

    <mirror>      
          <id>ibiblio</id>      
          <mirrorOf>central</mirrorOf>      
          <name>Human Readable Name for this Mirror.</name>      
         <url>http://mirrors.ibiblio.org/pub/mirrors/maven2/</url>      
    </mirror>  

    <mirror>      
          <id>jboss-public-repository-group</id>      
          <mirrorOf>central</mirrorOf>      
          <name>JBoss Public Repository Group</name>      
         <url>http://repository.jboss.org/nexus/content/groups/public</url>      
    </mirror>    
        
        
    <mirror>      
          <id>JBossJBPM</id>  
          <mirrorOf>central</mirrorOf>  
          <name>JBossJBPM Repository</name>  
          <url>https://repository.jboss.org/nexus/content/repositories/releases/</url>  
    </mirror>  

    <mirror>      
          <id>antelink</id>  
          <mirrorOf>central</mirrorOf>  
          <name>antelink Repository</name>  
          <url>http://maven.antelink.com/content/repositories/central/</url>  
    </mirror>  

    <mirror>      
          <id>openkoala</id>  
          <mirrorOf>central</mirrorOf>  
          <name>openkoala Repository</name>  
          <url>http://nexus.openkoala.org/nexus/content/groups/Koala-release/</url>  
    </mirror>  
    <mirror>      
          <id>tmatesoft</id>  
          <mirrorOf>central</mirrorOf>  
          <name>tmatesoft Repository</name>  
          <url>http://maven.tmatesoft.com/content/groups/public/</url>  
    </mirror>  
    
    <mirror>      
          <id>mavensync</id>  
          <mirrorOf>central</mirrorOf>  
          <name>mavensync Repository</name>  
          <url>http://mavensync.zkoss.org/maven2/</url>  
    </mirror>
```


