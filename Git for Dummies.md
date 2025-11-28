
[[../3 - Tags/git]] [[../3 - Tags/linux]] [[../3 - Tags/tutorial]] 
```
git init
```

```
git add <>
```

```
git commit -m "commit messages"
```

```git log
```
log -> time date and commit

### how to goto a specific version/commit

1. Get the hast of that version/commit form git log
2. use checkout to move pointer to that version

```
❯ git log
commit 9d1a055d4935d5352f080d56b46d8a89eb83cc27 (HEAD -> master, origin/master, origin/HEAD)
Author: sifat <hakim.shifat@gmail.com>
Date:   Sat Jul 5 15:38:04 2025 +0600

    improved swayidle

commit b59597f652c6e56810845093338748a37e84e17b
Author: sifat <hakim.shifat@gmail.com>
Date:   Fri Jul 4 22:11:40 2025 +0600

    added rofi

commit 7eff02d9225cbdfece8ea3c286fbfccf656d2348
Author: sifat <hakim.shifat@gmail.com>
Date:   Fri Jul 4 22:09:55 2025 +0600

    scripts folder and updated some config

commit df050f3965b36d5fe5cea081cbe9c1ab5ae7d5bf
```

This is my log of my dotfiles. if i want to move to the version where i just added rofi, you can see in the commits added(now you know why commits are so important)

use get the  commit hash of it and
```
git checkout <the hast>
```

it gets better, when we checked out a different commit, we transported to another timeline. that means, main timeline is intact. and the checkout of our commit is branched to another timeline with its own history and everything.

## If i want to make new-branch(timeline) myself

```
git checkout -b <branch/timeline name>

```

To list the timelines / branches
```
git branch
```

I can also merge the timelines with the master branch.

pushing new branch
```
git push origin new-branch
```

## what is pull request
simply merge request of any other user to the owner.

### i have changes in github but not in my local machine(eg i merged some code)

```
git pull origin master
```

![](attachments/Pasted%20image%2020250706101411.png)

### From learninggirbranching.js.org
![](../attachments/2025-07-06_10-18-14.png)

Merging simplified.

checkout new branch named bugFix
commit once
goback to main and commit
checkout bugFix again. rebase onto main

what happened was the commit from timeline bug fix stacked on top of commit of main timeline.


### Head
*head* is what commit im working on top of right now. it always points to most recent commit of the working tree/timeline.

Normally

head -> timelinename -> commit

we can directly point it to the commit, 

```
git checkout <hash of the commit>
```

## Relative ref

- Moving upwords one commit at a time ^
- Moving upwords a number of times ~(num) 
Just means going back in times/commits with it.

- git checkout (hash)
- git checkout HEAD^
- git checkout HEAD^
- git checkout HEAD^

first command detached the head from timeline to commit. its name is HEAD. and HEAD refers to latest commit. then using ^ to go back in commit one commit at a time.

```
git checkout c1^
```
this moves HEAD to parent of c1

