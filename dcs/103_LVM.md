# LVM - Logical Volume Manager

Partições LVM (Logical Volume Manager) são uma abstração de camada de armazenamento que permite gerenciar o espaço em disco de forma flexível e dinâmica. Em vez de usar partições tradicionais do disco rígido, o LVM permite criar volumes lógicos que podem ser redimensionados, movidos e combinados facilmente.

O LVM funciona com os seguintes componentes principais:

1. Physical Volumes (PVs): São as unidades físicas de armazenamento, como discos rígidos, partições ou dispositivos de armazenamento em rede (NAS). Cada PV é dividido em pequenos blocos de dados chamados "extents".

2. Volume Groups (VGs): Os Physical Volumes são agrupados em um Volume Group. É possível ter vários PVs em um único VG. Um VG representa um pool de armazenamento lógico.

3. Logical Volumes (LVs): Dentro de um VG, os Logical Volumes são criados. Eles são análogos às partições tradicionais, mas com a vantagem de serem redimensionáveis. Os LVs podem ser alocados em qualquer quantidade de espaço disponível no VG. Esses LVs podem ser formatados e montados como partições normais.

4. Extents: São pequenos blocos de dados que constituem o espaço de armazenamento. Eles são agrupados em Physical Volumes (PVs) e podem ser alocados em Logical Volumes (LVs).

A principal vantagem do LVM é a flexibilidade de gerenciamento do espaço em disco. Você pode redimensionar LVs em tempo real, aumentando ou diminuindo o tamanho conforme necessário, sem interromper o sistema ou perder dados. Também é possível criar snapshots (instantâneos) dos LVs, facilitando a criação de backups consistentes.

Além disso, o LVM permite a criação de volumes espelhados (mirrored) para maior redundância e volumes listrados (striped) para melhorar o desempenho, distribuindo os dados entre vários PVs.

No geral, o LVM é uma solução poderosa para o gerenciamento flexível de armazenamento em sistemas Linux, permitindo uma administração mais eficiente dos recursos de armazenamento e simplificando tarefas como expansão de volumes, gerenciamento de espaço livre e criação de backups.