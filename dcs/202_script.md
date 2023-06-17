# Script
```bash
#!/bin/bash

### Variables ###

# Architecture and Kernel version
arch=$(uname -a)
# arch=$(uname -rm) # flag -r (Arch), flarg -m (Kernel)

# CPU Physical
pcpu=$(lscpu | grep 'Socket(s):' | awk '{print $2}')

# CPU Virtual
cpuv=$(grep "^processor" /proc/cpuinfo | wc -l)
# cpuv=$(nproc)

# RAM
tram=$(free --mega | awk '$1 == "Mem:" {print $2}')
uram=$(free --mega | awk '$1 == "Mem:" {print $3}')
pram=$(free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}')

# Disk
tdisk=$(df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_t += $2} END {printf"%.0fGb\n", m_t/1024}')
udisk=$(df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_u += $3} END {print m_u}')
pdisk=$(df -m | grep "/dev/" | grep -v "/boot/" | awk '{u += $3} {t += $2} END {printf"(%d%%)\n", u/t*100}')

# CPU Load
cpul=$(top -bn1 | grep "^%Cpu(s):" | awk '{printf("%.1f%%\n", $2 + $4)}')

# Time last Reboot
treboot=$(who -b | awk '$1 == "system" {print $3 " " $4}')
# treboot=$(uptime -s)

# LVM status
slvm=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo "yes"; else echo "no"; fi)

# TCP status (number of actives)
natcp=$(ss -ta | grep "ESTAB" | wc -l)

# Number of users
nuser=$(users | wc -w)

# IP and MAC Address
maca=$(ip link | grep "link/ether" | awk '{print $2}')
ipa=$(hostname -I)

# Command SUDO
ncsudo=$(journalctl _COMM=sudo | grep "COMMAND" | wc -l)

### Script ###

wall "Architecture: $arch
      CPU physical: $pcpu
      vCPU: $cpuv
      Memory Usage: $uram/${tram}MB $pram
      Disk Usage: $udisk/${tdisk} $pdisk
      CPU load: $cpul
      Last boot: $treboot
      LVM use: $slvm
      Connections TCP: $natcp ESTABLISHED
      User log: $nuser
      Network: IP $ipa ($maca)
      Sudo: $ncsudo cmd"
```

# Comandos

## Versão do kernel
Para verificar a versão do kernel do Linux no terminal, você pode usar o comando "uname" com a opção "-r". O comando completo seria:

`uname -r`

Quando você executa esse comando, ele exibirá apenas o número da versão do kernel.

Outra opção é usar o comando "uname" com a opção "-a", que exibirá informações mais detalhadas, incluindo a versão do kernel. O comando completo é:

`uname -a`

Ao executar esse comando, você verá informações como o nome do sistema operacional, o nome do host, a versão do kernel, a arquitetura do processador e outras informações relevantes.

Ambos os comandos podem ser executados como um usuário comum, não sendo necessário ter privilégios de superusuário (root) para visualizar a versão do kernel.

## Arquitetura do Sistema Operacional

Para verificar a arquitetura do sistema operacional Linux no terminal, você pode usar o comando "uname" com a opção "-m" ou "-p". Ambas as opções fornecem informações sobre a arquitetura do processador. 

O comando completo seria: `uname -m` ou `uname -p`

Ao executar um desses comandos, ele retornará uma string que representa a arquitetura do processador. Aqui estão alguns exemplos comuns:

- x86: Indica uma arquitetura de 32 bits do processador Intel x86.
- x86_64 ou amd64: Indica uma arquitetura de 64 bits do processador Intel ou AMD.
- arm: Indica uma arquitetura ARM.
- arm64: Indica uma arquitetura ARM de 64 bits.
- ppc ou powerpc: Indica uma arquitetura PowerPC.
- sparc: Indica uma arquitetura SPARC.

Vale ressaltar que essas são apenas algumas das possíveis arquiteturas. A saída pode variar dependendo do sistema operacional Linux e do hardware em uso. O comando pode ser executado como um usuário comum, sem a necessidade de privilégios de superusuário (root).

## Número de physical processors (CPU físicas)

Para verificar o número de CPUs físicas em um sistema, é necessário observar a quantidade de sockets presentes na placa-mãe.

