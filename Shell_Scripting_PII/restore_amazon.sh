#!/bin/bash

CAMINHO_RESORE=/home/menphis/Documentos/estudos/Alura/Shell_Scripting_PII/restore_multillidae_amazon 

#Realizando o restore do bucket da amazon
aws s3 sync s3://curso-shell-script/$(date +%F) $CAMINHO_RESTORE

#Acessando pasta restore com o sarquivos do banco
cd $CAMINHO_RESTORE

#verificar parâmetro passado pelo usuário
if [ -f $1.sql ]

then
	#se existir o arquivo no diretório restaura o mesmo para o banco 
	mysql -u root multillidade < $1.sql
	
	#verificando se o status de saída  -  se o banco foi restaurado
	if [ $? -eq 0 ]
	then
	echo " o backup foi estaurado com sucesso"
	
	else
	#caso não exista o arquivo do banco dispara uma msg para o usuário 
	echo "o arquivo procurado não existe no diretório"
fi
