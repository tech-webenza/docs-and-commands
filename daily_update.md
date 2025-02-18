
## Go to location
```
cd /usr/local/bin/
```
## Create a file
```
sudo nano daily_update.sh
```
## Add the following code to the file (daily_update.sh)
```
#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
sudo apt-get -y remove
```
## Save the file
```
ctrl+o and ctrl+x
```