A linha "CPU(s):" exibida pelo comando "lscpu" representa o número total de CPUs lógicas, que inclui tanto CPUs físicas quanto CPUs virtuais (por meio de tecnologias como hyper-threading). Portanto, ela não fornece uma indicação direta do número de CPUs físicas.

Para determinar o número de CPUs físicas, é necessário verificar a quantidade de sockets presentes na placa-mãe. Cada socket é capaz de acomodar uma única CPU física. Portanto, se você observar que a placa-mãe possui dois sockets, isso significa que ela suporta duas CPUs físicas.

A quantidade de sockets é a informação relevante para verificar o número de CPUs físicas em um sistema.

### Obter número de sockets
Para obter o valor da string "Socket(s)" no comando "lscpu", você pode usar comandos de filtragem de texto, como o "grep". Aqui está o comando completo que você pode usar:

`lscpu | grep 'Socket(s):' | awk '{print $2}'`

Explicando o comando passo a passo:

1. **lscpu** é o comando para obter informações da CPU.
2. O caractere **|** (pipe) é usado para redirecionar a saída do comando **lscpu** para o próximo comando, que é o "grep".
3. **grep 'Socket(s):'** filtra as linhas que contêm a string **Socket(s):**.
4. O caractere **|** (pipe) novamente é usado para redirecionar a saída do comando **grep** para o próximo comando, que é o **awk**.
5. **awk '{print $2}'** extrai o segundo campo da linha filtrada, que é o valor correspondente à quantidade de sockets.
6. O resultado será a quantidade de sockets (número de CPUs físicas) do sistema.

Portanto, ao executar esse comando, você obterá apenas o valor da string "Socket(s)" no comando "lscpu".

## Número de virtual processors (CPU virtual)

*Comandos:*
`grep "^processor" /proc/cpuinfo | wc-l)` ou
`nproc`

*O que faz cada parte do comendo:*
1. `grep "^processor" /proc/cpuinfo`: O comando `grep` é usado para pesquisar por linhas que correspondam a um padrão em um arquivo. Nesse caso, estamos procurando por linhas que comecem com a palavra "processor" no arquivo `/proc/cpuinfo`. O arquivo `/proc/cpuinfo` contém informações sobre a CPU do sistema.
2. `|`: O pipe (|) é usado para redirecionar a saída do comando anterior para o próximo comando.
3. `wc -l`: O comando `wc` (word count) é usado para contar palavras, linhas e caracteres em um arquivo. A opção `-l` faz com que o `wc` conte o número de linhas.

Portanto, o comando completo `grep "^processor" /proc/cpuinfo | wc -l` busca por linhas que começam com "processor" no arquivo `/proc/cpuinfo` e, em seguida, conta o número de linhas correspondentes. 

Essa é uma maneira de obter o número de CPUs virtuais disponíveis no sistema por meio da leitura do arquivo `/proc/cpuinfo`.

## Memória RAM
*Para verificar o uso da RAM no terminal Linux, você pode usar o comando **free:***

1. `free --mega`: O comando `free` é usado para exibir informações sobre a memória do sistema. A opção `--mega` é usada para exibir os valores em megabytes.
2. `|` (pipe): O pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
3. `awk`: O comando `awk` é uma ferramenta de processamento de texto poderosa. Ele é usado para filtrar e manipular dados de acordo com padrões especificados.
4. `'$1 == "Mem:"`: Aqui, definimos um padrão no `awk` para selecionar a linha que começa com "Mem:" (que é a linha que contém informações sobre a memória total do sistema).
5. `{printf("(%.2f%%)\n", $3/$2*100)}`: Esse trecho de código é uma ação do `awk` que é executada apenas para as linhas que correspondem ao padrão acima. Ele formata e imprime a porcentagem de uso de memória. O valor da porcentagem é calculado dividindo o valor do terceiro campo ($3, que é a memória usada) pelo valor do segundo campo ($2, que é a memória total) e, em seguida, multiplicando por 100. O formato `%.2f` é usado para exibir a porcentagem com duas casas decimais. O `\n` é usado para imprimir uma nova linha após a porcentagem.

