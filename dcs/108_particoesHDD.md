# Tipos de Particoes HDD

Em sistemas de disco rígido, as divisórias são áreas designadas no disco para armazenar dados e informações relacionadas à estrutura e organização do sistema de arquivos. Existem três tipos principais de divisórias em um disco rígido: primária (primary), secundária (extended) e lógica (logical). Vamos explorar cada uma delas em detalhes:

1. Divisória Primária (Primary Partition):
Uma divisória primária é uma área do disco rígido que pode conter um sistema de arquivos e ser inicializável (bootable). Um disco rígido pode ter no máximo quatro divisórias primárias. Essas divisórias são normalmente usadas para instalar sistemas operacionais e armazenar dados primários. Por exemplo, em sistemas Windows, é comum ter uma partição primária onde o sistema operacional está instalado.

2. Divisória Secundária (Extended Partition):
Uma divisória secundária, também conhecida como partição estendida, é uma divisória especial que pode ser usada para criar partições lógicas adicionais. Enquanto as divisórias primárias são limitadas a um máximo de quatro no disco rígido, a divisória secundária permite criar várias partições lógicas dentro dela. Ou seja, ela serve como um container para armazenar partições lógicas adicionais.

3. Divisória Lógica (Logical Partition):
Uma divisória lógica é uma partição criada dentro de uma divisória secundária. Essas partições lógicas são usadas para organizar e armazenar dados adicionais. Ao contrário das divisórias primárias, as divisórias lógicas não podem ser inicializáveis (bootable) diretamente. Elas dependem da divisória secundária para isso.

Em resumo, uma divisória primária é uma partição inicializável no disco rígido, enquanto uma divisória secundária é usada para criar partições lógicas adicionais dentro dela. As divisórias lógicas são partições dentro de uma divisória secundária, permitindo uma organização mais flexível dos dados em um disco rígido. É importante notar que os sistemas de arquivos são geralmente formatados em divisórias primárias ou lógicas para armazenar e acessar os dados corretamente.