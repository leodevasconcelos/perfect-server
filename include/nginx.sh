# Instalação e configuração do nginx

# Instalando nginx
if [ "$SERVER" == "2" ]; then
  # Repositório nginx
  sudo add-apt-repository -y ppa:nginx/stable && sudo apt-get update
  # nginx
	echo -e "${YELLOW}Instalando nginx${NORMAL}"
  sudo apt-get install -y nginx
  # Configurações do Firewall
  sudo ufw enable
  sudo ufw allow "Nginx Full"
  sudo ufw allow "OpenSSH"
  sudo ufw delete allow 'Nginx HTTP'
fi