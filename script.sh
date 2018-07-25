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

echo "\e[1;31m Instalação do Web Service"
echo "1) apache2"
echo "2) nginx"
read SERVER
if [ "$SERVER" == "1" ];
then
	# Apache
	echo "Instalação do Apache2"
elif [ "$SERVER" == "2" ];
then
  # Apache
	echo "Instalação do nginx"
fi