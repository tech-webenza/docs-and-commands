# Database Mysql Script

## Login to VM/Server Go to 
```
crontab -e
```
## Add the below line at the end for weekly backup
```
0 0 * * SAT /usr/local/bin/db_backup
```
## Create a db_backup script file
```
sudo nano /usr/local/bin/db_backup
```
## Add the following and change the <> params accordingly
```
TODAY_DATE=`date +"%d_%m_%Y"`
db_backup="<DB_FILENAME_PREFIX>${TODAY_DATE}.sql"

sudo mysqldump -h <BD_HOST> -u<DB_USER> -p<DB_PASS> --set-gtid-purged=OFF --column-statistics=0 <DB_NAME> | gzip -c >/home/ubuntu/${db_backup}
aws s3 mv /home/ubuntu/${db_backup} s3://<NAME_OF_S3_BUCKET>
```
## Give a executable permission
```
sudo chmod +x /usr/local/bin/db_backup
```
