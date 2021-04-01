
`npm install pkg --save-dev`  

`npm install pkg -g`  


```
 -t, --targets    comma-separated list of targets
 -o, --output     output file name or template for several files
```


<br><br>
```
Examples:

  – Makes executables for Linux, macOS and Windows
    $ pkg index.js

  – Takes package.json from cwd and follows 'bin' entry
    $ pkg .

  – Makes executable for particular target machine
    $ pkg -t node6-alpine-x64 index.js

  – Makes executables for target machines of your choice
    $ pkg -t node4-linux,node6-linux,node6-win index.js
    
  – Bakes '--expose-gc' into executable
    $ pkg --options expose-gc index.js
```