

`cat /proc/sys/fs/inotify/max_user_watches`  



<br><br>

`vim /etc/sysctl.conf`

adding this line to the end of the file:  
`fs.inotify.max_user_watches=524288`

The new value can then be loaded in by running   
`sysctl -p`.

<br><br><br><br><br>





Another option is to exclude specific workspace directories from the VS Code file watcher with the files.watcherExclude setting. The default for files.watcherExclude excludes node_modules and some folders under .git, but you can add other directories that you don't want VS Code to track.

```
"files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/node_modules/*/**": true
}
```