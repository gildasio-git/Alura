#!/bin/bash

#usando a estrutura (evitando vários ifs ) CASE


cd ~/Documentos/Alura/Shell_Scripting_PII

#testa se o usuário passou parâmtro 
if [ -z $1 ] # -z testa se o parâmetro passado pelo usuário é vazio 
then
while [ -z $requisicao ] #enquanto o parÇâmetro for vazio solicita entrada de dados
	do
	read -p "Voce esqueceu de inserir um parâmetro (GET,PUT,POST,DELETE): " requisicao 
	# passa o valor passado pelo usuário para a variável REQUISICAO READ - le o parâmetro passado pelo usuário, -p mantém na mesma linha, sem quebra de linha.
	letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1)}')  #converte o parâmetro passado pelo usuário para maiusculo, porém agora passando a variável REQUISIÇÃO.
	done
else
letra_maiuscula=$(echo $1 | awk '{ print toupper($1)}')  #converte o parâmetro passado pelo usuário para maiusculo

fi


case $letra_maiuscula in 
 	GET)
	cat access.log | grep GET
	;;

	POST)
	cat access.log | grep POST
	;;

	PUT)
	cat access.log | grep PUT
	;;

	DELETE)
	cat access.log | grep DELETE
	;;

	*) #qualquer outro parâmetro diferente dos demais 
	echo "PARÂMETRO PASSADO NÃO É VÁLIDO"
	;;
esac




