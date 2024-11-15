# Update Windows 10 from PowerShell

Right-click on the Windows 10 Start Menu.

Left-click on Windows PowerShell (Admin)

## In POWERSHELL (ADMIN)

# WSL Computer Setup Instructions

Cliff Notes of the [WSL Setup Guide](https://codefellows.github.io/setup-guide/)

All code blocks can be copy/pasted into the terminal unless noted otherwise. ***Reboots are not required except where called out.***

These notes are for staff of CodeFellows and not intended for students. If you're a student reading this, you should follow the official guide linked to above.

*Pull Requests gladly accepted.*

## In case of ...

If you notice you're logged in as root you can fix that by:

```bash
vim /etc/wsl.conf	# open this file

[user]			# type these two lines in
default=username	# replace username with your username
```

## In POWERSHELL (ADMIN)

Enable the Windows Subsystem for Linux
```bash
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
Enable Virtual Machine feature
```bash
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
### Reboot your computer
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
### Reboot your computer

## Install Ubuntu from the Microsoft store page

This is the same as opening the Microsoft Store app, searching for 'Ubuntu' and installing it from there:
```powershell
wsl --install -d ubuntu
```

From the Start Menu search for Ubuntu. Open it.

Install Ubuntu with a simple username and password. Note the password you used. Keep it simple.

### Enable Virtualization in the BIOS
Skip this part if Ubuntu installed correctly.

In the previous section you installed Ubuntu. Upon first run of the Ubuntu application, if you saw an error message upon first load, then Virtualization likely needs to be enabled in the BIOS. Make sure to Google the error message, of course.

If enabling Virtualization in the BIOS is necessary have the student install Zoom on their cell phone, start a Zoom meeting with them and make sure audio and video work before leaving Remo. 

Getting into the BIOS requiring hitting a specific key before the OS starts to boot up. You don't have much time so if you miss it just reboot and try again. Look for a message on the screen similar to 'Press [F2] to enter BIOS'. Something like that. It's usually **F2** or **DELETE**. 

Once in the BIOS look for Virtualization under the ADVANCED section. Googling 'enable virtualization in /model/ /manufacturer/' is how I go if I can't find it. 

## Now in the UBUNTU TERMINAL:

From the Start Menu search for Ubuntu. Open it.

You now have a fresh linux install. In a moment we'll install the necessary programs you need to code with but we'll start by updating the system itself.
```bash
sudo sh -c 'apt update && apt -y full-upgrade && apt install -y zsh build-essential wget ca-certificates'
sudo sh -c 'apt -y autoremove'
```
### Change the default shell to ZSH
```bash
chsh -s /usr/bin/zsh
```

### Install Oh-My-ZSH
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Fully close all Ubuntu terminals. Then open a new Ubuntu terminal before continuing.

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

#### http.postBuffer explanation
[git config --global http.postBuffer](https://git-scm.com/docs/git-config#Documentation/git-config.txt-httppostBuffer)

```bash
git config --global user.name 'First and Last Name' # For example 'Aaron Imbrock' 
git config --global user.email 'your github email address'
git config --global core.editor "code --wait"
git config --global init.defaultbranch main
git config --global core.pager "cat"
git config --global http.postBuffer 157286400
# Confirm changes
git config --list
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
  ![Screenshot of Visual Studio Code Install screen showing all necessary checkboxes.](media/vsc.PNG)
* Install needed VSCODE extensions nice and easy, this includes the WSL extension too

```bash
   
for extensions in dbaeumer.vscode-eslint EditorConfig.EditorConfig george-alisson.html-preview-vscode ms-vscode-remote.remote-wsl rangav.vscode-thunder-client ritwickdey.LiveServer 
do code --install-extension $extensions 
done
```

### Close VSCode and exit Ubuntu.

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
