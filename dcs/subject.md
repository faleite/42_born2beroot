# Subject

## Links
- [Tutorial](https://github.com/gemartin99/Born2beroot-Tutorial/blob/main/README_POR.md)

## Guidelines
- O uso do VirtualBox (ou UTM se você não puder usar o VirtualBox) é obrigatório.
- Você só precisa entregar um arquivo signature.txt na raiz do seu repositório.
  - Você deve colar nele a assinatura do disco virtual da sua máquina.\
  Vá em Submissão e avaliação por pares para mais informações.

## Mandatory part

*Este projeto consiste em você configurar seu primeiro servidor seguindo regras\
específicas.*
- Você deve escolher como sistema operacional a última versão estável do Debian\
(sem testing/unstable) ou a última versão estável do Rocky. Debian é altamente\
recomendado se você for novo na administração do sistema.
- O **SELinux** deve estar em execução na inicialização e seu a configuração\
deve ser adaptada às necessidades do projeto. **AppArmor**  para o Debian também\
deve estar rodando na inicialização.
- Você deve criar pelo menos *2 partições* criptografadas usando **LVM**. Abaixo\
está um exemplo do particionamento esperado:

![image1.png](./image1.png)

- Um  serviço  SSH  será  executado  apenas  na  porta  4242.  Por  razões  de\
segurança,  não  deve  ser possível  conectar  usando  SSH  como  root.
  - *O uso de SSH será testado durante a defesa com a criação de uma novo conta.\
Portanto, você deve entender como funciona.*
- Você tem que configurar seu sistema operacional com o UFW (ou firewalld para\
Rocky) firewall e assim deixar apenas a porta 4242 aberta.
  - *Seu firewall deve estar ativo quando você iniciar sua máquina virtual.*
- O nome do host de sua máquina virtual deve ser seu login terminando em 42\
(por exemplo, wil42). Você terá que modificar este nome de host durante sua\
avaliação.
- Você precisa implementar uma política de senha forte.
- Você deve instalar e configurar o sudo seguindo regras estritas.
- Além do usuário root, um usuário com seu login como nome de usuário deve estar\
presente.
  - Este usuário deve pertencer aos grupos user42 e sudo.
  - *Durante a defesa, você terá que criar um novo usuário e atribuí-lo a um grupo.*
## Política de senha forte
*Para configurar uma política de senha forte, você deve cumprir os seguintes
requisitos:*
- Sua senha deve expirar a cada 30 dias.
- O número mínimo de dias permitido antes da modificação de uma senha será\
definido como 2.
- O usuário deve receber uma mensagem de aviso 7 dias antes de sua senha expirar.
- Sua senha deve ter pelo menos 10 caracteres. Deve conter uma letra maiúscula,\
uma letra minúscula e um número. Além disso, não deve conter mais de 3 caracteres\
idênticos consecutivos.
- A senha não deve incluir o nome do usuário.
- A seguinte regra não se aplica à senha root: A senha deve ter pelo menos 7\
caracteres que não façam parte da senha anterior.
  - Obviamente, sua senha de root deve estar em conformidade com esta política

*Depois de definir seus arquivos de configuração, você terá que alterar todas as\
senhas das contas presentes na máquina virtual, incluindo a conta root.*

### Grupo sudo 
*Para definir uma configuração forte para o seu grupo sudo, você deve cumprir\
os seguintes requisitos:*
- A autenticação usando sudo deve ser limitada a 3 tentativas no caso de um erro\
de senha incorreta.
- Uma mensagem personalizada de sua escolha deve ser exibida se occorer um erro\
devido a uma senha incorreta, ao usar o sudo.
- Cada ação usando o sudo deve ser arquivada, tanto as entradas quanto as saídas.\
o arquivo de registro deve ser salvo na pasta /var/log/sudo/.
- O modo TTY deve ser ativado por motivos de segurança.
- Também por motivos de segurança, os caminhos que podem ser usados pelo sudo\
devem ser restritos.

*Exemplo:*
```sh
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin
```

## Perguntas
- Sobre o sistema operacional escolhido. (Debian ou Rocky)
  - Porque e qual as sua diferenças.
- Qual as diferenças  entre  **aptitude**  e **apt**
- O  que  é  **SELinux**  ou  **AppArmor**
- *Obs. Entenda sobre tudo o que for usado no projeto*

