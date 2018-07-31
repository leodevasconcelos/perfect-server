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
RED="\033[0;31m"   # Vermelho
NORMAL="\033[0m"   # Sem cor (Cor normal)

# Start
echo -e "${GREEN}Iniciando a Instalação do Servidor.${NORMAL}"

#Atualizando Sistema
echo "Atualizando lista de pacotes e instalando as atualizações"
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

# Instalando pacotes essenciais
echo "Instalando pacotes essenciais"
sudo apt-get install software-properties-common python-software-properties curl

# Escolha o Web Server
echo "Escolha o Web Server"
echo "${RED}1${NORMAL} ) apache2"
echo "${RED}2${NORMAL} ) nginx"
read SERVER
if [ "$SERVER" == "1" ]; then
	# Apache
	echo "Instalando Apache2"
  sudo apt-get install apache2
  
  # Versão do PHP
  echo "Escolha a versão do PHP"
  echo "${RED}1${NORMAL} ) PHP 5.6"
  echo "${RED}2${NORMAL} ) PHP 7.2"
  read PHPV1
  if [ "$PHPV1" == "1" ]; then
    # Instalando PHP 5.6
	  echo "Instalando PHP 5.6"
  elif [ "$PHPV1" == "2" ]; then
    # Instalando PHP 7.2
    echo "${GREEN}Adiconando repositório do PHP 7.2${NORMAL}"
    sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
    echo "${GREEN}Instalando PHP 7.2 e alguns pacotes${NORMAL}"
    sudo apt-get install php7.2-cli libapache2-mod-php7.2 php7.2-mysql php7.2-curl php-memcached php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json
    # Configurações do PHP
    # sed -i "s@^memory_limit.*@memory_limit = ${Memory_limit}M@" ${php_install_dir}/etc/php.ini
    # sed -i 's@^output_buffering =@output_buffering = On\noutput_buffering =@' ${php_install_dir}/etc/php.ini
    sed -i 's@^;cgi.fix_pathinfo.*@cgi.fix_pathinfo=0@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^short_open_tag = Off@short_open_tag = On@' ${php_install_dir}/etc/php.ini
    # sed -i 's@^expose_php = On@expose_php = Off@' ${php_install_dir}/etc/php.ini
    # sed -i 's@^request_order.*@request_order = "CGP"@' ${php_install_dir}/etc/php.ini
    sed -i 's@^;date.timezone.*@date.timezone = America/Sao_Paulo@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^post_max_size.*@post_max_size = 100M@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^upload_max_filesize.*@upload_max_filesize = 100M@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^max_execution_time.*@max_execution_time = 600@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^;realpath_cache_size.*@realpath_cache_size = 2M@' ${php_install_dir}/etc/php.ini
    # sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' ${php_install_dir}/etc/php.ini
    # [ -e /usr/sbin/sendmail ] && sed -i 's@^;sendmail_path.*@sendmail_path = /usr/sbin/sendmail -t -i@' ${php_install_dir}/etc/php.ini
    # sed -i "s@^;curl.cainfo.*@curl.cainfo = ${openssl_install_dir}/cert.pem@" ${php_install_dir}/etc/php.ini
    # sed -i "s@^;openssl.cafile.*@openssl.cafile = ${openssl_install_dir}/cert.pem@" ${php_install_dir}/etc/php.ini
    # Restart Apache2
    sudo /etc/init.d/apache2 restart
  fi
