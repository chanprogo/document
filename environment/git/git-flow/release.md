
`git flow release start 0.1.0`  

Summary of actions:  
- A new branch 'release/0.1.0' was created, based on 'develop'  
- You are now on branch 'release/0.1.0'  

Follow-up actions:
- Bump the version number now!
- Start committing last-minute fixes in preparing your release

在正常的开发流程中，提测后的 bug 修复阶段 就可以在这个 release/0.1.0 分支上做，  
然后 等测试 通过后，就可以 标记 版本发布完成  
- When done, run:

`git flow release finish '0.1.0'`  

Summary of actions:
- Release branch 'release/0.1.0' has been merged into 'master'
- The release was tagged 'v0.1.0'
- Release tag 'v0.1.0' has been back-merged into 'develop'
- Release branch 'release/0.1.0' has been locally deleted
- You are now on branch 'develop'  

