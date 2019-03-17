#!/bin/bash
#Shell Script de instalação do laravel!
#Criado  28/03/2019
#By: Jhonatas Rodrigues de Barros
echo ""
echo "

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



whoami=" Se não souber seu usuário utilize o comando (whoami), antes de prosseguir."

#Pegando nome do usuário

echo -e "\033[01;33mOlá, Para Prosseguir Informe o Seu usuário.\033[01;36m$whoami"
read -p  "Usuário: " USER

if [ /home/$USER == $HOME ]; then
	
#Criando arquivo para log

	if [ ! -d /home/$USER/Área\ de\ Trabalho/Log ]; then
		cd /home/$USER/Área\ de\ Trabalho && mkdir Log && cd Log && touch Laravel.log
		else
			echo -e "\033[01;34mDiretório de Log já existe! :)"
	fi

	#Instalando o composer

	echo"" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m======================" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;33mInstalando o composer" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m======================\033[01;33m" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo "" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log


	sudo apt-get install composer -y
	sudo chown -R $USER:$USER .composer/composer.json | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log  

	#começando a instalação das depedencias

	echo -e "" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m==============================" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;33mInstalando Laravel Dependences" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m==============================\033[01;33m" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo "" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log

	#Interessante, aqui é um exemplo de exibição do comando na tela e registrando log.
	#O comando instala todas as depedencias necessárias para a (INSTALAÇÃO DO LARAVEL)

	sudo apt-get install php7.* | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	sudo apt-get install php-common php-mbstring php-xml php-zip | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log 

	echo ""
	echo -e "\033[01;36m====================" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;33mInstalando O Laravel" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m====================\033[01;33m" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo ""

	#Instalando o laravel, FINALMENTE!
	composer global require laravel/installer | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log

	echo "" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m=========================================" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;33mExecutando Instalações do Laravel no PATH" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m=========================================\033[01;32m" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo "" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log

	#Habilitando os comandos do laravel via desktop!

	$HOME/.config/composer/vendor/bin/laravel new blog | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log

	#Limpando Cache do composer

	echo"" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m===========================" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;33mLimpando Cache" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo -e "\033[01;36m===========================\033[01;32m" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
	echo ""

	if [ /home/$USER/cache/ ]; then
		sudo chown -R $USER /home/$USER/.composer/cache/repo/https---packagist.org | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log 
		sudo chown -R $USER /home/$USER/.composer/cache/files/ 
		echo "Cache Limpo com sucesso!"
	else
		echo "\033[01;36mNão existe Arquivo de Cache :)"
	fi

	#Criando primeiro projeto Laravel
	read -p "Você deseja criar seu primeiro projeto agora? [y/n] :" RESPOSTA
	if [ "$RESPOSTA" == "y" ]; then
		clear
		echo "" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
		echo -e "\033[01;36m=======================================" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
		echo -e "\033[01;33mCriando Primeiro Projeto" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
		echo -e "\033[01;36m=======================================\033[01;32m" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
		echo "" | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log

		echo -e "\033[01;33mPara criar seu primeiro projeto, é necessário um nome. \033[01;36mDigite o nome do seu projeto piloto\033[01;33m: "
		read -p "Nome do Projeto: " PROJETO

		cd /home/$USER/Área\ de\ Trabalho/ && mkdir Laravel-Projects

		composer create-project laravel/laravel /home/$USER/Área\ de\ Trabalho/Laravel-Projects/$PROJETO --prefer-dist | tee /home/$USER/Área\ de\ Trabalho/Log/Laravel.log
		echo ""
		echo -e "\033[01;33m==================================================================================================================================="
		echo ""
		echo -e "\033[01;33mParabéns, \033[01;36mseu projeto foi criado na pasta \033[01;33m/home/$USER/Área\ de\ Trabalho/Laravel-Projects/$PROJETO"
		echo ""
		echo -e "\033[01;36m Qual quer dúvida ou bug, mande um email para:\033[01;33m jhonsnoow32@gmail.com :)"
		echo ""
		echo -e "\033[01;33m=================================================================================================================================== "
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
		echo -e "\033[01;33m==================================================================================================================================="
		echo ""
		echo -e "\033[01;33mParabéns, Laravel Instalado com sucesso :)"
		echo ""
		echo -e "\033[01;36m Qual quer dúvida ou bug, mande um email para:\033[01;33m jhonsnoow32@gmail.com :)"
		echo ""
		echo -e "\033[01;33m=================================================================================================================================== "	
	fi
else
	echo -e "\033[01;33mOps, parece que esse usuário não existe no sistema."
fi
