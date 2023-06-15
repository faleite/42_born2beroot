# Instalação da VM

## 1. Downloads
- [Baixar SO Debian (ISO)](https://www.debian.org/download)
- [Baixar Virtual Box](https://www.virtualbox.org/)

## 2. Config VM
- Clique em **New**
- Insira o nome da VM *Ex.:* `Born2berrot`
- Machine Folder *Coloque dentro da pasta:* **sgoinfre**
- Type: **Linux**
- Version: **Debian (64-bit)**
- Selecione a quantidade de RAM
- Selecione **Create a virtual hard disk now**
- Selecione **VDI**
- Selecione **Dynamically allocated**
- Defina a capacidade do  disco *Recomendado 12GB, para bonus 30GB*
- Selecione **Settings** -> **Storage** -> **Empty** -> **Optical Drive** (Escolha a ISO)
- Selecione **Start**

## 3. Instalação Debian
- Selecione **Install** (Nao use Graphical Install)
- Selecione **English**
- Selecione **other**
- Selecione **Europe** (No meu caso)
- Selecione **Portugal** (No meu caso)
- Selecione **United States** (No meu caso)
- Selecione **American English** (No meu caso)
- Em Hostname coloque seu user + 42: **user42**
- Domain name: **Deixe vazio**
- Root password: **crie uma senha** *(Guarde a senha devera usar depois)
- Full name: **Tanto faz**
- Username: **Tanto faz** *(Guarde, devera usar depois)*
- Choose a password: **Cria uma** *(Guarde, devera usar depois)*
- *Se nao fizer bonus* Selecione: **Guied - use entire disk and set up encrypted LVM**

### Seguindo com o bonus
- *Se fizer bonus* Selecione: **Manual**
- Selecione o disco **sda** VBOX HARDDISK
- Selecione **Yes** para aceitar a mensagem de confirmacao
- Selecione **pri/log ... FREE SPACE**
- Selecione **Create a new partition**

### Criar as particoes conforme a imagem
**Particao "sda1"**
- New parttion size: **500m** *(sda1)*
- Selecione **Primary** (Pois sera onde o sistema sera instalado)
- Selecione **Beginnig** *(Queremos que a nova particao seja criada no inicio do espaco disponivel)*
- Selecione **Mount point:      /**
- Selecione **/boot - static files of the boot loader**
- Selecione **Done setting up partition** *(Pois concluimos a config da particao atual)*

**Particao "sda5"**
- Selecione **pri/log ... FREE SPACE**
- Selecione **Create a new partition**
- New parttion size: **max** *(Para o tamanho maximo)*
- Selecione **Logical**
- Selecione **Mount point:      /**
- Selecione **Do not Mount it**
- Selecione **Done setting up partition** *(Pois concluimos a config da particao atual)*

### Criar volumes encriptados para a particao
- Selecione **Configure encrypted volumes**
- Selecione **Yes** para aceitar a mensagem de confirmacao
- Selecione **Create encrypted volumes**
- Selecione a particao a ser encripitada: **sda5**
- Selecione **Done setting up partition** *(Pois concluimos a config da particao atual)*
- Selecione **Finish** *(Pois nao queremos criar mais vol. encripitados)*
- Selecione **Yes** para que tudo detro da particao seja encripitado
- Selecione **Cancel** *(Pois nao ha nada a encripitar, uma vez que a particao esta vazia)*
- Defina a palavra passe: *(Guarde a senha pois sera importante)*

### Configurar o gestor de volume lógico
- Selecione **Configure the logical Volume Manager**
- Selecione **Yes** para guardar as alteracoes do disco
- Selecione **Create volume group** *(Para agrupar as particoes)*
- Volume group name: **LVMGroup** *(Conforme indicado)*
- Selecione a particao: **sda5_crypt** *(Exemplo)*
- LVM configuration action: **Create logical volume**
- Selecione **LVMGroup**
- Logical volume name: **root**
- Logical volume size: **10g**
- *Repita os 4 ultimos passos mudando o nome e tamanho conforme a imagem abaixo*
- Apos criar todos os volumes logicos selecione: **Finish**

![image4.png](./image4.png)
### Configurar ponto de montagem dos ficheiros
- Selecione **#1** *(home)*
- Partition settings: **Use as: do not use**
- How to use this partition: **Ext4 ...** *(Amplamente utilizado em Linux)*
  - No caso do **swap** selecione **swap are** 
- Partition settings: **Mount point**
  - No caso do  **var--log** selecione **manual** introduza **/var/log** 
- Mount point for this partition: **/home - ...** *(O mesmo nome da particao)*
- Partition settings: **Done setting up the partition**
- *Repita os 6 ultimos passos mudando o nome e tamanho conforme a imagem acima*
- Ao final selecione: **Finish partitioning and write chages to disk**
- *Certifique que as particoes sao as mesmas da imagem acima*
- Selecione **Yes** para as alteracoes serem guardadas
- Selecione **No** *(Pois nao precisamos de quaisquer pacotes adicionais*
- Selecione o seu pais: **Portugal** *(Exemplo)*
- Selecione **deb.debian.org**
- Sobre HTTP deixe a opcao vazia: **Continue**
- Selecione **No** *(Nao queremos mostrar nossa estatisticas*
- Remova todas as opcoes (com a barra de espaco): **Continue**
- Selecione **Yes** para instalar [GRUB boot](https://pt.wikipedia.org/wiki/GNU_GRUB)
- Selecione **/dev/sda (ata_VBOX_HARDDISK)**
- Selecione **Continue** para terminar a instalacao

*Ver suas particoes **LVM**: `lsblk` ou `lsblk -b` (`-b` ve as infomacoes de tamanho em bytes)*