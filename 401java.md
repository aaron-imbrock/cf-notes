# Steps to use wsl and intellij for windows:
  open wsl distro
## install gradle in distro
```bash
sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update
sudo apt-get install gradle
install jetbrains toolbox/ manual install of intellij
add to .bashrc or whatever you are using and add alias idea to path of idea64 executable
```
download termium for linux https://adoptium.net/temurin/releases/
move tar to wsl ~/home/ and extract at /opt/ with `tar -xvzf community_images.tar.gz /opt/some_custom_folder_name`
now add again into .bashrc or whatever you are using
```bash
export JAVA_HOME=/opt/jdk-17.0.6+10 
export PATH=$PATH:/opt/jdk-17.0.6+10/bin
export PATH=$PATH:/usr/share/gradle/bin
```
9. source .bashrc
10. ``which gradle` and `gradle -v` now work `java -v` .`
11. `gradle init` in a project directory
12.  open with  `idea .` and intellij is open  go to file->settings->Build, Execution, Deployment-> Gradle . gradle user home should be set to /home/username/.gradle, Gradle JVM should be set to use (WSL) Termium 17.
13. sync gradle will take long. 

* Reference : https://www.bleepingcomputer.com/news/microsoft/how-to-run-windows-10-programs-in-a-wsl-linux-shell/
