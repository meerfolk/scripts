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
	options=(1 "Git" off
		 2 "Vim" off
	         3 "VS Code" off
	         4 "NVM" off
		 5 "Skype" off
		 6 "KeePassXC" off
		 7 "Docker" off
		 8 "Autokey" off
		 9 "oh-my-zsh" off
		 10 "psql-client" off
		 11 "redis-cli" off
		 12 "gnome-tweak-tool" off
		 13 "guake" off)
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
			1)
				echo "Installing Git"
				apt install git -y
				wget -qO- https://raw.githubusercontent.com/meerfolk/configs/master/.gitconfig > ~/.gitconfig
				chown $CH_USER ~/.gitconfig
				;;
			2)
				echo "Install Vim"
				apt install vim -y
				wget -qO- https://raw.githubusercontent.com/meerfolk/configs/master/.vimrc > ~/.vimrc
				chown $CH_USER ~/.vimrc
				git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
				;;
	      		3)
				echo "Installing VS Code"
				snap install code --classic
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
				apt install zsh -y
				sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"				
				;;
                        10)
                                echo "Install psql-client"
                                apt install postgresql-client -y
                                ;;
                        11)
                                echo "Install redis-tools"
                                apt install redis-tools -y
                                ;;
                        12)
                                echo "Install gnome-tweak-tool"
                                apt install gnome-tweak-tool -y
                                ;;
                        13)
                                echo "Install guake"
                                apt install guake -y
                                ;;
                    esac
	done
fi

