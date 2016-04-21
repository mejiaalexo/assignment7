# team12-spring16

## Useful Git commands 

### Create a Git repo and push it to a remote repo as a branch
This was used for assignment 6; where I created a local repo and pushed my changes to an assignment6 branch in the team12-spring16 repo.

1. Create rails project 

   rails create new _appName_
   _cd **appName**_
2. Initialize local directory as a Git repo 

   _git init_
3. Add the files to your new local directory

   _git add --all_
4. Commit the files you've staged in your local repo

   _git commit -m "Sample Commit Message"_
5. Copy the URL for the remote repo from Github
6. Setup the remote repo

   _git remote add origin https://github.com/RubyOnRails-JHU-605-484/team12-spring16.git_
7. Verify the new remote URL 

   _git remote -v_
8. Push the changes in your local repo to Github (new branch)

   _git push origin master:assignment6_
9. Setup upstream (where you pull from for specific repo)

   Assuming that you are within your master branch of the new repo  
      _git branch --set-upstream-to=origin/assignment6 master_  
        You can now push and pull from origin/assignment6 in your local git repo  
           push: _git push origin HEAD:assignment6_  
           pull: _git pull origin assignment6_

