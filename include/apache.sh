# Instalação e configuração do apache

if [ "$SERVER" == "1" ]; then
	# Apache
	echo -e "${YELLOW}Instalando Apache2${NORMAL}"
  sudo apt-get install -y apache2
  # Configurações do Firewall
  sudo ufw enable
  sudo ufw allow "Apache Full"
  sudo ufw allow "OpenSSH"
fi