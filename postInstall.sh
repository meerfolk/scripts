#!/bin/bash
#Update and Upgrade
echo "Updating and Upgrading"
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install dialog
cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
options=(1 "Git" off
         2 "Vim" off
         3 "oh-my-zsh" off
         4 "VS Code" off
         5 "NVM" off
         6 "Skype" off
         7 "KeePassXC" off
         8 "Docker" off
         9 "Autokey" off
         11 "psql-client" off
         12 "redis-cli" off
         13 "gnome-tweak-tool" off
         14 "tilda" off)
        choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
        clear
        for choice in $choices
        do
            case $choice in
                1)
                        echo "Installing Git"
                        sudo apt install git -y
                        wget -qO- https://raw.githubusercontent.com/meerfolk/configs/master/.gitconfig > ~/.gitconfig
                        chown $CH_USER ~/.gitconfig
                        ;;
                2)
                        echo "Install Vim"
                        sudo apt install vim -y
                        wget -qO- https://raw.githubusercontent.com/meerfolk/configs/master/.vimrc > ~/.vimrc
                        chown $CH_USER ~/.vimrc
                        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
                        ;;
                3)
                        echo "Install oh-my-zsh"
                        sudo apt install zsh -y
                        sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
                        ;;
                4)
                        echo "Installing VS Code"
                        sudo snap install code --classic
                        ;;
                5)
                        echo "Install NVM"
                        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
                        ;;
                6)
                        echo "Install Skype"
                        sudo snap install skype --classic
                        ;;
                7)
                        echo "Install KeePassXC"
                        sudo snap install keepassxc
                        ;;
                8)
                        echo "Install Docker"
                        sudo snap install docker
                        ;;
                9)
                        echo "Install Autokey"
                        sudo apt install autokey-gtk -y
                        ;;
                11)
                        echo "Install psql-client"
                        sudo apt install postgresql-client -y
                        ;;
                12)
                        echo "Install redis-tools"
                        sudo apt install redis-tools -y
                        ;;
                13)
                        echo "Install gnome-tweak-tool"
                        sudo apt install gnome-tweak-tool -y
                        ;;
                14)
                        echo "Install tilda"
                        sudo apt install tilda -y
                        ;;
            esac
done

