# WSL Computer Setup Instructions

Cliff Notes of the [WSL Setup Guide](https://codefellows.github.io/setup-guide/)

All code blocks can be copy/pasted into the terminal unless noted otherwise.

## In POWERSHELL (ADMIN)

Enable the Windows Subsystem for Linux
```bash
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
Enable Virtual Machine feature
```bash
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
Install WSL
```bash
wsl --install
```
If `wsl --install` was necessary you'll need to reboot the computer yet again. (Confirm this please and tell Aaron).
Now Set WSL 2 as the default version
```bash
wsl --set-default-version 2
```
```bash
wsl --shutdown
```
```bash
wsl --update
```

## Install Ubuntu 20.04 LTS from the Microsoft store page

[Install Ubuntu 20.04LTS](https://www.microsoft.com/store/apps/9n6svws3rx71)

Install Ubuntu with a simple username and password. Note the password you used. Keep it simple.

## Now in the UBUNTU TERMINAL:
You have a fresh linux install. In a moment we'll install the necessary programs you need to code with but we'll start by updating the system itself.
```bash
sudo sh -c 'apt update && apt -y full-upgrade && apt install -y zsh build-essential wget ca-certificates'
sudo sh -c 'apt -y autoremove'
```
### Change the default shell to ZSH
```bash
chsh -s /usr/bin/zsh
```
Fully close all Ubuntu terminals. Then open a new Ubuntu terminal before continuing.

### Install Oh-My-ZSH
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
```bash
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```
### Install necessary tools from Homebrew
```bash
brew install gcc git gh tree node
```
### Copy this into Notepad and update. Paste notepad text into terminal.
Github is essentially a resume, so use your name as it appears on LinkedIn.
```bash
git config --global user.name 'YOUR NAME HERE'
git config --global user.email 'your github email address'
git config --global core.editor "code --wait"
git config --global init.defaultbranch main
```
### Run Github Authentication
```bash
gh auth login
```
### Install live-server on commandline
```bash
npm install -g live-server eslint --loglevel verbose
```
### Setup CF class directories and clone down reading-notes repo
```bash
mkdir -p ~/Codefellows/{102,201,301,401} && cd ~/Codefellows/;
```
Use the URL of your reading notes repo not "reading-notes-url".
```bash
git clone reading-notes-url
```
When you're done the folder structure will look this, one folder for each class and the reading-notes repo.

```
$ tree Codefellows/
Codefellows/
├── 102
├── 201
├── 301
├── 401
└── reading-notes
```
### Install VSCODE
* Read through the instructions [at this link](https://codefellows.github.io/setup-guide/system-setup/windows/10-vscode.html) so you understand the process but don't install anything yet.
  * Download and install VSCODE System Installer x64 [HERE](https://code.visualstudio.com/docs/?dv=win64)
* Install needed VSCODE extensions nice and easy, includes WSL extension too
   ```bash
  extensions="dbaeumer.vscode-eslint,EditorConfig.EditorConfig,george-alisson.html-preview-vscode,ms-vscode-remote.remote-wsl,rangav.vscode-thunder-client,ritwickdey.LiveServer"
  Field_Separator=$IFS
  IFS=,

  for extension in $extensions;
	  do code --install-extension $extension
  done

  IFS=$Field_Separator
   ```

### Close VSCode and exit Ubuntu terminal so 'code .' will work.

### Open Ubuntu terminal and confirm `code .` works
```bash
cd ~/Codefellows/; code .
```
Is VSCODE showing your CodeFellows class folders? 

### Verify everything was installed
#### Check versions
Compare [Version List](https://codefellows.github.io/setup-guide/system-setup/windows/11-verify.html) to what you have installed.
```bash
clear
for app in code git node npm eslint tree;
do
	echo
	echo -n "$app version: "; $app --version
done
```
#### Confirm GIT Settings
```bash
git config --list
```

### Run CF Confirm Script
```bash
curl -Ls https://bit.ly/3qMWhbE | bash
```
If everything was installed you'll see:
```bash
~$ curl -Ls https://bit.ly/3qMWhbE | bash
By gum, you've done it!
```
