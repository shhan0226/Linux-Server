#!/bin/bash

##################################
IAMACCOUNT=$(whoami)
echo "${IAMACCOUNT}"

if [ "$IAMACCOUNT" = "root" ]; then
        echo "It's root account."
else
        echo "It's not a root account."
	exit 100
fi

##################################
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "APT update..."
apt update -y
apt dist-upgrade -y

##################################
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Python & pip SET ..."
apt install python3-pip -y
update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1
update-alternatives --config python
sudo -H pip3 install --upgrade pip

##################################
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Install git ..."
apt install git -y
git config --global user.name shhan0226
git config --global user.email shhan0226@gmail.com

##################################
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Install Mariadb ..."
read -p "[Mariadb] Would you like to install it? <y|n>: " MARIADB_INSTALL
echo "$MARIADB_INSTALL"

if [ "${MARIADB_INSTALL}" = "y" ]; then
	sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
	sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] https://ftp.harukasan.org/mariadb/repo/10.5/ubuntu bionic main'
	apt update -y
	apt dist-upgrade -y
	apt install mariadb-server -y
	apt install python3-pymysql -y
fi

##################################
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Install Simplejson ..."
read -p "[Simplejson] Would you like to install it? <y|n>: " SIMPLEJSON_INSTALL
sync

if [ "${SIMPLEJSON_INSTALL}" = "y" ]; then
	pip install simplejson
	sync
	pip install --ignore-installed simplejson
fi

##################################
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "Install crudini ..."
read -p "[crudini] Would you like to install it? <y|n>: " CRUDINI_INSTALL
sync

if [ "${CRUDINI_INSTALL}" = "y" ]; then
	apt install -y python3-iniparse
	git clone https://github.com/pixelb/crudini.git
	mv crudini /usr/bin/crudinid 
	ln -s /usr/bin/crudinid/crudini /usr/bin/crudini
fi

##################################
echo "Install C++ ..."
read -p "[G++] Would you like to install it? <y|n>: " G_INSTALL
sync

if [ "${G_INSTALL}" = "y" ]; then
        apt install g++ -y
        sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
        apt update -y
        apt dist-upgrade -y
        apt install -y g++-6
        apt install -y g++-6-multilib
        sudo dpkg -l| grep g++ | awk '{print $2}'
        sudo update-alternatives --display g++
        sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 40
        sudo update-alternatives --config g++
        sudo update-alternatives --display g++
fi

##################################
echo "Install Django ..."
read -p "[Django] Would you like to install it? <y|n>: " DJANOG_INSTALL
sync

if [ "${DJANOG_INSTALL}" = "y" ]; then
        pip install Django
        pip install Django --upgrade
        python -m django --version
fi

##################################
apt update -y
apt dist-upgrade -y
apt autoremove -y

#################################
echo "======================================="
echo "THE END !!!"
