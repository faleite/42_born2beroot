# SELinux

SELinux, ou Security-Enhanced Linux, é um mecanismo de segurança desenvolvido para o kernel do Linux. Ele fornece um conjunto de recursos avançados de controle de acesso obrigatório (MAC) para fortalecer a segurança do sistema operacional.

O SELinux foi originalmente desenvolvido pelo National Security Agency (NSA) dos Estados Unidos e, posteriormente, foi disponibilizado como software livre e de código aberto. Ele foi projetado para complementar os mecanismos tradicionais de controle de acesso baseados em permissões do Linux, como permissões de usuário (owner), grupo e outros.

Ao contrário das permissões tradicionais do Linux, que são baseadas em permissões discrecionárias (DAC), o SELinux implementa um modelo de segurança obrigatório (MAC). Nesse modelo, cada objeto (como arquivos, diretórios, processos, sockets de rede) e sujeito (usuário, processo) no sistema possui um contexto de segurança atribuído. O SELinux aplica regras de política rígidas para determinar quais ações um sujeito pode realizar em um objeto, independentemente das permissões tradicionais.

O SELinux fornece uma camada adicional de proteção, permitindo a definição de políticas detalhadas e granulares para cada recurso do sistema. Ele ajuda a prevenir a exploração de vulnerabilidades, impedindo que processos comprometidos realizem atividades não autorizadas. O SELinux também registra auditorias detalhadas para acompanhar as ações do sistema, o que é útil para fins de investigação de segurança e conformidade.

Embora o SELinux possa fornecer uma segurança aprimorada, ele também requer um conhecimento mais profundo e configuração cuidadosa. A configuração incorreta do SELinux pode levar a problemas de compatibilidade ou bloquear a execução de determinadas operações no sistema. Portanto, é importante entender como o SELinux funciona e como configurá-lo corretamente para garantir uma segurança eficaz e evitar problemas indesejados.

# AppArmor

O AppArmor é um framework de segurança desenvolvido para o kernel do Linux. Ele é projetado para reforçar a segurança do sistema operacional, permitindo que os administradores definam políticas de segurança baseadas em perfis para aplicativos individuais.

O objetivo principal do AppArmor é controlar as permissões de acesso dos aplicativos, limitando suas ações e restringindo o que eles podem fazer no sistema. Ele define um conjunto de regras e restrições para cada aplicativo, especificando quais recursos, como arquivos, diretórios, dispositivos e serviços de rede, podem ser acessados por um determinado aplicativo e quais ações estão permitidas ou proibidas.

O AppArmor opera usando um modelo de segurança de controle de acesso discrecional (DAC), onde as permissões são definidas pelo proprietário do objeto ou administrador do sistema. Ele complementa o modelo padrão de permissões do Linux, como o sistema de controle de acesso obrigatório (MAC) fornecido pelo SELinux.

Uma das vantagens do AppArmor é sua abordagem baseada em perfil. Cada aplicativo tem seu próprio perfil de segurança, que contém as regras específicas que determinam suas permissões. Esses perfis podem ser criados manualmente ou gerados automaticamente pelo AppArmor com base no comportamento do aplicativo durante um processo chamado de "profilagem". Isso permite uma configuração mais granular e adaptável da segurança para cada aplicativo, reduzindo a superfície de ataque e mitigando possíveis riscos de segurança.

O AppArmor é usado por várias distribuições Linux, como o Ubuntu, openSUSE e SUSE Linux Enterprise. Ele fornece uma camada adicional de segurança ao restringir as ações de aplicativos maliciosos ou comprometidos, ajudando a prevenir a exploração de vulnerabilidades e a mitigar possíveis danos ao sistema. No entanto, assim como o SELinux, o AppArmor requer configuração cuidadosa e atualização regular para garantir uma proteção eficaz e evitar problemas de compatibilidade.

# SELinux vs. AppArmor

Tanto o SELinux quanto o AppArmor são frameworks de segurança para o kernel do Linux que têm o objetivo de reforçar a segurança do sistema operacional. Ambos fornecem mecanismos para definir políticas de segurança e controlar o acesso de aplicativos a recursos do sistema.

No entanto, existem algumas diferenças entre o SELinux e o AppArmor, incluindo a abordagem de segurança e a implementação.

- Modelo de Segurança: O SELinux utiliza um modelo de segurança obrigatório (MAC), enquanto o AppArmor emprega um modelo de segurança discrecional (DAC). No modelo MAC, políticas rígidas e centralizadas são aplicadas a todos os processos e objetos do sistema, independentemente das permissões tradicionais. Já no modelo DAC, as permissões são baseadas no proprietário do objeto ou nas configurações do administrador.

- Perfis e Restrições: O SELinux e o AppArmor usam perfis para definir as restrições de segurança para aplicativos individuais. No SELinux, os perfis são chamados de "políticas" e contêm regras detalhadas para controlar o acesso a recursos. No AppArmor, os perfis são chamados de "perfis de segurança" e definem as permissões e restrições para cada aplicativo.

- Distribuições Linux: O SELinux é usado principalmente em distribuições como Red Hat Enterprise Linux (RHEL), CentOS e Fedora. Por outro lado, o AppArmor é adotado por distribuições como Ubuntu, openSUSE e SUSE Linux Enterprise.

Apesar das diferenças, tanto o SELinux quanto o AppArmor visam melhorar a segurança do sistema operacional Linux, fornecendo uma camada adicional de controle e restrições para aplicativos. Ambos podem ajudar a prevenir a exploração de vulnerabilidades e a mitigar possíveis danos causados por aplicativos comprometidos.

A escolha entre o SELinux e o AppArmor geralmente depende das preferências e requisitos específicos da distribuição Linux e do ambiente em que serão utilizados. Algumas distribuições podem ter uma preferência ou suporte nativo a um desses frameworks, enquanto outras podem oferecer suporte a ambos como opções de segurança.