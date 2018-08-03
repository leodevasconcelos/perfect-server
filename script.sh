#!/bin/bash
#####################################################
## Script de Configuração do Servidor Vagrant LAMP ##
##                 BY: vendettafv                  ##
#####################################################

# Ubuntu 16.04 LTS (Xenial Xerus)
# Apache
# Nginx
# MariaDB 10
# MySQL 5.7
# PHP 7.2
# PHP 5.6
# Memcached
# phpMyAdmin
# Composer
# Git

# Constante de Cores
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
GREEN="\033[0;32m" # Verde
ORANGE="\033[0;33m" # Laranja
RED="\033[0;31m"   # Vermelho
NORMAL="\033[0m"   # Sem cor (Cor normal)

# Start
echo -e "${GREEN}Iniciando a Instalação do Servidor.${NORMAL}"

#Atualizando Sistema
echo -e "${ORANGE}Atualizando lista de pacotes e instalando as atualizações${NORMAL}"
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

# Instalando pacotes essenciais
echo -e "${ORANGE}Instalando pacotes essenciais${NORMAL}"
sudo apt-get install -y software-properties-common python-software-properties curl

# Escolha o Web Server
echo -e "${RED}1${NORMAL}) apache2"
echo -e "${RED}2${NORMAL}) nginx"
echo -ne "${GREEN}Escolha o Web Server: ${NORMAL}"
read SERVER
if [ "$SERVER" == "1" ]; then
	# Apache
	echo -e "${ORANGE}Instalando Apache2${NORMAL}"
  sudo apt-get install -y apache2
  # Configurações do Firewall
  sudo ufw enable
  sudo ufw allow "Apache Full"
  sudo ufw allow "OpenSSH"
  # Versão do PHP
  echo -e "${RED}1${NORMAL}) PHP 5.6"
  echo -e "${RED}2${NORMAL}) PHP 7.2"
  echo -ne "${GREEN}Escolha a versão do PHP: ${NORMAL}"
  read PHPV1
  if [ "$PHPV1" == "1" ]; then
    # Instalando PHP 5.6
    echo -e "${ORANGE}Adiconando repositório do PHP 5.6${NORMAL}"
    sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
	  echo -e "${ORANGE}Instalando PHP 5.6${NORMAL}"
    sudo apt install -y php5.6 libapache2-mod-php5.6 php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-cli php5.6-memcached php5.6-mysql php5.6-xml php5.6-xmlrpc php5.6-intl php5.6-xsl php5.6-zip
    # sudo apt-get install memcached
    # Configurações do PHP
    # sed -i "s@^memory_limit.*@memory_limit = 512M@" /etc/php/5.6/apache2/php.ini
    # sed -i 's@^output_buffering =@output_buffering = On\noutput_buffering =@' /etc/php/5.6/apache2/php.ini
    sed -i 's@^;cgi.fix_pathinfo.*@cgi.fix_pathinfo=0@' /etc/php/5.6/apache2/php.ini
    # sed -i 's@^short_open_tag = Off@short_open_tag = On@' /etc/php/5.6/apache2/php.ini
    # sed -i 's@^expose_php = On@expose_php = Off@' /etc/php/5.6/apache2/php.ini
    # sed -i 's@^request_order.*@request_order = "CGP"@' /etc/php/5.6/apache2/php.ini
    sed -i 's@^;date.timezone.*@date.timezone = America/Sao_Paulo@' /etc/php/5.6/apache2/php.ini
    sed -i 's@^post_max_size.*@post_max_size = 100M@' /etc/php/5.6/apache2/php.ini
    sed -i 's@^upload_max_filesize.*@upload_max_filesize = 100M@' /etc/php/5.6/apache2/php.ini
    sed -i 's@^max_execution_time.*@max_execution_time = 600@' /etc/php/5.6/apache2/php.ini
    # sed -i 's@^;realpath_cache_size.*@realpath_cache_size = 2M@' /etc/php/5.6/apache2/php.ini
    # sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' /etc/php/5.6/apache2/php.ini
    # [ -ne /usr/sbin/sendmail ] && sed -i 's@^;sendmail_path.*@sendmail_path = /usr/sbin/sendmail -t -i@' /etc/php/5.6/apache2/php.ini
    # sed -i "s@^;curl.cainfo.*@curl.cainfo = ${openssl_install_dir}/cert.pem@" /etc/php/5.6/apache2/php.ini
    # sed -i "s@^;openssl.cafile.*@openssl.cafile = ${openssl_install_dir}/cert.pem@" /etc/php/5.6/apache2/php.ini
    # Restart Apache2
    sudo /etc/init.d/apache2 restart
  elif [ "$PHPV1" == "2" ]; then
    # Instalando PHP 7.2
    echo -e "${ORANGE}Adiconando repositório do PHP 7.2${NORMAL}"
    sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
    echo -e "${ORANGE}Instalando PHP 7.2 e alguns pacotes${NORMAL}"
    sudo apt-get install -y php7.2 libapache2-mod-php7.2 php7.2-curl php7.2-gd php7.2-mbstring php7.2-cli php-memcached php7.2-mysql php7.2-xml php7.2-xmlrpc php7.2-sqlite3 php7.2-json php7.2-zip
    # Configurações do PHP
    # sed -i "s@^memory_limit.*@memory_limit = 512M@" /etc/php/7.2/apache2/php.ini
    # sed -i 's@^output_buffering =@output_buffering = On\noutput_buffering =@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^;cgi.fix_pathinfo.*@cgi.fix_pathinfo=0@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^short_open_tag = Off@short_open_tag = On@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^expose_php = On@expose_php = Off@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^request_order.*@request_order = "CGP"@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^;date.timezone.*@date.timezone = America/Sao_Paulo@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^post_max_size.*@post_max_size = 100M@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^upload_max_filesize.*@upload_max_filesize = 100M@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^max_execution_time.*@max_execution_time = 600@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^;realpath_cache_size.*@realpath_cache_size = 2M@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' /etc/php/7.2/apache2/php.ini
    # [ -ne /usr/sbin/sendmail ] && sed -i 's@^;sendmail_path.*@sendmail_path = /usr/sbin/sendmail -t -i@' /etc/php/7.2/apache2/php.ini
    # sed -i "s@^;curl.cainfo.*@curl.cainfo = ${openssl_install_dir}/cert.pem@" /etc/php/7.2/apache2/php.ini
    # sed -i "s@^;openssl.cafile.*@openssl.cafile = ${openssl_install_dir}/cert.pem@" /etc/php/7.2/apache2/php.ini
    # Restart Apache2
    sudo /etc/init.d/apache2 restart
  fi
