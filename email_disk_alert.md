# Postfix Email Setup and Disk Usage Alert Script

## Install Mail Utilities

``` bash
sudo apt update
sudo apt install mailutils -y
```

## Test Sending Email

``` bash
echo "Test email body" | mail -s "Test Email" tech-notifications@webenza.com
which mail
sudo tail -n 50 /var/log/mail.log
```

## Install and Configure Postfix

``` bash
sudo apt install postfix -y
sudo nano /etc/postfix/main.cf
```

Set the following in `/etc/postfix/main.cf`:

``` ini
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
```

Create `/etc/postfix/sasl_passwd`:

``` ini
[smtp.gmail.com]:587 yourgmail@gmail.com:yourapppassword
```

⚠️ Use an App Password if Gmail, or AWS SES SMTP credentials if using
SES.

``` bash
sudo chmod 600 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd
sudo systemctl restart postfix
```

Test Email:

``` bash
echo "Test email body" | mail -s "Test Email" tech-notifications@webenza.com
```

## Create Disk Usage Alert Script

Create the script:

``` bash
sudo nano /usr/local/bin/disk_alert.sh
```

Add the following content:

``` bash
#!/bin/bash
THRESHOLD=80
PARTITION="/"

USAGE=$(df -h $PARTITION | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -ge "$THRESHOLD" ]; then
    echo "Disk usage on $(hostname) is at ${USAGE}% for $PARTITION"     | mail -s "EC2 Disk Alert: $(hostname)" your-email@example.com
fi
```

Make it executable:

``` bash
sudo chmod +x /usr/local/bin/disk_alert.sh
```

## Setup Cron Job

Edit crontab:

``` bash
crontab -e
```

Add the following line to run the script daily at midnight:

``` bash
0 0 * * * /usr/local/bin/disk_alert.sh
```
