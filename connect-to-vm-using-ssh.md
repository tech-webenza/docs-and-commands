## Linux command to login to server
```
ssh -o IdentitiesOnly=yes -i your_keypair_file.pem ubuntu@<IP_ADDRESS>
```

## Make sure pem file has right permission
```
sudo chmod 400 your_keypair_file.pem
```