elif [ "$SERVER" == "2" ]; then
  # nginx
	echo -e "${ORANGE}Instalando nginx${NORMAL}"
  sudo apt-get install -y nginx
  # Configurações do Firewall
  sudo ufw enable
  sudo ufw allow 'Nginx Full'
  sudo ufw allow "OpenSSH"
  sudo ufw delete allow 'Nginx HTTP'

  # Versão do PHP para nginx
  echo -e "${RED}1${NORMAL}) PHP 5.6 + PHP-FPM"
  echo -e "${RED}2${NORMAL}) PHP 7.2 + PHP-FPM"
  echo -ne "${GREEN}Escolha a versão do PHP: ${NORMAL}"
  read PHPV2
  if [ "$PHPV2" == "1" ]; then
    # Instalando PHP 5.6
    echo -e "${ORANGE}Adiconando repositório do PHP 5.6${NORMAL}"
    sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
	  echo -e "${ORANGE}Instalando 5.6 + PHP-FPM${NORMAL}"
    sudo apt install -y php5.6 php5.6-fpm php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-cli php5.6-memcached php5.6-mysql php5.6-xml php5.6-xmlrpc php5.6-intl php5.6-xsl php5.6-zip
    # sudo apt-get install memcached
    # Configurações do PHP
    # sed -i "s@^memory_limit.*@memory_limit = 512M@" /etc/php/5.6/fpm/php.ini
    # sed -i 's@^output_buffering =@output_buffering = On\noutput_buffering =@' /etc/php/5.6/fpm/php.ini
    sed -i 's@^;cgi.fix_pathinfo.*@cgi.fix_pathinfo=0@' /etc/php/5.6/fpm/php.ini
    # sed -i 's@^short_open_tag = Off@short_open_tag = On@' /etc/php/5.6/fpm/php.ini
    # sed -i 's@^expose_php = On@expose_php = Off@' /etc/php/5.6/fpm/php.ini
    # sed -i 's@^request_order.*@request_order = "CGP"@' /etc/php/5.6/fpm/php.ini
    sed -i 's@^;date.timezone.*@date.timezone = America/Sao_Paulo@' /etc/php/5.6/fpm/php.ini
    sed -i 's@^post_max_size.*@post_max_size = 100M@' /etc/php/5.6/fpm/php.ini
    sed -i 's@^upload_max_filesize.*@upload_max_filesize = 100M@' /etc/php/5.6/fpm/php.ini
    sed -i 's@^max_execution_time.*@max_execution_time = 600@' /etc/php/5.6/fpm/php.ini
    # sed -i 's@^;realpath_cache_size.*@realpath_cache_size = 2M@' /etc/php/5.6/fpm/php.ini
    # sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' /etc/php/5.6/fpm/php.ini
    # [ -ne /usr/sbin/sendmail ] && sed -i 's@^;sendmail_path.*@sendmail_path = /usr/sbin/sendmail -t -i@' /etc/php/5.6/fpm/php.ini
    # sed -i "s@^;curl.cainfo.*@curl.cainfo = ${openssl_install_dir}/cert.pem@" /etc/php/5.6/fpm/php.ini
    # sed -i "s@^;openssl.cafile.*@openssl.cafile = ${openssl_install_dir}/cert.pem@" /etc/php/5.6/fpm/php.ini
    # Configurações do Nginx
    sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_config
    sudo touch /etc/nginx/sites-available/default
    sudo echo "server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name localhost;

    location / {
        try_files $uri $uri/ =404;
    }
    location ~ \.php$ {
           try_files $uri =404;
           fastcgi_pass unix:/run/php/php5.6-fpm.sock;
           fastcgi_index index.php;
           fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
           include fastcgi_params;
                
     }
}" >> /etc/nginx/sites-available/default
    # Restart PHP-FPM & Nginx
    sudo systemctl restart php5.6-fpm && sudo systemctl restart nginx
  elif [ "$PHPV2" == "2" ]; then
    # Instalando PHP 7.2
    echo -e "${ORANGE}Adiconando repositório do PHP 7.2${NORMAL}"
    sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
	  echo -e "${ORANGE}Instalando PHP 7.2 + PHP-FPM${NORMAL}"
    sudo apt-get install php7.2-cli php7.2-fpm php7.2-mysql php7.2-curl php-memcached php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json php7.2-xmlrpc php7.2-xml php7.2-zip
    # Configurações do PHP
    # sed -i "s@^memory_limit.*@memory_limit = ${Memory_limit}M@" /etc/php/7.2/fpm/php.ini
    # sed -i 's@^output_buffering =@output_buffering = On\noutput_buffering =@' /etc/php/7.2/fpm/php.ini
    sed -i 's@^;cgi.fix_pathinfo.*@cgi.fix_pathinfo=0@' /etc/php/7.2/fpm/php.ini
    # sed -i 's@^short_open_tag = Off@short_open_tag = On@' /etc/php/7.2/fpm/php.ini
    # sed -i 's@^expose_php = On@expose_php = Off@' /etc/php/7.2/fpm/php.ini
    # sed -i 's@^request_order.*@request_order = "CGP"@' /etc/php/7.2/fpm/php.ini
    sed -i 's@^;date.timezone.*@date.timezone = America/Sao_Paulo@' /etc/php/7.2/fpm/php.ini
    sed -i 's@^post_max_size.*@post_max_size = 100M@' /etc/php/7.2/fpm/php.ini
    sed -i 's@^upload_max_filesize.*@upload_max_filesize = 100M@' /etc/php/7.2/fpm/php.ini
    sed -i 's@^max_execution_time.*@max_execution_time = 600@' /etc/php/7.2/fpm/php.ini
    # sed -i 's@^;realpath_cache_size.*@realpath_cache_size = 2M@' /etc/php/7.2/fpm/php.ini
    # sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' /etc/php/7.2/fpm/php.ini
    # [ -ne /usr/sbin/sendmail ] && sed -i 's@^;sendmail_path.*@sendmail_path = /usr/sbin/sendmail -t -i@' /etc/php/7.2/fpm/php.ini
    # sed -i "s@^;curl.cainfo.*@curl.cainfo = ${openssl_install_dir}/cert.pem@" /etc/php/7.2/fpm/php.ini
    # sed -i "s@^;openssl.cafile.*@openssl.cafile = ${openssl_install_dir}/cert.pem@" /etc/php/7.2/fpm/php.ini
    # Configurações do Nginx
    sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default_config
    sudo touch /etc/nginx/sites-available/default
    sudo echo "server {
    # Port that the web server will listen on.
    listen 80;

    # Host that will serve this project.
    server_name localhost;

    # Useful logs for debug.
    access_log /var/log/nginx/localhost_access.log;
    error_log /var/log/nginx/localhost_error.log;
    rewrite_log on;

    # The location of our projects public directory.
    root /var/www/html;

    # Point index to the Laravel front controller.
    index index.php index.html;

    location / {
        # URLs to attempt, including pretty ones.
        try_files $uri $uri/ /index.php?$query_string;
    }

    # Remove trailing slash to please routing system.
    if (!-d $request_filename) {
        rewrite ^/(.+)/$ /$1 permanent;
    }

    # PHP FPM configuration.
    location ~* \.php$ {
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
        fastcgi_index index.php;
        fastcgi_split_path_info ^(.+\.php)(.*)$;
        include /etc/nginx/fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    }

    # We don't need .ht files with nginx.
        location ~ /\.ht {
        deny all;
    }

    # Set header expirations on per-project basis
    location ~* \.(?:ico|css|js|jpe?g|JPG|png|svg|woff)$ {
        expires 365d;
    }
}" >> /etc/nginx/sites-available/default
    # Restart PHP-FPM & Nginx
    sudo systemctl restart php7.2-fpm && sudo systemctl restart nginx
  fi
