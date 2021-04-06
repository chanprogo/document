
HTTP 是一种请求-响应协议，协议涉及的 所有事情 都以一个请求开始。
HTTP 请求 跟其他所有 HTTP 报文（message）一样，都由 一系列文本行 组成，这些文本行 会按照以下顺序 进行排列： 
（1）请求行（request- line）； 
（2）零个或任意多个请求首部（header）； 
（3）一个空行； 
（4）可选的报文主体（body）。




 一个典型的 HTTP 请求看上去是这个样子的：
 ```
 GET /Protocols/rfc2616/rfc2616.html HTTP/1.1 
 Host: www.w3.org 
 User-Agent: Mozilla/5.0 
 (empty line)
```






请求行中的第一个单词为请求方法（request method），之后跟着的是统一资源标识符（Uniform Resource Identifier，URI）以及所用的 HTTP 版本。位于请求行之后的两个文本行为请求的首部。 注意，这个报文的最后一行为空行，即使报文的主体部分为空，这个空行也必须存在，至于报文是否包含主体则需要根据请求使用的方法而定。

大多数 HTTP 请求首部都是可选的，宿主（Host）首部字段是 HTTP 1. 1 唯一强制要求的首部。根据请求使用的方法不同，如果请求的报文中包含有可选的主体，那么请求的首部还需要带有内容长度（Content- Length）字段或者传输编码（Transfer-Encoding）字段。


HTTP 响应的组织方式跟 HTTP 请求的组织方式是完全相同的。  

HTTP 响应的第一行为状态行，这个文本行包含了状态码（status code）和相应的原因短语（reason phrase），原因短语对状态码进行了简单的描述。  