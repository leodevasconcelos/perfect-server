#!/bin/bash
# Código OK
# echo "####### Instalando MySQL Server #######"
# sudo apt-get install mysql-server

# echo "Instalação segura do MySQL (y/n)?"
# read ANS
# if [ "$ANS" == "y" ] || [ "$ANS" == "Y" ];
# then
# 	# Instalação segura do MySQL
# 	sudo mysql_secure_installation
# fi

# Desenvolvimento de Teste

echo "\033[31;40;1m Instalação do Web Service"
echo "1) apache2"
echo "2) nginx"
read SERVER
if [ "$SERVER" == "1" ];
then
	# Apache
	echo "Instalação do Apache2"
  echo "Escolha a versão do PHP"
  echo "1) PHP 5.6"
  echo "2) PHP 7.1"
  read PHPV1
  if [ "$PHPV1" == "1" ]
  then
    # PHP 5.6
	  echo "Instalação do PHP 5.6"
  elif [ "$PHPV1" == "2" ]
  then
    # PHP PHP 7.1
	  echo "Instalação do PHP PHP 7.1"
  fi
elif [ "$SERVER" == "2" ];
then
  # Apache
	echo "Instalação do nginx"
  echo "Escolha a versão do PHP"
  echo "1) PHP 5.6 + PHP-FPM"
  echo "2) PHP 7.1 + PHP-FPM"
  read PHPV2
  if [ "$PHPV2" == "1" ]
  then
    # PHP 5.6
	  echo "Instalação do PHP 5.6 + PHP-FPM"
  elif [ "$PHPV2" == "2" ]
  then
    # PHP PHP 7.1
	  echo "Instalação do PHP PHP 7.1 + PHP-FPM"
  fi
fi