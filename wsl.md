# WSL Computer Setup Instructions

Cliff Notes of the [WSL Setup Guide](https://codefellows.github.io/setup-guide/)

All code blocks can be copy/pasted into the terminal unless noted otherwise. ***Reboots are not required except where called out.***

These notes are for staff of CodeFellows and not intended for students. If you're a student reading this, you should follow the official guide linked to above.

*Pull Requests gladly accepted.*

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
Note:

In the next section you'll install Ubuntu. If you still see an error message upon first load, then Virtualization likely needs to be enabled in the BIOS.
Have the student install Zoom on their cell phone, start a Zoom meeting with them and make sure audio and video work before leaving Remo. 

Getting into the BIOS requiring hitting a key. It's usually **F2** or **DELETE**. Look for Virtualization under the ADVANCED section in the BIOS. Googling 'enable virtualization in /model/ /manufacturer/' is how I go if I can't find it. 

### Reboot your computer

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
Github is essentially a resume, so use your name as it appears on LinkedIn. Make the changes below inside the single quotes.
```bash
git config --global user.name 'First and Last Name' # For example 'Aaron Imbrock' 
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
  * During the install make sure every single checkbox is cheched.
* Install needed VSCODE extensions nice and easy, this includes the WSL extension too
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
