# Instação e configuração do PHP

#################################
#         Apache2 + PHP         #
#################################

# Apache2 + PHP 5.6
if [ "$PHP" == "1" ] && [ "$SERVER" == "1" ]; then
  # Instalando PHP 5.6
  echo -e "${YELLOW}Adiconando repositório do PHP 5.6${NORMAL}"
  sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
  echo -e "${YELLOW}Instalando PHP 5.6${NORMAL}"
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
fi

# Apache2 + PHP 7.2
if [ "$PHP" == "2" ] && [ "$SERVER" == "1" ]; then
  # Instalando PHP 7.2
  echo -e "${YELLOW}Adiconando repositório do PHP 7.2${NORMAL}"
  sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
  echo -e "${YELLOW}Instalando PHP 7.2 e alguns pacotes${NORMAL}"
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

#################################
#          Nginx + PHP          #
#################################

# Nginx + PHP 5.6
if [ "$PHP" == "1" ] && [ "$SERVER" == "2" ]; then
  # Instalando PHP 5.6
  echo -e "${YELLOW}Adiconando repositório do PHP 5.6${NORMAL}"
  sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
  echo -e "${YELLOW}Instalando 5.6 + PHP-FPM${NORMAL}"
  sudo apt-get install -y php5.6 php5.6-fpm php5.6-curl php5.6-gd php5.6-mbstring php5.6-mcrypt php5.6-cli php5.6-memcached php5.6-mysql php5.6-xml php5.6-xmlrpc php5.6-intl php5.6-xsl php5.6-zip
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
  # Move o novo arquivo de configurações
  sudo mv /tmp/perfect-server/conf/default_5-6 /etc/nginx/sites-available/default
  # Restart PHP-FPM & Nginx
  sudo systemctl restart php5.6-fpm && sudo systemctl restart nginx
  sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
fi

# Nginx + PHP 7.2
if [ "$PHP" == "2" ] && [ "$SERVER" == "2" ]; then
  # Instalando PHP 7.2
  echo -e "${YELLOW}Adiconando repositório do PHP 7.2${NORMAL}"
  sudo add-apt-repository -y ppa:ondrej/php && sudo apt-get update
  echo -e "${YELLOW}Instalando PHP 7.2 + PHP-FPM${NORMAL}"
  sudo apt-get install -y php7.2-cli php7.2-fpm php7.2-mysql php7.2-curl php-memcached php7.2-dev php7.2-sqlite3 php7.2-mbstring php7.2-gd php7.2-json php7.2-xmlrpc php7.2-xml php7.2-zip
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
  # Move o novo arquivo de configurações
  sudo mv /tmp/perfect-server/conf/default_7-2 /etc/nginx/sites-available/default
  # Restart PHP-FPM & Nginx
  sudo systemctl restart php7.2-fpm && sudo systemctl restart nginx
  sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
fi