


假设我们需要新建一个功能分支 auth 来做登录功能的开发。  
`git flow feature start auth`  

根据上面的分支模型，所有的功能分支都应该从 develop 分支切出。  
这也就是 git-flow 的好处，你可以 不用在意 当前所在的分支，它会自动帮你 保证没有切错分支~  

Now, start committing on your feature. When done, use:
`git flow feature finish auth`  

Summary of actions:  
- The feature branch 'feature/auth' was merged into 'develop'  
- Feature branch 'feature/auth' has been locally deleted   
- You are now on branch 'develop'  

