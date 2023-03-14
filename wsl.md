# WSL Computer Setup Instructions

## In POWERSHELL (ADMIN)

### Enable the Windows Subsystem for Linux
```bash
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
### Enable Virtual Machine feature
```bash
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
Reboot your computer
```bash
wsl --install # If this step is necessary you'll next need to reboot the computer again
```
### Set WSL 2 as your default version
```bash
wsl --set-default-version 2
wsl --update
wsl --shutdown
```
### Install Ubuntu 20.04 LTS from the Microsoft store page

[Install Ubuntu 20.04LTS](https://www.microsoft.com/store/apps/9n6svws3rx71)

## Now in the UBUNTU TERMINAL:
```bash
sudo sh -c 'apt update && apt -y full-upgrade && apt install -y zsh build-essential wget ca-certificates'
sudo sh -c 'apt -y autoremove'
```
Now change the default shell to ZSH
```bash
chsh -s /usr/bin/zsh
```
Fully close all Ubuntu terminals. Then open a new Ubuntu terminal before continuing.
## 
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install gcc git gh tree node

git config --global user.name 'YOUR NAME HERE'              # This is a resume, so use your name as it appears on LinkedIn
git config --global user.email 'your github email address'  # 
git config --global core.editor "code --wait"
git config --global init.defaultbranch main

gh auth login

npm install -g live-server eslint --loglevel verbose

mkdir -p ~/Codefellows/{102,201,301,401} && cd ~/Codefellows/;

git clone reading-notes-url # Use the URL of your reading notes repo not "reading-notes-url"

* Read through the instructions at this link so you understand process. Don't install extensions yet: https://codefellows.github.io/setup-guide/system-setup/windows/10-vscode.html
** This link will install the correct version: VSCODE System Installer x64 https://code.visualstudio.com/docs/?dv=win64

** eslint also needs to be installed as a local extension with VSCODE.

### Equivalent to manually installing each extension including WSL Remote, but from WSL Ubuntu cli
for extensions in dbaeumer.vscode-eslint EditorConfig.EditorConfig george-alisson.html-preview-vscode ms-vscode-remote.remote-wsl rangav.vscode-thunder-client ritwickdey.LiveServer
do code --install-extension $extensions
done

Close VSCode
exit Ubuntu terminal so 'code .' will work.

curl -Ls https://bit.ly/3qMWhbE | bash

## JS 401 Only

pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgresql@14 start
echo 'alias pgstart="pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgresql@14 start"' >> ~/.zshrc
echo 'alias pgstop="pg_ctl -D /home/linuxbrew/.linuxbrew/var/postgresql@14 stop"' >> ~/.zshrc
createdb `whoami`
