clear
echo "#############################"
echo "### PAWCOIN IVP4 By KINGer-C ###"
echo "#############################"
sleep 2s
clear
echo "░░░░░▄▄▀▀▀▀▀▀▀▀▀▄▄░░░░░"
echo "░░░░█░░░░░░░░░░░░░█░░░░"
echo "░░░█░░░░░░░░░░▄▄▄░░█░░░"
echo "░░░█░░▄▄▄░░▄░░███░░█░░░"
echo "░░░▄█░▄░░░▀▀▀░░░▄░█▄░░░"
echo "░░░█░░▀█▀█▀█▀█▀█▀░░█░░░"
echo "░░░▄██▄▄▀▀▀▀▀▀▀▄▄██▄░░░"
echo "░▄█░█▀▀█▀▀▀█▀▀▀█▀▀█░█▄░"
echo "▄▀░▄▄▀▄▄▀▀▀▄▀▀▀▄▄▀▄▄░▀▄"
echo "█░░░░▀▄░█▄░░░▄█░▄▀░░░░█"
echo "░▀▄▄░█░░█▄▄▄▄▄█░░█░▄▄▀░"
echo "░░░▀██▄▄███████▄▄██▀░░░"
echo "░░░████████▀████████░░░"
echo "░░▄▄█▀▀▀▀█░░░█▀▀▀▀█▄▄░░"
echo "░░▀▄▄▄▄▄▀▀░░░▀▀▄▄▄▄▄▀░"
sleep 3s
clear
COIN_TGZ=https://github.com/PawcoinNew/Pawcoin/releases/download/3.4.1/pawcoinv3.4.1-headless.static.tar.gz
IP=$(curl -s4 icanhazip.com)
echo "Downloading latest build..."
sleep 1s
echo " The Default directory is /usr/local/bin"
wget $COIN_TGZ && sudo tar xvzf pawcoinv3.4.1-headless.static.tar.gz -C /usr/local/bin && sudo chmod +x /usr/local/bin/pawcoin*
sleep 1s
echo "done"
sleep 1s
clear 
echo "Removing old files...."
rm -rf pawcoinv3.4.1-headless.static.tar.gz
sleep 1s
echo "done"
sleep 1s
clear
while :
do
echo "###################################################################################"
echo "#                                WHAT DO YOU WANNA DO?                            #"
echo "###################################################################################"
echo "# u - update and upgrade ( recomended once)   # s2 - swap 2Gb memory              #"
echo "# s4 - Swap 4Gb memory                        # s6 - Swap 6gb memory              #"
echo "# i - Get ip information                      # c - Continue instalation          #"
echo "###################################################################################"
read option
if [ $choise = 'u' ]; then
  sudo apt-get install unzip && sudo apt-get update && sudo apt-get  upgrade -y
elif [ $option = 's4' ]; then
  sudo fallocate -l 4G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab && free -h
elif [ $option = 's2' ]; then
  sudo fallocate -l 2G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab && free -h
elif [ $option = 's6' ]; then
  sudo fallocate -l 6G /swapfile && chmod 600 /swapfile && mkswap /swapfile && swapon /swapfile && echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab && free -h
elif [ $option = 'c' ]; then
     break
elif [ $option = 'i' ]; then
  ifconfig
fi
done
echo "Removing old directories"
rm -rf ~/.pawcoin/
sleep 1s
echo "done"
sleep 1s
clear
echo "Enter your masternode private key for node"
read PRIVKEY

CONF_DIR=~/.pawcoin/
CONF_FILE=pawcoin.conf
PORT=8322

mkdir -p $CONF_DIR
echo "rpcuser=PAWCOIN00" >> $CONF_DIR/$CONF_FILE
echo "rpcpassword=PAWCOIN000" >> $CONF_DIR/$CONF_FILE
echo "rpcallowip=127.0.0.1" >> $CONF_DIR/$CONF_FILE
echo "rpcport=8321" >> $CONF_DIR/$CONF_FILE
echo "listen=1" >> $CONF_DIR/$CONF_FILE
echo "server=1" >> $CONF_DIR/$CONF_FILE
echo "daemon=1" >> $CONF_DIR/$CONF_FILE
echo "logtimestamps=1" >> $CONF_DIR/$CONF_FILE
echo "maxconnections=16" >> $CONF_DIR/$CONF_FILE
echo "masternode=1" >> $CONF_DIR/$CONF_FILE
echo "port=8322" >> $CONF_DIR/$CONF_FILE
echo "masternodeaddr=$IP:$PORT" >> $CONF_DIR/$CONF_FILE
echo "masternodeprivkey=$PRIVKEY" >> $CONF_DIR/$CONF_FILE

sudo apt-get install fail2ban -y
sudo ufw allow ssh
sudo ufw allow 8321
sudo ufw allow 8322
sudo ufw enable
sleep 2s
clear
pawcoind
echo " FINISH :)"
sleep 10s
watch pawcoin-cli getinfo
