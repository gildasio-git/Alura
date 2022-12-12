#!/bin/bash 

if [ ! -d log ]
then 

	mkdir log
fi


processos=$(ps  -e  -o pid --sort  -size | head -n 11 | grep [0-9])


processos_memoria(){
for pid in $processos
do 

# -n odena não ir para uma nova linha 

	nome_processo=$(ps -p $pid -o comm=)
        echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log
	tamanho_processo=$(ps -p $pid -o size | grep [0-9])
	echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> log/$nome_processo.log

	
done 
}

processos_memoria

if [ $? -eq 0 ]
then 

	echo "arquivos salvos com sucesso"

	else 
		echo  "houve um problema na hora de salvar os arquivos "

fi


