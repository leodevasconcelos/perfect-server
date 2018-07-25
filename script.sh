#!/bin/bash

echo "####### Instalando MySQL Server #######"
sudo apt-get install mysql-server

echo "Instalação segura do MySQL (y/n)?"
read ANS
if [ "$ANS" == "y" ];
then
	# Instalação segura do MySQL
	sudo mysql_secure_installation
fi