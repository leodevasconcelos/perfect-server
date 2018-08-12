# Pré configuração do script

# Check root
if [[ $EUID -ne 0 ]]; then
   echo "Esse script precisa ser executado como root." 1>&2
   exit 1
fi

# Start
echo -e "${GREEN}Iniciando a Instalação do Servidor.${NORMAL}"

# Ambiente de Instalação
echo -e "${RED}1${NORMAL}) Localhost"
echo -e "${RED}2${NORMAL}) VPS ou Dedicado"
echo -ne "${GREEN}Qual tipo de ambiente você está utilizando?:${NORMAL} "
read INSTALL

# Configuração de domínios
if [ "$INSTALL" == "2" ]; then
  echo -ne "${GREEN}Deseja configurar um domínio?${NORMAL} [Y/n]: "
  read DOMAIN
fi

# Escolha o Web Server
echo -e "${RED}1${NORMAL}) apache2"
echo -e "${RED}2${NORMAL}) nginx"
echo -ne "${GREEN}Escolha o Web Server: ${NORMAL}"
read SERVER

# Versão do PHP
echo -e "${RED}1${NORMAL}) PHP 5.6"
echo -e "${RED}2${NORMAL}) PHP 7.2"
echo -ne "${GREEN}Escolha a versão do PHP: ${NORMAL}"
read PHP

# Instalação do SGBD
echo -e "${RED}1${NORMAL}) MySQL"
echo -e "${RED}2${NORMAL}) MariaDB"
echo -ne "${GREEN}Escolha o SGBD: ${NORMAL}"
read SQLSERVER

# Instalação segura do MySQL/MariaDB
echo -ne "${GREEN}Realizar instalação segura do MySQL/MariaDB?${NORMAL} [Y/n]: "
read SGBDSECURE

# Instalação do phpMyadmin
echo -ne "${GREEN}Deseja instalar o phpMyAdmin?${NORMAL} [Y/n]: "
read PHPMYADMIN

# Instalação do SSL
if [ "$INSTALL" == "2" ]; then
  echo -ne "${GREEN}Deseja instalar o um certificado SSL?${NORMAL} [Y/n]: "
  read CERTIFICATE
fi

# Instalação do servidor FTP
echo -ne "${GREEN}Deseja instalar um servidor FTP?${NORMAL} [Y/n]: "
read FTP

# Instalação do Composer
echo -ne "${GREEN}Deseja instalar o Composer?${NORMAL} [Y/n]: "
read COMPOSER

# Instalação do NodeJS
echo -ne "${GREEN}Deseja instalar o NodeJS?${NORMAL} [Y/n]: "
read NODE

# Instalação do Redis
echo -ne "${GREEN}Deseja instalar o Redis?${NORMAL} [Y/n]: "
read REDIS