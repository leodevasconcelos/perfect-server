# Configurações de Banco de Dados

# Instalação do banco de dados
if [ "$SQLSERVER" == "1" ]; then
  # MySQL
  echo -e "${YELLOW}Instalando MySQL${NORMAL}"
  sudo apt-get install -y mysql-server
elif [ "$SQLSERVER" == "2" ]; then
  # MariaDB
  echo -e "${YELLOW}Instalando MariaDB${NORMAL}"
  sudo apt-get install -y mariadb-server mariadb-client
fi

# Instalação segura
if [[ $SGBDSECURE = [yY] ]]; then
  echo -e "${YELLOW}Realizando instalação segura${NORMAL}"
	sudo mysql_secure_installation
fi