fi

# Instalação do SGBD
echo -e "${RED}1${NORMAL}) MySQL"
echo -e "${RED}2${NORMAL}) MariaDB"
echo -ne "${GREEN}Escolha o SGBD: ${NORMAL}"
read SQLSERVER
if [ "$SQLSERVER" == "1" ]; then
  # MySQL
  echo -e "${ORANGE}Instalando MySQL${NORMAL}"
  sudo apt-get install -y mysql-server
elif [ "$SQLSERVER" == "2" ]; then
  # MariaDB
  echo -e "${ORANGE}Instalando MariaDB${NORMAL}"
  sudo apt-get install -y mariadb-server mariadb-client
fi

# Instalação segura do MySQL/MariaDB
echo -ne "${GREEN}Realizar instalação segura do MySQL/MariaDB${NORMAL} [Y/n]: ?"
read SGBDSECURE
if [ "$SGBDSECURE" == "y" ] || [ "$SGBDSECURE" == "Y" ]; then
  # Instalação segura
  echo -e "${ORANGE}Realizando instalação segura${NORMAL}"
	sudo mysql_secure_installation
fi

# Instalação do phpMyadmin
echo -ne "${GREEN}Deseja instalar o phpMyAdmin${NORMAL} [Y/n]: "
read PHPMYADMIN
if [ "$PHPMYADMIN" == "y" ] || [ "$PHPMYADMIN" == "Y" ]; then
  # phpMyAdmin
  echo -e "${ORANGE}Instalando phpMyAdmin${NORMAL}"
  sudo apt-get install -y phpmyadmin
  # Fix phpMyAdmin
  if [ "$SERVER" == "1" ]; then
    # Fix Apache2
    echo -e "${ORANGE}Realizando ajustes para apache2${NORMAL}"
    sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
    # Restart Apache2
    echo -e "${ORANGE}Reiniciando  Apache${NORMAL}"
    sudo /etc/init.d/apache2 restart
  elif [ "$SERVER" == "2" ]; then
    # Fix nginx
    echo -e "${ORANGE}Realizando ajustes para nginx${NORMAL}"
    sudo ln -s /usr/share/phpmyadmin/ /var/www/html
    # Restart nginx
    echo -e "${ORANGE}Reiniciando nginx${NORMAL}"
    sudo service nginx restart
  fi
fi

# Instalação do Composer
echo -ne "${GREEN}Deseja instalar o Composer${NORMAL} [Y/n]: "
read COMPOSER
if [ "$COMPOSER" == "y" ] || [ "$COMPOSER" == "Y" ]; then
  # Composer
  echo -e "${ORANGE}Instalando Composer${NORMAL}"
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
fi

# Instalação do Git
echo -ne "${GREEN}Deseja instalar o Git?${NORMAL} [Y/n]: "
read GIT
if [ "$GIT" == "y" ] || [ "$GIT" == "Y" ]; then
  # Git
  echo -e "${ORANGE}Instalando Git${NORMAL}"
  sudo apt-get install -y git
fi

echo -e "${GREEN}Instalação finalizada com sucesso!${NORMAL}"