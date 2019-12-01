#!/bin/bash
####################################################
#  APRCOIN MASTERNODE INSTALLER WITH TOR           #
#                                                  #
#  https://github.com/taperj/aprcoin-tor           #
#                                                  #
#  V. 0.0.1                                        #
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
printf "${WHITE}Enter the masternode's ip address and hit enter:${NC}"
read MASTERNODEADDR
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
for file in aprcoin.conf peers.dat Dockerfile services/aprcoind/run services/aprcoind/finish services/tor/run services/tor/finish
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
if [ ! -d sporks ]; then
	printf "${RED}sporks BOOTSTRAP DIRECTORY NOT FOUND. ${GREEN}REMOVING BOOTSTRAP COPY FROM DOCKERFILE.${NC}\n"
	sed -i "s/COPY\ --chown=aprcoin:aprcoin\ sporks\ \/home\/aprcoin\/.aprcoin\/sporks/#COPY\ --chown=aprcoin:aprcoin\ sporks\ \/home\/aprcoin\/.aprcoin\/sporks/g" Dockerfile
	fi
if [ -d sporks ];then
	printf "${GREEN}sporks... BOOTSTRAP DIRECTORY FOUND.${NC}\n"
	fi
if [ ! -d chainstate ]; then
        printf "${RED}chainstate... BOOTSTRAP DIRECTORY NOT FOUND. ${GREEN}REMOVING BOOTSTRAP COPY FROM DOCKERFILE.${NC}\n"
	 sed -i "s/COPY\ --chown=aprcoin:aprcoin\ chainstate\ \/home\/aprcoin\/.aprcoin\/chainstate/#COPY\ --chown=aprcoin:aprcoin\ chainstate\ \/home\/aprcoin\/.aprcoin\/chainstate/g" Dockerfile
	fi
if [ -d chainstate ];then
	printf "${GREEN}chainstate... BOOTSTRAP DIRECTORY FOUND.${NC}\n"
	fi
if [ ! -d blocks ]; then
	printf "${RED}blocks... BOOTSTRAP DIRECTORY NOT FOUND. ${GREEN}REMOVING BOOTSTRAP COPY FROM DOCKERFILE.${NC}\n"
	sed -i "s/COPY\ --chown=aprcoin:aprcoin\ blocks\ \/home\/aprcoin\/.aprcoin\/blocks/#COPY\ --chown=aprcoin:aprcoin\ blocks\ \/home\/aprcoin\/.aprcoin\/blocks/g" Dockerfile
	fi
if [ -d blocks ];then
         printf "${GREEN}blocks... BOOTSTRAP DIRECTORY FOUND.${NC}\n"
         fi

#
#
#Edit aprcoin.conf:
#
printf "${YELLOW}Editing aprcoin.conf...${NC}\n"
sed -i "s/masternodeprivkey=/masternodeprivkey=$MASTERNODEPRIVKEY/g" -i "s/masternodeaddr=/masternodeaddr=$MASTERNODEADDR/g" \
	-i "s/rpcuser=/rpcuser=$RPCUSER/g" -i "s/rpcpassword=/rpcpassword=$RPCPASSWORD/g" aprcoin.conf
#
#
#Build image
#
printf "${YELLOW}Building docker image apr-tor...${NC}\n"
docker build -t apr-tor .
#
#Create container
#
printf "${YELLOW}Creating container apr-tor...${NC}\n"
docker create --name apr-tor --restart=always -p 3134:3134 apr-tor:latest
#
#
#Start container
#
printf "${YELLOW}Starting container apr-tor...${NC}\n"
docker container start apr-tor
sleep 4
docker ps
printf "${GREEN}INSTALLATION COMPLETE.${NC}\n"
printf "${YELLOW}ONCE SYNCED YOU CAN GET THE TOR(onion) ADDRESS TO ADD TO YOUR COLD WALLET masternode.conf as server address with:${NC}\n"
printf "${WHITE}$ sudo docker container exec apr-tor grep AddLocal /home/aprcoin/.aprcoin/debug.log${NC}\n"
printf "${YELLOW}THE ABOVE COMMAND SHOULD OUTPUT SOMETHING LIKE THIS EXAMPLE OUTPUT:${NC}\n"
printf "${WHITE}2019-11-24 02:33:16 AddLocal(zsddfken27kdsdx.onion:3134,4)${NC}\n"
printf "${YELLOW}in this example you would add ${GREEN}zsddfken27kdsdx.onion:3134${YELLOW} to your cold wallet masternode.conf as ip addr for this alias. Yours will be different than the example.${NC}\n"
printf "${RED}IMPORTANT: IF YOU ARE RUNNING A FIREWALL MAKE SURE TO ALLOW PORT 3134/TCP FOR APRCOIND${NC}\n"
printf "${YELLOW}WAS THIS A HELPFUL INSTALLER?${NC}\n"
printf "${YELLOW}FEEL FREE TO DROP ME A TIP!${NC}\n"
printf "${YELLOW}BTC: 3HLx5AMe9S5SWzVqLwAib3oyGZm5nAAWKe${NC}\n"
printf "${YELLOW}APR: 5viioDMZwV3awbm7ZNxFo941iQzfjfHYWV${NC}\n"
printf "${YELLOW}HAPPY ANONYMOUS APRCoin MASTERNODING!${NC}\n"