Resumindo, o código completo `free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}'` exibe a porcentagem de uso de memória do sistema. Ele utiliza o comando `free` para obter informações sobre a memória do sistema, o `awk` para filtrar a linha que contém a memória total e calcular a porcentagem de uso, e, por fim, o `printf` para imprimir a porcentagem formatada.

## Memória de HDD
### Obter valor de uso do disk

`df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_u += $3} END {print m_u}'`

1. `df -m`: O comando `df` é usado para exibir informações sobre o espaço em disco. A opção `-m` é usada para exibir os valores em megabytes.

2. `|` (pipe): O pipe é usado para redirecionar a saída do comando anterior para o próximo comando.

3. `grep "/dev/"`: O comando `grep` é usado para filtrar linhas com base em um padrão. Neste caso, estamos procurando por linhas que contenham "/dev/" no output do comando `df`. Essas linhas normalmente correspondem a sistemas de arquivos montados em dispositivos físicos.

4. `|` (pipe): Outro pipe é usado para redirecionar a saída do comando anterior para o próximo comando.

5. `grep -v "/boot/"`: O comando `grep` com a opção `-v` é usado para filtrar linhas que não contenham "/boot/" no output do comando anterior. O objetivo aqui é excluir sistemas de arquivos montados na partição "/boot/", se houver.

6. `|` (pipe): Mais um pipe é usado para redirecionar a saída do comando anterior para o próximo comando.

7. `awk '{m_u += $3} END {print m_u}'`: O comando `awk` é usado para processar e manipular dados de texto. Aqui, estamos acumulando a soma dos valores do terceiro campo ($3) em cada linha e armazenando na variável "m_u". No final, quando todas as linhas foram processadas, usamos o bloco "END" para imprimir o valor final armazenado em "m_u".

Resumindo, o código completo `df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_u += $3} END {print m_u}'` exibe a soma do espaço usado (em megabytes) dos sistemas de arquivos montados em dispositivos físicos, excluindo a partição "/boot/". É uma maneira de obter o espaço total usado em discos físicos no seu sistema Linux, excluindo a partição de boot, se houver.

### Obter valor total do disk
Claro! Vou explicar o código linha por linha:

`df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_t += $2} END {printf"%.0fGb\n", m_t/1024}'`

1. `df -m`: O comando `df` é usado para exibir informações sobre o espaço em disco. A opção `-m` é usada para exibir os valores em megabytes.
2. `|` (pipe): O pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
3. `grep "/dev/"`: O comando `grep` é usado para filtrar linhas com base em um padrão. Neste caso, estamos procurando por linhas que contenham "/dev/" no output do comando `df`. Essas linhas normalmente correspondem a sistemas de arquivos montados em dispositivos físicos.
4. `|` (pipe): Outro pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
5. `grep -v "/boot/"`: O comando `grep` com a opção `-v` é usado para filtrar linhas que não contenham "/boot/" no output do comando anterior. O objetivo aqui é excluir sistemas de arquivos montados na partição "/boot/", se houver.
6. `|` (pipe): Mais um pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
7. `awk '{m_t += $2} END {printf"%.0fGb\n", m_t/1024}'`: O comando `awk` é usado para processar e manipular dados de texto. Aqui, estamos acumulando a soma dos valores do segundo campo ($2) em cada linha e armazenando na variável "m_t". No final, quando todas as linhas foram processadas, usamos o bloco "END" para imprimir o valor final armazenado em "m_t" dividido por 1024 para convertê-lo em gigabytes (GB). A formatação "%.0fGb\n" é usada para exibir o resultado sem casas decimais e com a unidade "GB".

Resumindo, o código completo `df -m | grep "/dev/" | grep -v "/boot/" | awk '{m_t += $2} END {printf"%.0fGb\n", m_t/1024}'` exibe a soma do espaço total (em gigabytes) dos sistemas de arquivos montados em dispositivos físicos, excluindo a partição "/boot/". É uma maneira de obter o espaço total em gigabytes usado em discos físicos no seu sistema Linux, excluindo a partição de boot, se houver.

### Obter a porcentagem de memória utilizada do disk

`df -m | grep "/dev/" | grep -v "/boot/" | awk '{use += $3} {total += $2} END {printf"(%d%%)\n", use/total*100}'`

