#!/bin/bash
####################################################
#  APRCOIN MASTERNODE INSTALLER WITH TOR           #
#                                                  #
#  https://github.com/taperj/aprcoin-tor           #
#                                                  #
#  V. 0.0.3                                        #
#                                                  #
#  By: taperj                                      #
#                                                  #
####################################################
RED='\033[0;31m'
NC='\033[0m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
#
#
#Root user check
if [ "$EUID" -ne 0 ]
  then printf "${YELLOW}Please run as root or with sudo. ${RED}Exiting.${NC}\n"
  exit
fi
#
#
printf "${YELLOW}MMMMMMMMMMMMMMMMMMMMMMMMMWWNNXXKKKKKKKKKKKKKXXXNWWWMMMMMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMWWNNXXXKXXXXXXXXXXXXXXXXXXXXXXXNNWWMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWNNXXKXXXXXXXXXKKKKKKKKKKKXXXXXXXXXKKXNNWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMWNXKKXXXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXXXKXXNWMMMMMMMMMMMMMM
MMMMMMMMMMMWWXXKXXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXXKXXWWMMMMMMMMMMM
MMMMMMMMMWNXKKXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXKKXNWMMMMMMMMM
MMMMMMMMWXKKXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXKKXWWMMMMMMM
MMMMMMWNKKXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXKKNWMMMMMM
MMMMMNXKXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXKXWMMMMM
MMMWNXKXXKKKKKKKKKKKKKKKKKKKKKKKK0OkOOkkOkkkkkkkkkkkkkkkkkOOkOO0KKXXKXNWMMM
MMWNKKXXKKKKKKKKKKKKKKKKKKKKKKKKKOl,.........................cOKKKKXXKKNWMM
MMNKKXXKKKKKKKKKKKKKKKKKKKXXXXKKKK0d;..                    ,dXNXKKKKXXKKNMM
MNXKXXKKKKKKKKKKKKKKKKKKXNWWWWWXKKKK0Od;.                ,dXWWNXKKKKKXXKXNM
WXKXXKKKKKKKKKKKKKKKKKKKNWMWNWMNKKKKKKK0l.             ,xXWWWWNXKKKKKKXXKXW
NKKXXKKKKKKKKKKKKKKKXXNNXNWWWWWWWNXKKKOl.         .';lxXWWWWWWNKKKKKKKXXKKN
XKXXKKKKKKKKKKKKKKXNWWWWWNXNWWNNNNXOl;.        .:dk0KKNWWWWWWWNXKKKKKKKXXKX
KKXXKKKKKKKKKKKKKKXWMWNWMNXKNWWXKOl.         .ck0KKKKXNWWWWWWWNXKKKKKKKXXKK
KKXXKKKKKKKKKKXXXKKXNWMWWXKKKXKOl.         .ck0KKKKKXNWWWWWWWWNXKKKKKKKKXKK
KXXKKKKKKKKKKXWWWNXKXNWMWXKKKOl.         'lkKKKKKKXNWWWWWWWWWWNXKKKKKKKKXXK
KXXKKKKKKKKKKXWMWWWWNXXNWNKOl.         'lOKKKKKKXNWWWWWWWWWWWWNXKKKKKKKKXXK
KXXXKKKKKKKKKKXWWWWMMWNXKOl.        ,:oOKKKKKKXNWWWWWWWNWWWWWWNXKKKKKKKKXKK
KKXXKKKKKKKKKKKNMMWNXXXOl.       .,dOKKKKKKKXNWWWWWWWNXKXXNWWWNXKKKKKKKXXKK
XKXXKKKKKKKKKKKXWWNKKOl.       .;d0KKKKKKKXNWWWWWWWNXKKKKKKXNWNXKKKKKKKXXKX
NKKXKKKKKKKKKKKKXNXOl.       .;x0KKKKKKKXNWWWWWWWNXKKKKKKKKKKXNKKKKKKKXXKKN
WXKXXKKKKKKKKKKKKOl.       .:x0KKKKKKKXNNWWWWWWNXKKKKKKKKKKKKKKKKKKKKKXXKXW
MNXKXXKKKKKKKKKOl.       .ck0KKKKKKXNNWWWWWWWNXKKKKKKKKKKKKKKKKKKKKKKXXKXNM
MMNKKXXKKKKKKOl.       .ck0KKKKKKXNNWWWWWWWNXKKKKKKKKKKKKKKKKKKKKKKKXXKKNMM
MMWNKKXXKKK0x:.......'lkKKKKKKKKXNNNNNNNNNXKKKKKKKKKKKKKKKKKKKKKKKKXXKKNWMM
MMMWNXKXXKKKOkOOOOOOO0KKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXKKNWMMM
MMMMMNXKXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXKXNMMMMM
MMMMMMWNKKXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXKKNWMMMMMM
MMMMMMMMWXKKXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXKKXWMMMMMMMM
MMMMMMMMMWNXKKXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXKKXNWMMMMMMMMM
MMMMMMMMMMMWNXXKXXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXXKXXWWMMMMMMMMMMM
MMMMMMMMMMMMMMWNXXKXXXXXKKKKKKKKKKKKKKKKKKKKKKKKKKKXXXXXKXXNWMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMWNNXKKXXXXXXXXKKKKKKKKKKKKKXXXXXXXXKKXNNWMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMWWNNXXXXXXXXXXXXXXXXXXXXXXXXXXXNNWWMMMMMMMMMMMMMMMMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMWWNNXXKKKKKKKKKKKKXXXNNWWWMMMMMMMMMMMMMMMMMMMMMMMM${NC}\n"
printf "${RED}***************************************************************************${NC}\n"
printf "${RED}****************${YELLOW}WELCOME TO THE APRCOIN MASTERNODE INSTALLER${RED}****************${NC}\n"
printf "${YELLOW}******THIS SCRIPT WILL INSTALL A DOCKER CONTAINER WITH APRCOIN AND TOR*****${NC}\n"
printf "${RED}***************************************************************************${NC}\n"
#
#
#Get install info:
#
printf "${WHITE}Enter the masternode privkey and hit enter:${NC}"
read MASTERNODEPRIVKEY
#
#
#Get masternode's public ip
#
printf "${WHITE}Detecting Public IP..."
#
#Check for cURL
if ! [ -x "$(command -v curl)" ]; then
        printf "${RED}cURL is not detected or not executable.${GREEN} Installing cURL.${NC}\n"
        apt-get -y install curl
