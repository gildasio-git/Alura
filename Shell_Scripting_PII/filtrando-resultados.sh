#!/bin/bash 

cd ~/Documentos/Alura/Shell_Scripting_PI

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then 
	cat access.log  | grep $1 #$1 pega o primeiro parãmetro passado pelo usuário  
	if [ $? -ne 0 ]
        then 
	    echo  "ip procurado não esta presente"]

	     fi
else
 	echo "Formato não é valido"
fi