1. `df -m`: O comando `df` é usado para exibir informações sobre o espaço em disco. A opção `-m` é usada para exibir os valores em megabytes.
2. `|` (pipe): O pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
3. `grep "/dev/"`: O comando `grep` é usado para filtrar linhas com base em um padrão. Neste caso, estamos procurando por linhas que contenham "/dev/" no output do comando `df`. Essas linhas normalmente correspondem a sistemas de arquivos montados em dispositivos físicos.
4. `|` (pipe): Outro pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
5. `grep -v "/boot/"`: O comando `grep` com a opção `-v` é usado para filtrar linhas que não contenham "/boot/" no output do comando anterior. O objetivo aqui é excluir sistemas de arquivos montados na partição "/boot/", se houver.
6. `|` (pipe): Mais um pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
7. `awk '{use += $3} {total += $2} END {printf"(%d%%)\n", use/total*100}'`: O comando `awk` é usado para processar e manipular dados de texto. Aqui, estamos acumulando a soma dos valores do terceiro campo ($3, espaço usado) em cada linha e armazenando na variável "use". Também acumulamos a soma dos valores do segundo campo ($2, espaço total) em cada linha e armazenamos na variável "total". No final, quando todas as linhas foram processadas, usamos o bloco "END" para calcular a porcentagem de uso dividindo a variável "use" pela variável "total", multiplicando por 100 e formatando com "%d%%\n" para exibir o resultado com o símbolo de porcentagem.

Resumindo, o código completo `df -m | grep "/dev/" | grep -v "/boot/" | awk '{use += $3} {total += $2} END {printf"(%d%%)\n", use/total*100}'` exibe a porcentagem de uso de espaço em disco dos sistemas de arquivos montados em dispositivos físicos, excluindo a partição "/boot/". Ele acumula a soma do espaço usado e espaço total, calcula a porcentagem de uso e a formata para exibir no formato "(%d%%)".

## CPU Load 
### Taxa de utilização dos processos

`top -bn1 | grep "%Cpu(s):" | awk '{printf("%.1f%%\n", $2 + $4)}'`

1. `top -bn1`: O comando `top` é usado para monitorar os processos em execução e o desempenho do sistema. A opção `-bn1` é fornecida para executar o `top` em modo não interativo (`-b`) e para executar apenas uma iteração (`-n1`) antes de sair. Isso permite que o `top` produza uma saída única e pare de ser executado.
2. `|` (pipe): O pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
3. `grep "%Cpu(s):"`: O comando `grep` é usado para filtrar linhas com base em um padrão. Neste caso, estamos procurando por linhas que contenham "%Cpu(s):" na saída do comando `top`. Essa linha contém informações sobre a utilização da CPU.
4. `|` (pipe): Outro pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
5. `awk '{printf("%.1f%%\n", $2 + $4)}'`: O comando `awk` é usado para processar e manipular dados de texto. Aqui, estamos usando o `awk` para formatar e imprimir a porcentagem de utilização da CPU. 
   - A opção `printf("%.1f%%\n", $2 + $4)` é usada para formatar e imprimir o valor como um número de ponto flutuante com uma casa decimal (`%.1f`) seguido do símbolo de porcentagem (`%%`) e um caractere de nova linha (`\n`).
   - `$2` refere-se ao segundo campo na linha filtrada pelo `grep`, que contém a porcentagem de uso da CPU do usuário.
   - `$4` refere-se ao quarto campo na mesma linha, que contém a porcentagem de uso da CPU do sistema.
   - Ao somar `$2` e `$4`, obtemos a utilização total da CPU.
   
Portanto, o código completo `top -bn1 | grep "%Cpu(s):" | awk '{printf("%.1f%%\n", $2 + $4)}'` extrai a porcentagem total de utilização da CPU do comando `top` e a formata para exibição no formato "%.1f%%".

## Time Reboot
### Mostrar a data e hora do último reboot

`who -b | awk '$1 == "system" {print $3" "$4}'`

