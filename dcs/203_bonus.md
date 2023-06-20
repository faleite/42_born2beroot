## Extra
### Instalacao do Docker
- [Tutorial para Debian](https://docs.docker.com/engine/install/debian/)
- Sugestao de imagem Docker para instalar [Alpine](https://hub.docker.com/_/alpine/) . 
  - Uma imagem mínima do Docker baseada no Alpine Linux com um índice de pacote completo e apenas 5 MB de tamanho.
### Uso basico
- Verificar status do **Docker**: `sudo systemctl status docker`
- Rodar imagem no Docker: `docker run hello-world`
- Obter informacoes do Docker: `docker info`
- Verificar images instaladas no Docker: `docker images`
- Ver lista dos contêineres em execução no seu sistema, com informações detalhadas de cada um deles: `sudo docker container ls -l`

### Verificar status de todos os servicos
`sudo service --status-all`