#!/bin/bash
#Shell Script de instalação do laravel!
#Criado  28/03/2019
#By: Jhonatas Rodrigues de Barros
declare -A CORES
echo ""
echo -e "${CORES['WHITE']}

░░░░░░░░░░░░░░░░░░░░
░░░█░░░█░░░░█░░░█░░░
░░░░█░█░░░░░░█░█░░░░
░░░░░█░░░░░░░░█░░░░░
░░░░█░█░░░░░░█░█░░░░
░░░█░░░█░░░░█░░░█░░░
░█░░░░░░░░░░░░░░░░█░
░░█░░░░░░░░░░░░░░█░░
░░░█░░░░░░░░░░░░█░░░
░░░░████████████░░░░
░░░░░░░░░░░░░░░░░░░░
░░░╔═╦═╗░░░░╔═╦╗░░░░
░░░║║║║╠═╗╔╦╣═╣╚╗░░░
░░░║║║║║╬╚╣╔╬═║║║░░░
░░░╚╩═╩╩══╩╝╚═╩╩╝░░░
░░░░░░░░░░░░░░░░░░░░
"


CORES=(
	["WHITE"]='\033[01;39m'
	["YELLOW"]='\033[01;33m'
	["GREEN"]='\033[01;32m'
	["RED"]='\033[01;31m
'
)
LOG= | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log 
#Pegando nome do usuário

if [ /home/$USER == $HOME ]; then
	
#Criando arquivo para log

	if [ ! -d /home/$USER/Área\ de\ Trabalho/Log ]; then
		cd /home/$USER/Área\ de\ Trabalho && mkdir Log && cd Log && touch Laravel.log
		else
			echo -e "${CORES['RED']}Diretório de Log já existe! :)"
	fi

	#Instalando o composer

	echo "" ${LOG}
	echo -e "${CORES['WHITE']}======================" ${LOG}
	echo -e "${CORES[GREEN]} Instalando o composer" ${LOG}
	echo -e "${CORES['WHITE']}======================${CORES['WHITE']}" ${LOG}
	echo "" ${LOG}

	echo -e "${CORES['YELLOW']}"
	sudo apt-get install composer -y
	sudo chown -R $USER:$USER .composer/composer.json ${LOG}  

	#começando a instalação das depedencias

	echo "" ${LOG}
	echo -e "${CORES['WHITE']}==============================" ${LOG}
	echo -e "${CORES['GREEN']}Instalando Laravel Dependences" ${LOG}
	echo -e "${CORES['WHITE']}==============================${CORES['WHITE']}" ${LOG}
	echo "" ${LOG}

	#Interessante, aqui é um exemplo de exibição do comando na tela e registrando log.
	#O comando instala todas as depedencias necessárias para a (INSTALAÇÃO DO LARAVEL)
	echo -e "${CORES['YELLOW']}"
	sudo apt-get install php7.* ${LOG}
	sudo apt-get install php-common php-mbstring php-xml php-zip ${LOG} 

	echo ""
	echo -e "${CORES['WHITE']}====================" ${LOG}
	echo -e "${CORES['GREEN']}Instalando O Laravel" ${LOG}
	echo -e "${CORES['WHITE']}====================${CORES['WHITE']}" ${LOG}
	echo ""

	#Instalando o laravel, FINALMENTE!
	composer global require laravel/installer ${LOG}

	echo "" ${LOG}
	echo -e "${CORES['WHITE']}=========================================" ${LOG}
	echo -e "${CORES['GREEN']}Executando Instalações do Laravel no PATH" ${LOG}
	echo -e "${CORES['WHITE']}=========================================" ${LOG}
	echo "" ${LOG}

	#Habilitando os comandos do laravel via desktop!
	$HOME/.config/composer/vendor/bin/laravel new blog ${LOG}

	#Limpando Cache do composer

	echo -e "" ${LOG}
	echo -e "${CORES['WHITE']}===========================" ${LOG}
	echo -e "${CORES['GREEN']}Limpando Cache" ${LOG}
	echo -e "${CORES['WHITE']}===========================" ${LOG}
	echo ""

	if [ ! -d /home/$USER/cache/ ]; then
		echo "${CORES['RED']}Não existe Arquivo de Cache :)"
	else
		sudo chown -R $USER /home/$USER/.composer/cache/repo/https---packagist.org ${LOG} 
		sudo chown -R $USER /home/$USER/.composer/cache/files/ 
		echo "Cache Limpo com sucesso!"
	fi

	#Criando primeiro projeto Laravel
	read -p "Você deseja criar seu primeiro projeto agora? [y/n] :" RESPOSTA
	if [ "$RESPOSTA" == "y" ]; then
		clear
		echo "" ${LOG}
		echo -e "${CORES['WHITE']}=======================================" ${LOG}
		echo -e "${CORES['GREEN']}Criando Primeiro Projeto" ${LOG}
		echo -e "${CORES['WHITE']}=======================================\033[01;32m" ${LOG}
		echo "" ${LOG}

		echo -e "${CORES['WHITE']}Para criar seu primeiro projeto, é necessário um nome. ${CORES['WHITE']}Digite o nome do seu projeto piloto${CORES['WHITE']}: "
		read -p "Nome do Projeto: " PROJETO

		cd /home/$USER/Área\ de\ Trabalho/ && mkdir Laravel-Projects

		composer create-project laravel/laravel /home/$USER/Área\ de\ Trabalho/Laravel-Projects/$PROJETO --prefer-dist ${LOG}
		echo ""
		echo -e "${CORES['WHITE']}==================================================================================================================================="
		echo ""
		echo -e "${CORES['GREEN']}Parabéns, ${CORES['WHITE']}seu projeto foi criado na pasta ${CORES['RED']}/home/$USER/Área\ de\ Trabalho/Laravel-Projects/$PROJETO"
		echo ""
		echo -e "${CORES['YELLOW']} Qual quer dúvida ou bug, mande um email para:${CORES['RED']} jhonsnoow32@gmail.com :)"
		echo ""
		echo -e "${CORES['WHITE']}=================================================================================================================================== "
		read -p "Você deseja startar o servidor agora? [y/n] : " STARTAR
		if [[ ${STARTAR} == "y" ]]; then
			cd /home/$USER/Área\ de\ Trabalho/Laravel-Projects/$PROJETO/
			php artisan serve
		else
			echo -e "\033[01;32mBye!!!! :)"
			exit 
		fi
	else
		clear
		echo ""
		echo -e "${CORES['WHITE']}==================================================================================================================================="
		echo ""
		echo -e "${CORES['GREEN']}Parabéns, Laravel Instalado com sucesso :)"
		echo ""
		echo -e "${CORES['YELLOW']} Qual quer dúvida ou bug, mande um email para:${CORES['WHITE']} jhonsnoow32@gmail.com :)"
		echo ""
		echo -e "${CORES['WHITE']}=================================================================================================================================== "	
	fi
else
	echo -e "${CORES['RED']}Ops, parece que esse usuário não existe no sistema."
fi