fi
#
PUBLICIP=$(curl -s ifconfig.me)
printf "${GREEN}Public IP detected is: $PUBLICIP${NC}\n"
#
printf "${WHITE}Enter the ip you would like to use for the masternode and hit enter:${NC}\n"
read MASTERNODEADDR
#
#
#Port specification
#make sure not to conflict with tor on 9050 and 9051
#
printf "${WHITE}Enter the port number you'd like aprcoind to listen on, default Port 3134 will be used if no port specified.${NC}\n"
read PORTNUMBER

if [ "$PORTNUMBER" != "" ]
  then
        if [ "$PORTNUMBER" = "9050" ] || [ "$PORTNUMBER" = "9051" ]
                then
                        printf "${RED}Port $PORTNUMBER specified in user input. $PORTNUMBER is reserved for Tor. Exiting.${NC}\n"
                        printf "${RED}PLEASE RE-RUN THE SCRIPT SELECTING A DIFFERENT PORT.${NC}\n"
                        exit
        fi
          printf "${YELLOW}Port $PORTNUMBER specified in user input. Port $PORTNUMBER will be configured.${NC}\n"
  else
          printf "${YELLOW}No port number specified. Default Port 3134 will be used.${NC}\n"
          PORTNUMBER=3134
fi
#
#
#RPC
#
printf "${WHITE}Enter a username for RPC:${NC}"
read RPCUSER
printf "${WHITE}Enter a password for RPC:${NC}"
read RPCPASSWORD
printf "${WHITE}SANITY CHECK...${NC}\n"
#
#
#Sanity check
#
#####
#
#Check for docker
#
if ! [ -x "$(command -v docker)" ]; then
	printf "${RED}docker is not detected or not executable.${GREEN} Installing docker.${NC}\n"
	apt-get -y install docker docker.io
fi

if [ -x "$(command -v docker)" ]; then
        printf "${YELLOW}docker detected and executable.${GREEN} Continuing.${NC}\n"
fi

#
#
#Check for files and dirs needed
for file in aprcoin.conf Dockerfile services/aprcoind/run services/aprcoind/finish services/tor/run services/tor/finish 
do
if [ ! -f $file ]; then
	printf "${RED}SANITY CHECK FAILED: $file not found in the current directory, exiting!${NC}\n"
	exit
fi
done
#
#
##
for dir in services services/aprcoind services/tor
do
if [ ! -d $dir ]; then
	printf "${RED}SANITY CHECK FAILED: $dir directory not found, exiting!${NC}\n"
	exit
	fi
