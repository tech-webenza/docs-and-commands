## Run these commands to get proper permission to perform git 

```
sudo chown $USER:www-data -R *
```
```
sudo find . -type d -exec chmod 755 {} \;
```
```
sudo find . -type f -exec chmod 644 {} \;
```

