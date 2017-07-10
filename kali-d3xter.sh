#    .---------- constant part!
#    vvvv vvvv-- the code from above
GREEN='\033[1;32m'
NC='\033[0m' # No Color

cd ../

printf "${GREEN} welcome to D3xter's custom kali linux script"
sleep 1
echo "                                            "
sleep 1
echo "Lets begin..."
sleep 1
echo "heres what will be installed...ill try to keep this up to date"
echo "* PPA (Credits to @KALITEAM)"
echo "* Kodi"
echo "* TL-WN722N V.2 Driver (Credits to mrfruba)"
echo "* Android build enviroment shit "
echo "* ability to creat desktop icons"
echo "* Geany"
echo "* Tor Browser"
echo "* Tor"
echo "* proxychains"
echo "* Fluxion WIFI cracking tool"
echo "                                            "
sleep 1
echo "                                            "
read -r -p "Would you like to Continue? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	echo " "
else
    exit
fi
sleep 1
clear

"first we need to install PPA before we upgrade...this will come in handy way later and i highly recommend it"
echo "                                            "

read -r -p "Would you like to install PPA? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	apt-get install dirmngr
	wget http://blog.anantshri.info/content/uploads/2010/09/add-apt-repository.sh.txt
	cp add-apt-repository.sh.txt /usr/sbin/add-apt-repository
	chmod o+x /usr/sbin/add-apt-repository
	chown root:root /usr/sbin/add-apt-repository
	add-apt-repository ppa:openjdk-r/ppa
else
    echo " "
fi
sleep 1
clear

echo "Okay now lets start by making sure you're packages up to date"
sleep 1

echo "                                            "
apt-get update
apt-get upgrade
echo "                                            "

sleep 1
clear

echo "Okay now lets make sure your OS is up to date"

echo "                                            "
apt-get dist-upgrade
echo "                                            "

sleep 1
clear

echo "Okay now thats done lets get into the new shit"
sleep 1

read -r -p "Would you like to install Kodi? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    apt-get install kodi
else
    echo " "
fi
echo "                                            "
sleep 1
clear


read -r -p "Would you like to install The TL-WN722N V.2 driver? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    apt-get install gcc build-essential linux-headers-$(uname -r) 
    git clone https://github.com/mfruba/kernel kernel-1
    cd kernel/drivers/TL-WN722N_v2.0-Ralink/rtl8188EUS_linux_v4.3.0.8_13968.20150417
    make
    make install
    insmod /lib/modules/4.9.0-kali4-amd64/kernel/drivers/net/wireless/8188eu.ko
    cd ../../../../
    rm -rf kernel-1
else
    echo " "
fi
echo "                                            "
sleep 1
clear

read -r -p "Would you like to install an Android build enviroment? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    apt-get install git ccache automake lzop bison gperf build-essential zip curl zlib1g-dev bc g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng maven
    mkdir ~/bin && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo
else
    echo " "
fi
echo "                                            "
sleep 1
clear

read -r -p "Would you like to be able to creat desktop icons? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	apt-get install --no-install-recommends gnome-panel
else
    echo " "
fi
echo "                                            "
sleep 1
clear

read -r -p "Would you like to install geany? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	apt-get install geany
else
    echo " "
fi
echo "                                            "
sleep 1
clear

read -r -p "Would you like to install Tor Browser? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	apt-get install tor
	wget https://www.torproject.org/dist/torbrowser/7.0.2/tor-browser-linux64-7.0.2_en-US.tar.xz
	tar -xvf tor*
	useradd toruser
	chown -R toruser tor-browser_en-US*
	gksu -u toruser tor-browser_en-US/Browser/start-tor-browser
else
    echo " "
fi
echo "                                            "
sleep 1
clear

read -r -p "Would you like to install ProxyChains? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	apt-get install proxychains
else
    echo " "
fi
echo "                                            "
sleep 1
clear

read -r -p "Would you like to install Fluxion? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
	cd Desktop
	mkdir wifi-cracking
	cd wifi-cracking
	git clone https://github.com/FluxionNetwork/fluxion
	cd fluxion
	./install/install.sh
	./fluxion
	cd ../../
else
    echo " "
fi
echo "                                            "
sleep 1
clear

echo "Okay so now for your job since i cant do this by script."
echo "for proxy chains to work you need to do this"
echo "* run this in terminal    nano /etc/proxychains.conf "
echo "* find where it says dynamic_chain remove the # in front "
echo "* then scroll to the bottom and visit here https://github.com/rickdaalhuizen90/proxychains/blob/master/proxies.txt"
echo "* copy and paste the whole list into the bottom of the file open in nano, remove all the #(COUNTRY) you can find so its one block of text"
echo " "
echo " "
echo "If you installed the build enviroment you need to go to root and do these"
echo "* nano ~/.bashrc"
echo "* paste these at the bottom"
echo " "
echo "* export PATH=~/bin:$PATH"
echo "* export USE_CCACHE=1"
echo " "
echo "* then run source ~/.bashrc"
echo " "
echo " "
echo "If you enabled Desktop shortcuts the command to creat one is "
echo " "
echo "* gnome-desktop-item-edit /root/Desktop --create-new"
echo " "
echo "Well...i guess this is it, Goodbye"
sleep 2
exit

