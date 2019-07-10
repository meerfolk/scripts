#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y

	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	options=(1 "VS Code" off
		 2 "Vim" off
	         3 "Git" off
	         4 "NVM" off
		 5 "Skype" off
		 6 "KeePassXC" off
		 7 "Docker" off
		 8 "Autokey" off
		 9 "oh-my-zsh" off)
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
	      		1)
				echo "Installing VS Code"
				snap install code --classic
				;;
			2)
				echo "Install Vim"
				apt install vim -y
				;;
			3)
				echo "Installing Git"
				echo $CH_USER
				apt install git -y
				wget -qO- https://raw.githubusercontent.com/meerfolk/configs/master/.gitconfig > ~/.gitconfig
				chown $CH_USER ~/.gitconfig
				;;
			4)
				echo "Install NVM"
				wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
				chown $CH_USER ~/.nvm
				;;
			5)
				echo "Install Skype"
				snap install skype --classic
				;;
			6)
				echo "Install KeePassXC"
				snap install keepassxc
				;;
			7)
				echo "Install Docker"
				snap install docker
				;;
			8)
				echo "Install Autokey"
				apt install autokey-gtk -y
				;;
			9) 
				echo "Install oh-my-zsh"
				sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"				
				;;

	    esac
	done
fi

