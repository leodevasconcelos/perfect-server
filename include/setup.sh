# Configurações iniciais de instalação dos pacotes do script

# Atualizando Sistema
echo -e "${YELLOW}Atualizando lista de pacotes e instalando as atualizações${NORMAL}"
sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

# Instalando pacotes essenciais
echo -e "${YELLOW}Instalando pacotes essenciais${NORMAL}"
sudo apt-get install -y software-properties-common python-software-properties curl unzip