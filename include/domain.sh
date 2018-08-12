# Configuração de domínios
echo -ne "${GREEN}Deseja configurar um domínio?${NORMAL} [Y/n]: "
read DOMAIN
if [[ $DOMAIN = [yY] ]]; then

  # Configuração de domínio para apache 
  if [ "$SERVER" == "1" ]; then
    # Configuração de domínio para apache
  fi

  # Configuração de domínio para nginx
  if [ "$SERVER" == "2" ]; then
    # Configuração de domínio para nginx
  fi

fi