
### Issue
There's a bug in HomeBrew's install of `gh`. 

When `gh` get's updated to a newer version the full path in `~/.gitconfig` still points to the older version.
Subsequently, a `git push` will fail and try to fall back to https. https on Github has been deprecated and no longer works. So you'll be prompted for your github username and password only to have that fail.

The fix is to update the full path in the `.gitconfig` file to point to the newest version.

```shell
$ git push origin main
Username for 'https://github.com': test@gmail.com
Password for 'https://test@gmail.com@github.com': 
remote: Support for password authentication was removed on August 13, 2021.
remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.
fatal: Authentication failed for 'https://github.com/aaron-imbrock/cookie-stand.git/'
```

In the example below the newest version of `gh` is 2.23.0 but the `.gitconfig` file is still looking for 1.18.0. Check this with:
```shell
ls -l $(which gh)
```
For example:
```shell
$ ls -l $(which gh)
lrwxrwxrwx 1 ubuntu ubuntu 26 Feb 21 12:27 /home/linuxbrew/.linuxbrew/bin/gh -> ../Cellar/gh/2.23.0/bin/gh
```
```shell
$ cat .gitconfig 
...
[credential "https://github.com"]
	helper = 
	helper = !/home/linuxbrew/.linuxbrew/Cellar/gh/1.18.0/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper = 
	helper = !/home/linuxbrew/.linuxbrew/Cellar/gh/1.18.0/bin/gh auth git-credential
```
### Fix 
Open `.gitconfig` and change the version to match the new version and `git push` will once again just work.
```shell
[credential "https://github.com"]
	helper = 
	helper = !/home/linuxbrew/.linuxbrew/Cellar/gh/2.23.0/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper = 
	helper = !/home/linuxbrew/.linuxbrew/Cellar/gh/2.23.0/bin/gh auth git-credential
```
### OR

If you clone with **SSH** the issue is bypassed and you'll never see it.
