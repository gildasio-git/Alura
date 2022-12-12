
#!/bin/bash

#verifica o status de saida do serviço HTTP
resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

#testa a saida do status http se  é igual a 200
# obs: ne=não é igual  | eq = igual a 
if [ $resposta_http -ne 200 ]
then
#-S = titulo da mensagem << del (delimitador da mensagem "icluir antes dos parãmentros DELL)
mail -s "Problema no servidor HTTP" suporte.tec.ariquemes@gmail.com<<del
	Houve um problema no servidor e os usuários pararam de ter acesso ao servido HTTP da página.
del

	systemctl restart apache2  #reiniciando o servidor
	
fi