1. `who -b`: O comando `who -b` é usado para exibir informações sobre o último boot do sistema. Ele retorna uma linha contendo a data e hora do último reboot, juntamente com a mensagem "system boot".
2. `|` (pipe): O pipe é usado para redirecionar a saída do comando anterior para o próximo comando.
3. `awk '$1 == "system" {print $3" "$4}'`: O comando `awk` é usado para processar e manipular dados de texto. Aqui, estamos usando o `awk` para filtrar a linha que contém a mensagem "system boot" e imprimir a data e hora correspondentes.
   - `$1` refere-se ao primeiro campo na linha, que é a mensagem "system".
   - `$3` refere-se ao terceiro campo, que é a data.
   - `$4` refere-se ao quarto campo, que é a hora.
   - `'$1 == "system" {print $3" "$4}'` é uma expressão condicional em `awk`. Ele verifica se o primeiro campo é igual a "system" e, se for verdadeiro, imprime o terceiro campo (data) seguido pelo quarto campo (hora), separados por um espaço em branco.

Portanto, o código completo `who -b | awk '$1 == "system" {print $3" "$4}'` extrai a data e hora do último reboot do sistema a partir da saída do comando `who -b` e imprime apenas essas informações formatadas como "data hora".

## LVM status
### Veficar se LVM esta ativa
`if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo "yes"; else echo "no"; fi`

1. `if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then`: A instrução `if` é usada para realizar uma verificação condicional. Neste caso, estamos verificando se o número de linhas contendo a palavra "lvm" na saída do comando `lsblk` é maior que 0.
2. `$(lsblk | grep "lvm" | wc -l)`: Esta parte do código executa o comando `lsblk` para listar informações sobre os blocos de armazenamento do sistema. O resultado é então passado para o comando `grep`, que filtra as linhas contendo a palavra "lvm". O comando `wc -l` é usado para contar o número de linhas resultantes.
3. `-gt`: É um operador de comparação **greater then** usado no contexto do comando `if` (`[`) para verificar se o número de linhas é maior que 0.
4. `then`: É uma palavra-chave que indica o início do bloco de comandos a serem executados se a condição do `if` for verdadeira.
5. `echo "yes"`: Se a condição do `if` for verdadeira, ou seja, se houver linhas contendo "lvm", o comando `echo` é usado para imprimir "yes".
6. `else`: É uma palavra-chave que indica o início do bloco de comandos a serem executados se a condição do `if` for falsa.
7. `echo "no"`: Se a condição do `if` for falsa, ou seja, se não houver linhas contendo "lvm", o comando `echo` é usado para imprimir "no".
8. `fi`: É uma palavra-chave que indica o fim do bloco de comandos condicionais.

Portanto, o código completo verifica se há algum dispositivo LVM na saída do comando `lsblk` e imprime "yes" se houver, ou "no" se não houver. Isso pode ser útil para determinar se a LVM está ativa no sistema com base na presença de dispositivos LVM listados pelo comando `lsblk`.

## TCP status
### Ver número de conexões ativas
`ss -ta | grep "ESTAB" | wc -l`

Esse código executa uma série de comandos em conjunto para contar o número de conexões TCP estabelecidas (ESTABLISHED) em um sistema. Vamos analisar cada parte:

1. `ss -ta`: O comando `ss` é executado com as opções `-ta`, que exibe todas as conexões TCP ativas, incluindo aquelas nas fases de escuta e estabelecidas.
  - `-t`: Mostra apenas as conexões TCP.
  - `-a`: Exibe todas as conexões, incluindo aquelas nas fases de escuta e estabelecidas.
3. `grep "ESTAB"`: O pipe (`|`) redireciona a saída do comando anterior para o comando `grep`, que filtra as linhas que contêm a palavra "ESTAB". Isso serve para filtrar apenas as conexões que estão no estado ESTABLISHED (estabelecidas).
4. `wc -l`: O comando `wc` é usado para contar o número de linhas na saída do comando anterior. A opção `-l` especifica que apenas o número de linhas deve ser retornado.

Em resumo, o código completo conta o número de conexões TCP estabelecidas no sistema. Ele utiliza o `ss` para listar todas as conexões TCP ativas, em seguida, o `grep` filtra apenas as linhas que contêm "ESTAB" (representando o estado ESTABLISHED), e, finalmente, o `wc -l` conta o número de linhas resultantes. O resultado é o número de conexões TCP estabelecidas no sistema.

