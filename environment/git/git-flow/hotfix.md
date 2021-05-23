
由于 master 分支一直反映了 线上生产环境的状况，所以 如果 要进行 生产热修复，
就需要从 master 分支切出，下面 假如 我们线上的 banner 有一个 bug：  

`git flow hotfix start banner`  

Summary of actions:
- A new branch 'hotfix/banner' was created, based on 'master'  
- You are now on branch 'hotfix/banner'  

需要注意的是：
hotfix 分支和 release 分支比较像，  
唯一的区别是 hotfix 分支是基于 master 切出的。  

Follow-up actions:
- Start committing your hot fixes
- Bump the version number now!
- When done, run:

`git flow hotfix finish 'banner'`  

Summary of actions:  
- Hotfix branch 'hotfix/banner' has been merged into 'master'
- The hotfix was tagged 'vbanner'
- Hotfix tag 'vbanner' has been back-merged into 'develop'
- Hotfix branch 'hotfix/banner' has been locally deleted
- You are now on branch 'develop'  