elif [ "$SERVER" == "2" ]; then
  # nginx
	echo "${GREEN}Instalando nginx${NORMAL}"
  sudo apt-get install nginx

  # Versão do PHP para nginx
  echo "${GREEN}Escolha a versão do PHP${NORMAL}"
  echo "${RED}1${NORMAL} ) PHP 5.6 + PHP-FPM"
  echo "${RED}2${NORMAL} ) PHP 7.2 + PHP-FPM"
  read PHPV2
  if [ "$PHPV2" == "1" ]; then
    # Instalando PHP 5.6
	  echo "${GREEN}Instalando 5.6 + PHP-FPM${NORMAL}"
  elif [ "$PHPV2" == "2" ]; then
    # Instalando PHP 7.2
    echo "${GREEN}Adiconando repositório do PHP 7.2${NORMAL}"
    sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
	  echo "${GREEN}Instalando PHP 7.2 + PHP-FPM${NORMAL}"
    sudo apt-get install php7.2-cli php7.2-fpm php7.2-mysql php7.2-curl php-memcached  php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json php7.2-xmlrpc php7.2-xml php7.2-zip
    # Configurações do PHP
    # sed -i "s@^memory_limit.*@memory_limit = ${Memory_limit}M@" ${php_install_dir}/etc/php.ini
    # sed -i 's@^output_buffering =@output_buffering = On\noutput_buffering =@' ${php_install_dir}/etc/php.ini
    sed -i 's@^;cgi.fix_pathinfo.*@cgi.fix_pathinfo=0@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^short_open_tag = Off@short_open_tag = On@' ${php_install_dir}/etc/php.ini
    # sed -i 's@^expose_php = On@expose_php = Off@' ${php_install_dir}/etc/php.ini
    # sed -i 's@^request_order.*@request_order = "CGP"@' ${php_install_dir}/etc/php.ini
    sed -i 's@^;date.timezone.*@date.timezone = America/Sao_Paulo@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^post_max_size.*@post_max_size = 100M@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^upload_max_filesize.*@upload_max_filesize = 100M@' /etc/php/7.2/apache2/php.ini
    sed -i 's@^max_execution_time.*@max_execution_time = 600@' /etc/php/7.2/apache2/php.ini
    # sed -i 's@^;realpath_cache_size.*@realpath_cache_size = 2M@' ${php_install_dir}/etc/php.ini
    # sed -i 's@^disable_functions.*@disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server,fsocket,popen@' ${php_install_dir}/etc/php.ini
    # [ -e /usr/sbin/sendmail ] && sed -i 's@^;sendmail_path.*@sendmail_path = /usr/sbin/sendmail -t -i@' ${php_install_dir}/etc/php.ini
    # sed -i "s@^;curl.cainfo.*@curl.cainfo = ${openssl_install_dir}/cert.pem@" ${php_install_dir}/etc/php.ini
    # sed -i "s@^;openssl.cafile.*@openssl.cafile = ${openssl_install_dir}/cert.pem@" ${php_install_dir}/etc/php.ini
  fi
fi

# Instalação do SGBD
echo "${GREEN}Escolha o SGBD${NORMAL}"
echo "${RED}1${NORMAL}) MySQL"
echo "${RED}2${NORMAL}) MariaDB"
read SQLSERVER
if [ "$SQLSERVER" == "1" ]; then
  # MySQL
  echo "${GREEN}Instalando MySQL${NORMAL}"
  sudo apt-get install mysql-server
elif [ "$SQLSERVER" == "2" ]; then
  # MariaDB
  echo "${GREEN}Instalando MariaDB${NORMAL}"
  sudo apt-get install mariadb-server mariadb-client
fi

# Instalação segura do MySQL/MariaDB
echo "${GREEN}Realizar instalação segura do MySQL/MariaDB${NORMAL} [Y/n]?"
read SGBDSECURE
if [ "$SGBDSECURE" == "y" ] || [ "$SGBDSECURE" == "Y" ]; then
  # Instalação segura
  echo "Realizando instalação segura"
	sudo mysql_secure_installation
fi

# Instalação do phpMyadmin
echo "${GREEN}Deseja instalar o phpMyAdmin${NORMAL} [Y/n]"
read PHPMYADMIN
if [ "$PHPMYADMIN" == "y" ] || [ "$PHPMYADMIN" == "Y" ]; then
  # phpMyAdmin
  echo "${GREEN}Instalando phpMyAdmin${NORMAL}"
  sudo apt-get install phpmyadmin
  # Fix phpMyAdmin
  sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
  echo "${GREEN}Reiniciando  Apache"
  sudo /etc/init.d/apache2 restart
fi

# Instalação do Composer
echo "${GREEN}Deseja instalar o Composer${NORMAL} [Y/n]"
read COMPOSER
if [ "$COMPOSER" == "y" ] || [ "$COMPOSER" == "Y" ]; then
  # Composer
  echo "${GREEN}Instalando Composer${NORMAL}"
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
fi

# Instalação do Git
echo "${GREEN}Deseja instalar o Git${NORMAL} [Y/n]"
read GIT
if [ "$GIT" == "y" ] || [ "$GIT" == "Y" ]; then
  # Git
  echo "${GREEN}Instalando Git"
  sudo apt-get install git
fi