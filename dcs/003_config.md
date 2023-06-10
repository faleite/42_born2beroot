# Configurations

## Setup users
- Host name (deve ser 42 user + 42): `faaraujo42`
- Domain name (vazio):
- Root password (System administrative account): `faaraujo42lisboa*`
- Full name: `faaraujo`
- User name: `faaraujo`
- Password for the new user: `hello42lisboa`
- Encryption passphrase: `hello42lisboa`

## Sudo utilizadores e grupos
- Entrar no root (utilizador raiz): `su`
- Root password (System administrative account): `faaraujo42lisboa*`
- Instalar o sudo: `apt install sudo`
- Reiniciar a máquina: `sudo reboot`
- Verificar se sudo instalado (apos entrar no root): `sudo -V`
- Criar utilizador (Ja foi criado no inicio): `sudo adduser faaraujo`
- Criar um novo grupo: `sudo addgroup user42`
  - Sera mostrada a menssagem de sucesso com o **G**roup **Id**entifier Ex.: `(GID 1002)` 
  - Podemos verificar se foi criado o grupo com o cmd: `getent group user42`
  - Podemos ver todos os grupos e utilizadores dentro deles: `cat /etc/group`
- Incluir o utilizador nos grupos: 
  - Grupo user: `sudo adduser faaraujo user42`
  - Grupo sudo: `sudo adduser faaraujo sudo`
  - Verificar se tudo foi feito corretamente: `getent group user42` e `getent group sudo` 

## Install SSH
- Atualizar os repositorios (/ect/apt/sources.list): `sudo apt update`
- Instalar OpenSSH (principal ferramenta de conectividade remota): `sudo apt install openssh-server`
- Verificar se foi instalado correctamente: `sudo service ssh status`
  
## Config SSH
*Entrar no utilizador root `su`, ou colocar `sudo` no inicio do cmd*

**Primeiro ficheiro a editar: `/etc/ssh/sshd_config`**
-  Editar ficheiro: `nano etc/ssh/sshd_config`
  1. `Port 22` para `Port 4242`
  2. `PermitRootLogin prohibit-password`  para `PermitRootLogin no`

**Editar ficheiro: `/etc/ssh/ssh_config`**
- Editar ficheiro: `nano /etc/ssh/ssh_config`
  1. `Port 22` para `Port 4242`

**Finalizar Config**
- Reiniciar servico SSH: `sudo service ssh restart`
- Verificar status do SSH: `sudo service ssh status`

## Install [UFW](./105_firewall)

## Config UFW