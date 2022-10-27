#! /bin/bash

# Docker
docker build -t circuitos .
docker container run -it circuitos /bin/bash

# Entrar no diretório
cd $1
cd $2
cd $3

# Compilar código usando makefile
make
make tb

# Executar os arquivos de onda
gtkwave wave.ghw
make c