#!/bin/bash

#DEFININDO VARIAVEIS

#pode criar uma variável com o caminho dos arquivos 
#CAMINHO_IMAGENS=~/Documentos/Alura/Shell_Scripting_PI/scripts/imagens-livros

cd ~/Documentos/Alura/Shell_Scripting_PI/scripts/imagens-livros

#testa a existencia do diretorio 


#envolvendo o código em uma função
converte_imagem(){
if [ ! -d png ] # se não existir diretório PNG cria o diretório
then

	mkdir png
fi

#Passando parãmetro 
#Observe o $ como parâmetro


for  imagem in *.jpg
do
	# local informa que o conteúdo da variável so podera ser acessado dentro da funcão
 	local imagem_sem_extensao=$(ls $imagem | awk -F. '{print $1 }') #divide o arquivo em duas parte nome e extensão.
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}


#invocando a função
converte_imagem 2>erros_conversao.txt #redirecionando a saida da funcao CONVERTE_IMAGEM de erros para arquivo de texto 

#testando a saída da funcao, 0=sucesso 1 a 255 = erro 
if [ $? -eq 0 ]
then

	echo "Conversão realizada com sucesso"

else 

	echo "houve uma falha no processo"

fi 


