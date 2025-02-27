# Install nginx, php, wordpress
## take the script in fresh ec2 instance and run to get wordpress setup along with nginx virtual conf.
### please replace the credntials and domain with relevant 

```
#!/bin/bash
# Update system
sudo apt update -y && sudo apt upgrade -y

# Install required packages
sudo apt install -y nginx php-fpm php-mysql unzip curl

# Start and enable services
sudo systemctl enable --now nginx
#sudo systemctl enable --now mysql

# Download and configure WordPress
cd /var/www/html
sudo rm -rf *
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz --strip-components=1
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html

# Configure WordPress
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/wordpress/" wp-config.php
sed -i "s/username_here/wp_user/" wp-config.php
sed -i "s/password_here/wp_password/" wp-config.php

# Configure Nginx
cat <<EOT | sudo tee /etc/nginx/sites-available/example.com.conf
server {
    listen 80;
    server_name example.com;

    root /var/www/html;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOT

# Enable Nginx configuration
sudo ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/
sudo unlink /etc/nginx/sites-enabled/default
sudo nginx -t && sudo systemctl restart nginx
```
