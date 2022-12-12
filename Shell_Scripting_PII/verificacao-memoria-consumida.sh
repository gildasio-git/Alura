#!/bin/bash

# -i (ignora palavras maicusulas e minusculas
# - F (field)
# obs: desativar segunraça para envio no link 
# https://myaccount.google.com/u/1/account-enhanced-safe-browsing?rapt=AEjHL4MfUelDzKkQiCaowQxTw_9QGThC-UXk6bLRcymON48y34GeG8JkhKlZNusq4WNb0BcMT8AUr9Ycdq23l2lEmwyFmWNgSw

memoria_total=$(free | grep -i  mem | awk '{ print $2}')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total*100" | awk -F'.' '{ print $1}')

#-gt (maior que)
if [ $relacao_memoria_atual_total -gt 50 ]
then
	mail -s "Consumo de memória acima do limite" suporte.tec.ariquemes@gmail.com<<del
O consumo de memória chegou acima do limite especificado, atualmente o consumo é de $(free -h | grep -i mem | awk '{ print $3}')
del
 
fi
