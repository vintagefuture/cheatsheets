# git-cheatsheet

**Commit changes**
```
git add --all
git commit -am "<message>"
git push origin master
```

**Get the URL that a local Git repository was originally cloned from:**

```
git config --get remote.origin.url
```

**Push an empty commit (for example to trigger a Drone automation):**

```
git commit --allow-empty -m "Empty-Commit"
```



.gitignore will prevent untracked files from being added (without an add -f) to the set of files tracked by Git. However, Git will continue to track any files that are already being tracked.

To stop tracking a file, we must remove it from the index:
```
git rm --cached <file>
```
To remove a folder and all files in the folder recursively:
```
git rm -r --cached <folder>
```
The removal of the file from the head revision will happen on the next commit.

WARNING: While this will not remove the physical file from your local machine, it will remove the files from other developers' machines on their next git pull.

**Retrieve updates from the remote (but don't pull just yet...)**
```
git fetch
```

**Fuse several local commits into a single one to push upstream**
```
git rebase -i HEAD~5
```
* From the vim file change to squash all the commits you want to fuse together and save the file
* Remove the commit messages you don't want (simple comment is fine)
```
git push --force origin HEAD
```
Source: https://www.internalpointers.com/post/squash-commits-into-one-git

**Remove all local changes**
```
git reset –hard
git clean -fxd
```

**Show abbreviated git log**
```
git log --oneline
```
which is actaully a shorthand for:
```
git log --pretty=oneline --abbrev-commit
```
**Amend the date**
```
GIT_COMMITTER_DATE="$(date)" git commit --amend --no-edit --date "$(date)"
```

**Amend the author**
```
git commit --amend --author="Author Name <email@address.com>"
```
