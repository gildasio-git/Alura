#!/bin/bash

#fazer DUMP do BD
# $1 (parâmetro passado pelo usuário)

#acessando pasta do usuário

CAMINHO_HOME=/home/menphis/Documentos/estudos/Alura/Shell_Scripting_PII

cd $CAMINHO_HOME

if [ ! -d backup ]
then
	mkdir backup 
fi

# OBS: recuperando banco com o comando: sudo mysql -u root mysql < ~/Documentos/estudos/Alura/Shell_Scripting_PII/backup/mysql.sql

#fazer DUMP do BD
mysqldump -u root $1 > $CAMINHO_HOME/backup/$1.sql

#verifica o STATUS de saida (se for diferente de zero - ocorreu algum erro 
#eq =(igual)

if [ $? -eq 0 ]
then
	echo "backup realizado com sucesso"

else
	echo "erro ao realizar backup do BD"
fi


