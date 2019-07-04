# LKicker
A simple script to facilitate and kickout any victim or unwanted intruder from your local network.

OBS: Do NOT use it on networks in which you don't have administrative permission or ownership.

It's simple to use:

1) # chmod +x lkicker
2) #./lkicker
3) Wait and select your favorite wlan interface
4) Select the victim then kick him out!
 * Only tested on debian based systems !
 * Core-dependencies: Aircrack-ng, nmap and core linux tools like "sed","cat" and "tail".

_Please note that this is my first bash script posted on Github. I hope you enjoy it and report any issues, then I'll do my best to fix it as soon as possible!_

Check the script demo here: https://youtu.be/vsTWO_IYYZU (old)


News Patchnotes { 3.0.1 }
 - Implemented auto-updater
 - Implemented new color-system
 - Implemented checker and auto-installer for core-depends
 - Implemented frequency checker (Perhaps 5GHz may not work right)
 - Implemented Interface auto-disable to avoid internal-conflicts
 - Implemented port-checker and O.S Detection
 - Implemented Compability checker to avoid mistakes
 - Implemented Network re-scan option
 - Implemented System to avoid the user of write wrong interface name to ensure the script functionality
 - Bug fixs
 - New model of message, alert, questions and info
 - New messages to keep the user aware about what is happening in the script

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
 
 
 
 Notas de bug fixs { 3.0.6 }:
  - Implementado sistema de verificação de conexão ativa na interface escolhida pelo usuario
  - Implementado sistema para identificar conexão a internet para apropriar o script
  - Implementado um novo sistema com 4 metodos de obtenção do gateway padrão ( devido incompatibilidade com alguns sistemas )
  - Adicionados novas mensagens informativas
  - Resolvido problema do atualizador automatico não funcionar devido a diacronia entre o projeto no Github e o script

Reportem problemas , bugs ou erros tentarei ajudar o mais breve possivel ! desde já agradeço !
