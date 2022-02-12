#!/bin/bash

#Escaneo de puertos..

#Colours

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){
	echo -e "\n\n${redColour}[*]${endColour}${grayColour} Exiting...\n${endColour}\n"
	exit 0
}

echo -e "\n${greenColour}[*]${endColour}${purpleColour}Comenzando Scaneo de Puertos${endColour}\n\n"
echo -e "${grayColour}  PORT${endColour}\t\t${grayColour}STATE${endColour}"

for port in $(seq 1 65535);do
	timeout 1 bash -c "echo '' < /dev/tcp/$1/$port" 2>/dev/null && echo -e "${blueColour}   $port${endColour}${greenColour}\t\tOpen${endColour}" &
done; wait
echo -e "[*]Scaneo Finalizado\n"


