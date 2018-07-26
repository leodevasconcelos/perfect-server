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
RED="\033[0;31m" # Vermelho
NORMAL="\033[0m" # Sem cor (Cor normal)

# Start
echo -e "${GREEN}Iniciando a Instalação do Servidor. ${NORMAL}"

#Atualizando Sistema
echo "Atualizando lista de pacotes e instalando as atualizações"
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

# Instalando pacotes essenciais
echo "Instalando pacotes essenciais"
sudo apt-get install software-properties-common python-software-properties curl

# Escolha o Web Server
echo "Escolha o Web Server"
echo "${RED}1${NORMAL}) apache2"
echo "${RED}2${NORMAL}) nginx"
read SERVER
if [ "$SERVER" == "1" ]; then
	# Apache
	echo "Instalando Apache2"
  sudo apt-get install apache2
  
  # Versão do PHP
  echo "Escolha a versão do PHP"
  echo "${RED}1${NORMAL}) PHP 5.6"
  echo "${RED}2${NORMAL}) PHP 7.2"
  read PHPV1
  if [ "$PHPV1" == "1" ]; then
    # PHP 5.6
	  echo "Instalando PHP 5.6"
  elif [ "$PHPV1" == "2" ]; then
    # PHP 7.2
    echo "Adiconando repositório do PHP 7.2"
    sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
    echo "Instalando PHP 7.2 e alguns pacotes"
    sudo apt-get install php7.2-cli libapache2-mod-php7.2 php7.2-mysql php7.2-curl php-memcached php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json
  fi
elif [ "$SERVER" == "2" ]; then
  # nginx
	echo "Instalando nginx"
  sudo apt-get install nginx

  # Versão do PHP
  echo "Escolha a versão do PHP"
  echo "${RED}1${NORMAL}) PHP 5.6 + PHP-FPM"
  echo "${RED}2${NORMAL}) PHP 7.2 + PHP-FPM"
  read PHPV2
  if [ "$PHPV2" == "1" ]; then
    # PHP 5.6
	  echo "Instalando 5.6 + PHP-FPM"
  elif [ "$PHPV2" == "2" ]; then
    # PHP 7.2
	  echo "Instalando PHP 7.2 + PHP-FPM"
  fi
fi

# Instalação do SGBD
echo "Escolha o SGBD"
echo "${RED}1${NORMAL}) MySQL"
echo "${RED}2${NORMAL}) MariaDB"
read SQLSERVER
if [ "$SQLSERVER" == "1" ]; then
  # MySQL
  echo "Instalando MySQL"
  sudo apt-get install mysql-server
elif [ "$SQLSERVER" == "2" ]; then
  # MariaDB
  echo "Instalando MariaDB"
  sudo apt-get install mariadb-server mariadb-client
fi

# Instalação segura do MySQL/MariaDB
echo "Realizar instalação segura do MySQL/MariaDB (Y/n)?"
read SGBDSECURE
if [ "$SGBDSECURE" == "y" ] || [ "$SGBDSECURE" == "Y" ]; then
  # Instalação segura
  echo "Realizando instalação segura"
	sudo mysql_secure_installation
fi

# Instalação do phpMyadmin
echo "Deseja instalar o phpMyAdmin (Y/n)"
read PHPMYADMIN
if [ "$PHPMYADMIN" == "y" ] || [ "$PHPMYADMIN" == "Y" ]; then
  # phpMyAdmin
  echo "Instalando phpMyAdmin"
  sudo apt-get install phpmyadmin
fi

# Instalação do Composer
echo "Deseja instalar o Composer (Y/n)"
read COMPOSER
if [ "$COMPOSER" == "y"] || [ "$COMPOSER" == "Y"]; then
  # Composer
  echo "Instalando Composer"
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
fi

# Instalação do Git
echo "Deseja instalar o Git (Y/n)"
read GIT
if [ "$GIT" == "y" ] || [ "$GIT" == "Y" ]; then
  # Git
  echo "Instalando Git"
  sudo apt-get install git
fi

# Configurações Finais
# echo "Habilitar Host"
# sudo a2ensite default.conf


# echo "Reiniciando  Apache"
# sudo /etc/init.d/apache2 restart