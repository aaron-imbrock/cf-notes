# MongoDB WSL Notes

```shell

wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
sudo apt-get install gnupg
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list


curl -s http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -o /tmp/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i /tmp/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo apt-get update
sudo apt-get install -y mongodb-org


sudo curl -s https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d -o /etc/init.d/mongod
sudo chmod 755 /etc/init.d/mongod

sudo service mongod start  # this will fail, but creates the mongod.pid file for us

sudo chown mongodb:mongodb /var/run/mongod.pid
sudo chmod 644 /var/run/mongod.pid

sudo service mongod start  # this will succeed

mongosh # confirm access to mongosh works, 

```
