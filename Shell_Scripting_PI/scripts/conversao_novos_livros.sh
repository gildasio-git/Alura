#!/bin/bash
cd ~/Documentos/Alura/Shell_Scripting_PII/scipts/imagens_novos_livros

converte_imagem(){ #função converter imagem 
	local caminho_imagem=$1
	local imagem_sem_extensao=$(ls $caminho_iamgem | awk -F. '{ print $1 }') #removendo extensão da imagem
	convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
 
}


varrer_diretorio(){
	$1 #Pegando o primeiro parãmetro 
	#Fazendo uma varredura no diretório 
	cd $1
	for arquivo in *
	do  
		local caminho_arquivo=$(find ~/Documentos/Alura/Shell_Scripting_PI/scripts/imagens-novos-livros -name $arquivo) #pega o nome do arquivo vindo do parâmetro passado
		if [ -d $caminho_arquivo ] # verifica se é diretório 
		   
		then 
		   #Varrer Diretorio
		   varrer_diretorio $caminho_arquivo #chama a função varrer_diretorio e passa o parâmetro na variavel $1.
		else
		   converte_imagem $caminho_arquivo
		
		fi 
	done 

}

#CHAMANDO  A FUNÇÃO
varrer_diretorio ~/Documentos/Alura/Shell_Scripting_PI/scripts/imagens-novos-livros

if [ $? -eq 0 ]
then
	echo "conversão realizada com sucesso"
	 else 
		echo "erro ao converter"
fi
