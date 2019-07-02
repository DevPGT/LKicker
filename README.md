# LKicker
A Simple script to facilitate an kick-out any victim or unwanted intruder from your local network.


OBS: Do not use on network's which you dont have a administrator permission!
Simple way to use,
  - chmod +x kicker
  - Kicker
  - Wait and select your favorite wlan interface
  - To work right, check if the other's cards is turned off !
  - Select the victim then kick-out it!
  - Only tested on debian based system's !
  - Core-dependencies: Aircrack-ng, nmap and core linux tools like "sed","cat" and "tail".
  - note: To work fine, turn off the other's interface typing "ifconfig wlanX down" on your terminal!

Please note this is my first bash script posted on github, i hope you enjoy and report the issues, then i will try to fix it the quickest possible!

Check the script demo here: https://youtu.be/vsTWO_IYYZU (new)



Notas da nova atualização { 3.0.1 }:
 - Implementado auto-updater
 - Implementado novo sistema de cores
 - Implementado verificador e instalador automatico de dependencias
 - Implementado verificador de frequencia da conexão utilizada ( não testado com 5GHZ pode não funcionar ! )
 - Implementado auto-desabilitador de interfaces para evitar conflitos entre si
 - Implementado sistema para verificar compatibilidades e evitar erros
 - Implementado sistema de checar portas abertas e identificar sistema operacional no cliente escolhido
 - Implementado sistema de re escanear a rede caso tenha tido problema ao exibir os clientes conectados a rede
 - Implementado sistema de proteção contra uso de interfaces inexistentes (escrito pelo usuario)
 - Varios bugs e problemas corrigidos
 - Novo modelo de mensagens , alertas , perguntas e informativos
 - Novas mensagens para manter o usuario atualizado em relação ao que esta sendo identificado e feito pelo script

Reportem problemas , bugs ou erros tentarei ajudar o mais breve possivel ! desde já agradeço !
