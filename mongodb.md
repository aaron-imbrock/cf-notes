# MongoDB WSL Notes

This is just for WSL, but will cover all necessary steps to accomplish https://codefellows.github.io/setup-guide/code-301/1-database

```shell

wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
sudo apt-get install gnupg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
```
### Install libssl1.1, and then install mongodb
```shell
curl -s http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -o /tmp/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i /tmp/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo apt-get update
sudo apt-get install -y mongodb-org
```
### Install Mongo Init scripts
```shell
sudo curl -s https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d -o /etc/init.d/mongod
sudo chmod 755 /etc/init.d/mongod
```
```shell
sudo service mongod start  # this will fail, but creates the mongod.pid file for us
```
### Fix PID file permissions
```shell
sudo chown mongodb:mongodb /var/run/mongod.pid
sudo chmod 644 /var/run/mongod.pid

sudo service mongod start  # this will succeed
```
```shell
mongosh # confirm access to mongosh works, 

```
