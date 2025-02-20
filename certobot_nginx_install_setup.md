# Install the necessary packages
## Install certbot in server 
```
sudo snap install --classic certbot
```
OR
```
sudo apt-get install certbot python-certbot-nginx
```
## Run command 
```
sudo certbot --nginx
```

## Select the domain name from list using the number (can select www domain also by separately line number with comma eg 23,24)
## Select the option for redirection i.e 2
## Go to conf file, inside the newly created SSL server block replace the "host" with proper host definition.
