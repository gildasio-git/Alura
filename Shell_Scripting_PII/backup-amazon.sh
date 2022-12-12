#!/bin/bash

#Criando uma constante com o caminho da pasta de backup 
CAMINHO_BACKUP=~/Documentos/estudos/Alura/Shell_Scripting_PII/backup_multillidade_amazon

#Acessando o  do backup passando a varíavel que possui o caminho
cd $CAMINHO_BACKUP

#Pegando a data completa 
data=$(date +%F)

#Verifica se existe um diretório  com  a data, caso não cria o diretório
if [ ! -d $data ]
then
	mkdir $data
fi

#Pegando as tabelas suprimindo o cabeçalho com o comando grep -v Tables e passando o valor para a variavel tabelas
tabelas=$(mysql -u root sys -e "show tables;" | grep -v Tables)

#laço de repetição FOR para fazer o dump de todas as  tableas e direcionando para $tabela.sql
for tabela in $tabelas
do
	#Realiza o dump das tabelas do banco e grava no caminho do backup  conteúdo da variável CAMINHO_BACKUP
	mysql -u root $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

#Enviando backup para o bocket da AMAZON
aws s3 sync $CAMINHO_BACKUP s3://curso-shell-script 
