# Subject

## Guidelines
- O uso do VirtualBox (ou UTM se você não puder usar o VirtualBox) é obrigatório.
- Você só precisa entregar um arquivo signature.txt na raiz do seu repositório.
  - Você deve colar nele a assinatura do disco virtual da sua máquina. Vá em Submissão e avaliação por pares para mais informações.

## Mandatory part

*Este projeto consiste em você configurar seu primeiro servidor seguindo regras específicas.*
- Você deve escolher como sistema operacional a última versão estável do Debian (sem testing/unstable) ou a última versão estável do Rocky. Debian é altamente recomendado se você for novo na administração do sistema.
- O **SELinux** deve estar em execução na inicialização e seu a configuração deve ser adaptada às necessidades do projeto. **AppArmor**  para o Debian também deve estar rodando na inicialização.
- Você deve criar pelo menos *2 partições* criptografadas usando **LVM**. Abaixo está um exemplo do particionamento esperado:

![image1.png](./image1.png)
