#!/usr/bin/env bash
#####################################################
## Script de Configuração do Servidor LAMP & LEMP  ##
##                 BY: vendettafv                  ##
#####################################################

# Ubuntu 16.04 LTS (Xenial Xerus)
# Apache
# Nginx
# MariaDB 10
# MySQL 5.7
# PHP 7.2
# PHP 5.6
# Memcached
# phpMyAdmin
# SSL
# ProFTPd
# Composer
# Node
# Redis

# Constante de Cores
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
GREEN="\033[0;32m"    # Verde
YELLOW="\033[1;33m"   # Laranja
RED="\033[0;31m"      # Vermelho
NORMAL="\033[0m"      # Sem cor (Cor normal)

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

cur_dir=`pwd`

include(){
    local include=${1}
    if [[ -s ${cur_dir}/include/${include}.sh ]]; then
        . ${cur_dir}/include/${include}.sh
    else
        echo "Erro:${cur_dir}/include/${include}.sh não encontrado, shell não pode ser executado."
        exit 1
    fi
}

setup() {
  include setup         # OK
  include config        # OK
  include apache        # OK
  include nginx         # OK
  include domain
  include php           # OK
#   include php_modules
  include db            # OK
  include pma           # OK
#   include pma_upgrade

  # rootness
  # load_config
  # pre_setting
}

setup 2>&1 | tee ${cur_dir}/lamp.log