## Users
### Número de utilizadores conectados
`users | wc -w`

1. **users** lista o nome dos usuários conectados
2. **wc -w** conta o número de palavras

## IP - MAC
### Endereço IPv4
`hostname -I`
### Endereço MAC (Media Access Control)
`ip link | grep "link/ether" | awk '{print $2}'`

O comando `ip link` é usado no terminal Linux para exibir e gerenciar as interfaces de rede do sistema. Ele fornece informações sobre as interfaces de rede disponíveis e permite realizar várias operações relacionadas a essas interfaces. Aqui estão algumas das principais funcionalidades do comando `ip link`:

1. Exibir informações das interfaces: Executar o comando `ip link` sem argumentos lista todas as interfaces de rede do sistema, incluindo informações como o nome da interface (como eth0, wlan0, etc.), o estado da interface (UP ou DOWN), o endereço MAC, a MTU (Maximum Transmission Unit), o estado da ligação (LINK/NO-CARRIER), entre outros.
2. Ativar/desativar interfaces: O comando `ip link set <interface> up` é usado para ativar uma interface de rede específica, enquanto `ip link set <interface> down` é usado para desativá-la. Isso permite controlar o estado das interfaces, ligando-as ou desligando-as conforme necessário.
3. Configurar parâmetros de interface: O comando `ip link set <interface> <parâmetro> <valor>` permite configurar vários parâmetros de uma interface, como definir o endereço MAC, definir a MTU, habilitar/desabilitar recursos específicos, entre outros.
4. Adicionar/remover endereços IP: Com o comando `ip addr add <endereço> dev <interface>`, você pode adicionar um endereço IP a uma interface específica. O comando `ip addr del <endereço> dev <interface>` é usado para remover um endereço IP da interface.
5. Alterar nome da interface: O comando `ip link set <interface> name <novo_nome>` permite alterar o nome de uma interface de rede para um novo nome específico.

Essas são apenas algumas das funcionalidades básicas do comando `ip link`. Ele é uma ferramenta poderosa para gerenciar as interfaces de rede no Linux, permitindo configurar, exibir e controlar diversos aspectos relacionados à conectividade de rede do sistema. Para mais informações e opções disponíveis, consulte a página de manual do comando `ip` digitando `man ip` no terminal.

## Commandos SUDO
### Verificar números de comandos *sudo*
`journalctl _COMM=sudo | grep "COMMAND" | wc -l`

Esse código executa uma série de comandos em conjunto para contar o número de vezes que o comando `sudo` foi executado no sistema, usando o registro do `journalctl`. Vamos analisar cada parte:

1. `journalctl _COMM=sudo`: O comando `journalctl` é executado com o parâmetro `_COMM=sudo`, que filtra o registro do sistema para exibir apenas as entradas relacionadas ao comando `sudo`. O `_COMM` é um campo que representa o nome do comando executado.
2. `grep "COMMAND"`: O pipe (`|`) redireciona a saída do comando anterior para o comando `grep`, que filtra as linhas que contêm a palavra "COMMAND". Isso serve para filtrar apenas as linhas que contêm informações sobre a execução do comando `sudo`.
3. `wc -l`: O comando `wc` é usado para contar o número de linhas na saída do comando anterior. A opção `-l` especifica que apenas o número de linhas deve ser retornado.

Em resumo, o código completo conta o número de vezes que o comando `sudo` foi executado no sistema, utilizando o registro do `journalctl`. Ele filtra as entradas do `journalctl` para exibir apenas as relacionadas ao `sudo`, filtra novamente para obter apenas as linhas que contêm informações sobre a execução do comando (`COMMAND`), e, finalmente, conta o número de linhas resultantes com o `wc -l`. O resultado é o número de vezes que o comando `sudo` foi executado.

O `journalctl` é um utilitário de linha de comando no Linux usado para acessar e visualizar os registros do sistema coletados pelo sistema de log do systemd, conhecido como "journald". Ele permite ler e analisar os logs gerados pelo sistema operacional, incluindo mensagens do kernel, registros de inicialização, mensagens de serviços e aplicativos em execução, entre outros.