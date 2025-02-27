# This is to automate the mysql database creation and setting up
## Take a clone of this file in /usr/local/bin
## rename mysql_setup.md to mysql_setup.sh

```
#!/bin/bash

# Define MySQL credentials
MYSQL_ROOT_PASSWORD="rootpassword"
DB_NAME="wordpress"
DB_USER="wp_user"
DB_PASSWORD="wp_password"

# Update system packages
echo "Updating system..."
sudo apt update -y && sudo apt upgrade -y

# Install MySQL Server if not installed
if ! command -v mysql &> /dev/null
then
    echo "Installing MySQL Server..."
    sudo apt install -y mysql-server
    sudo systemctl enable --now mysql
else
    echo "MySQL is already installed."
fi

# Secure MySQL Installation (Automated)
echo "Securing MySQL..."
sudo mysql --user=root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

# Create Database and User
echo "Creating database and user..."
sudo mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "MySQL setup completed successfully! ✅"
```
