# Avaliação

### Signature.txt
- Obter a assinatura: 
  1. `cd /nfs/homes/username/sgoinfre/vm_name`
  2. `shasum Born2beroot.vdi`
  3. Pegue a assinatura adicione ao ficheiro **signature.txt**, envie para o reporitorio no intra.

*shasum -> Comando para identificar a integridade de um ficheiro através da soma de verificação do hash SHA-1 de um ficheiro.*

### Perguntas
- [Notas Filipa](./112_notas_filipa.pdf)
- [Tutorial](https://github.com/gemartin99/Born2beroot-Tutorial/blob/main/README_POR.md#9-1-respostas-de-avalia%C3%A7%C3%A3o-)

### Comandos de avaliação
- Verificar se não há nenhuma interface gráfica:
`ls /usr/bin/*session` (Deve obter o resultado: `/usr/bin/dbus-run-session`)
- Verificar se o serviço UFW está a ser utilizado.
`sudo ufw status` ou `sudo service ufw status`
- Verificar se o serviço SSH está a ser utilizado:
`sudo service ssh status`
- Verifique qual sistema operativo esta a utilizar:
`uname -v` ou `uname --kernel-version`
- Verificar se o seu utilizador está nos grupos "sudo" e "user42":
`getent group sudo` e `getent group user42`
- Criar novo utilizador e mostrar que segue a política de palavra-passe criada:
`sudo adduser name_user` (password ex: Abesta1b23)
- Criar um novo grupo:
`sudo addgroup name_group`
- Acrescentar o novo utilizador ao novo grupo:
`sudo adduser name_user name_group`
- Verificar se foi introduzido correctamente:
`getent group name_group`
-  Verificar o nome da máquina (se esta correto como user42):
`hostname`
-  Modifique o nome de anfitrião para substituir o seu login pelo login do avaliador.
`sudo nano /etc/hostname` 
- Substituir o nosso login pelo novo login do avaliador.
`sudo nano /etc/hosts`
- Reinicie a maquina: 
`sudo reboot`
- Ver se o nome do anfitrião foi alterado correctamente:
`hostname`
- Verificar se todas as partições estão como indicado no subject:
`lsblk`
- Verificar se **sudo** e **ufw** está instalado:
`which sudo` ou `dpkg -s sudo`  <->  `dpkg -s ufw`
- Introduzir o novo utilizador no grupo sudo:
`sudo adduser name_user sudo`
- Verificamos se está no grupo:
`getent group sudo`
- Mostrar a aplicação das regras impostas ao sudo pelo subject:
`nano /etc/sudoers.d/sudo_config`
- Mostar ficheiro de historico de comandos:
`cd /var/log/sudo`
`cat sudo_config`
- Listar as regras activas na UFW de forma numerada:
`sudo ufw status numbered`
-  Criar uma nova regra para a porta 8080:
`sudo ufw allow 8080`
- Listar as regras activas na UFW de forma numerada:
`sudo ufw status numbered`
- Eliminar a regra da porta 8080:
`sudo ufw delete num_rule`
-  Modificar o tempo de execução do guião de 10 minutos para 1 minuto:
`sudo crontab -u root -e`
- Fazer o guião parar de funcionar quando o servidor tiver começado, mas não modificar o guião.
`sudo /etc/init.d/cron stop`
- Voltar a funcionar:
`sudo /etc/init.d/cron start`
- [Tutorial](https://github.com/gemartin99/Born2beroot-Tutorial/blob/main/README_POR.md#9-2-comandos-de-avalia%C3%A7%C3%A3o-%EF%B8%8F)
