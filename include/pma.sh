# Instalação e configuração do phpMyAdmin

# phpMyAdmin
if [[ $PHPMYADMIN = [yY] ]]; then
  # Repositório phpMyAdmin
  # sudo add-apt-repository -y ppa:nijel/phpmyadmin && sudo apt-get update
  # Instalação do phpMyAdmin
  echo -e "${YELLOW}Instalando phpMyAdmin${NORMAL}"
  sudo apt-get install -y phpmyadmin
  # Fix phpMyAdmin
  if [ "$PHP" == "2" ]; then
    # Fix phpMyAdmin PHP 7.2.x
    echo -e "${YELLOW}Realizando ajustes para PHP 7${NORMAL}"
    cd /usr/share
    sudo rm -rf phpmyadmin
    sudo wget -P /usr/share/ "https://files.phpmyadmin.net/phpMyAdmin/4.8.2/phpMyAdmin-4.8.2-all-languages.zip"
    sudo unzip phpMyAdmin-4.8.2-all-languages.zip
    sudo cp -r phpMyAdmin-4.8.2-all-languages phpmyadmin
    sudo rm -rf phpMyAdmin-4.8.2-all-languages
    sudo rm -rf phpMyAdmin-4.8.2-all-languages.zip
    cd /usr/share/phpmyadmin
    sudo rm -rf favicon.ico
    sudo mv /tmp/perfect-server/conf/favicon.ico /usr/share/phpmyadmin/favicon.ico
    sudo mv /tmp/perfect-server/conf/config.inc_new.php /usr/share/phpmyadmin/config.inc.php
    sudo mkdir tmp && sudo chown -R www-data:www-data /usr/share/phpmyadmin/tmp
    sudo mkdir upload && sudo mkdir save
    sudo wget -P /usr/share/phpmyadmin/themes/ "https://files.phpmyadmin.net/themes/metro/2.8/metro-2.8.zip"
    cd /usr/share/phpmyadmin/themes
    sudo unzip metro-2.8.zip
    sudo rm -rf metro-2.8.zip
  fi
  if [ "$SERVER" == "1" ]; then
    # Fix Apache2
    echo -e "${YELLOW}Realizando ajustes para apache2${NORMAL}"
    sudo echo "Include /etc/phpmyadmin/apache.conf" >> /etc/apache2/apache2.conf
    # Restart Apache2
    echo -e "${YELLOW}Reiniciando  Apache${NORMAL}"
    sudo /etc/init.d/apache2 restart
  elif [ "$SERVER" == "2" ]; then
    # Fix nginx
    echo -e "${YELLOW}Realizando ajustes para nginx${NORMAL}"
    sudo ln -s /usr/share/phpmyadmin/ /var/www/html
    # Restart nginx
    echo -e "${YELLOW}Reiniciando nginx${NORMAL}"
    sudo service nginx restart
  fi
fi