# o from diz para o docker que imagem baixar e que versão baixar
# após os dois pontos fica especificado a versão da imagem
FROM node:lts-alpine

# o comando run roda um comando na hora da criação do container
# nesse caso é criada a pasta de dependencias para dentro do doctainer
# e depois é adicionada a permisão de escrita e criação para a pasta do projeto no container
# node no caso é tambem o nome padrão do usuario que rodara os comandos dentro do container
RUN mkdir -p /home/node/api/node_modules && chown -R node:node /home/node/api

# aqui seta em que pasta nois vamos trabalhar
WORKDIR /home/node/api

# aqui nos vamos copiar os arquivos do gerenciador de pacotes para a pasta do projeto
COPY package.json yarn.* ./

# aqui nos forcamos o usuário padrão para prevenir erros que poderiam acontecer.
USER node

# e aqui nos damos permição total para os arquivos dentro da pasta do nosso projeto
COPY --chown=node:node . .

# aqui nos setamos a porta que sera usada pelo container do servidor
EXPOSE 3333