done
##
printf "${GREEN}SANITY CHECK PASSED!${NC}\n"
printf "${YELLOW}BEGINNING INSTALL...${NC}\n"
#
#
#CHECK FOR BOOTSTRAP DIRS:
#

printf "${YELLOW}Checking for blockchain bootstrap directories...${NC}\n"

for bootstrapdir in sporks chainstate blocks
do
if [ ! -d $bootstrapdir ]; then
	printf "${RED}$bootstrapdir BOOTSTRAP DIRECTORY NOT FOUND. ${GREEN}REMOVING BOOTSTRAP COPY FROM DOCKERFILE.${NC}\n"
	sed -i "s/COPY\ --chown=aprcoin:aprcoin\ $bootstrapdir\ \/home\/aprcoin\/.aprcoin\/$bootstrapdir/#COPY\ --chown=aprcoin:aprcoin\ $bootstrapdir\ \/home\/aprcoin\/.aprcoin\/$bootstrapdir/g" Dockerfile
	fi
if [ -d $bootstrapdir ];then
	printf "${GREEN}$bootstrapdir... BOOTSTRAP DIRECTORY FOUND.${NC}\n"
	fi
done

#
#
#Edit aprcoin.conf:
#
printf "${YELLOW}Editing aprcoin.conf...${NC}\n"
sed -i "s/masternodeprivkey=/masternodeprivkey=$MASTERNODEPRIVKEY/g" aprcoin.conf
sed -i "s/masternodeaddr=/masternodeaddr=$MASTERNODEADDR/g" aprcoin.conf
sed -i "s/rpcuser=/rpcuser=$RPCUSER/g" aprcoin.conf 
sed -i "s/rpcpassword=/rpcpassword=$RPCPASSWORD/g" aprcoin.conf
sed -i "s/^port=/port=$PORTNUMBER/g" aprcoin.conf
#Edit Dockerfile
printf "${YELLOW}Editing Dockerfile...${NC}\n"
sed -i "s/HiddenServicePort 3134 127.0.0.1:3134/HiddenServicePort $PORTNUMBER 127.0.0.1:$PORTNUMBER/g" Dockerfile

#
#
#Build image
#
printf "${YELLOW}Building docker image apr-tor-$PORTNUMBER...${NC}\n"
docker build -t apr-tor-$PORTNUMBER .
#
#Create container
#
printf "${YELLOW}Creating container apr-tor-$PORTNUMBER...${NC}\n"
docker create --name apr-tor-$PORTNUMBER --restart=always -p $PORTNUMBER:$PORTNUMBER apr-tor-$PORTNUMBER:latest
#
#
#Start container
#
printf "${YELLOW}Starting container apr-tor-$PORTNUMBER...${NC}\n"
docker container start apr-tor-$PORTNUMBER
sleep 10
docker ps
printf "${GREEN}INSTALLATION COMPLETE.${NC}\n"
printf "${YELLOW}ONCE SYNCED YOU CAN GET THE TOR(onion) ADDRESS TO ADD TO YOUR COLD WALLET masternode.conf as server address with:${NC}\n"
printf "${WHITE}$ sudo docker container exec apr-tor-$PORTNUMBER grep AddLocal /home/aprcoin/.aprcoin/debug.log${NC}\n"
printf "${YELLOW}THE ABOVE COMMAND SHOULD OUTPUT SOMETHING LIKE THIS EXAMPLE OUTPUT:${NC}\n"
printf "${WHITE}2019-11-24 02:33:16 AddLocal(zsddfken27kdsdx.onion:$PORTNUMBER,4)${NC}\n"
printf "${YELLOW}in this example you would add ${GREEN}zsddfken27kdsdx.onion:$PORTNUMBER${YELLOW} to your cold wallet masternode.conf as ip addr for this alias. Yours will be different than the example.${NC}\n"
printf "${RED}IMPORTANT: IF YOU ARE RUNNING A FIREWALL MAKE SURE TO ALLOW PORT $PORTNUMBER/TCP FOR APRCOIND${NC}\n"
printf "${YELLOW}TIPS FOR THE DEVELOPER:${NC}\n"
printf "${YELLOW}BTC: 3HLx5AMe9S5SWzVqLwAib3oyGZm5nAAWKe${NC}\n"
printf "${YELLOW}APR: 5viioDMZwV3awbm7ZNxFo941iQzfjfHYWV${NC}\n"
printf "${YELLOW}HAPPY ANONYMOUS APRCoin MASTERNODING!${NC}\n"
