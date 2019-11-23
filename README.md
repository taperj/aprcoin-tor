# aprcoin-tor
docker container: aprcoin masternode with tor

Description and purpose:
This repository is my contribution to all as a resource to easily build a docker image and create a container that contains a hot APRCoin wallet configured to run as a masternode, aprcoind uses Tor to connect to the network for privacy and anonymity. Tor is also contained within the container making this an all-in-one solution using s6-init to run multiple processes in the same container. The linkage bewtween aprcoind and the local Tor is configured on build of the image. All of the processes within the container have been set up to run as their proper non-privileged users. Tor runs as user debian-tor within the container and aprcoind runs as user aprcoin. The image is based on ubuntu 16.04 and the Dockerfile will pull this image as a base on build.

<b>NEED TO KNOW INFO TO BUILD:</b><br>
The Dockerfile is configured to use the docker COPY function to copy the blockchain into the image as a bootstrap. I am not able to upload the blockchain to be pulled from github due to filesize restrictions. As this is meant for a hot-cold setup I would suggest syncing your cold wallet on your local pc fully, once synced shutdown aprcoin-qt and sync the blocks, chainstate, and sporks directories to the root directory of the project. If you do not want to go through this you may comment out the three lines in the Dockerfile that deal with copying these 3 directories into the image and on start aprcoind will begin syncing the blockchain from scratch.

example directory structure once this project is pulled and the blockchain directories have been uploaded to the root directory of the project:<br>
<br>
$ ls                                                                                      
aprcoin.conf  blocks  chainstate  Dockerfile  services  sporks<br>

I will be adding a wrapper script to add aprcoin configuration options easily in the future. For the moment manually edit the aprcoin.conf file using a text editor. The configuration directives that need to be edited will be:

<b>rpcuser=</b><br>
<b>rpcpassword=</b><br>
<b>masternodeprivkey=</b><br>
<b>masternodeaddr=</b><br>
<b>torpassword=</b><br>

<b>rpcuser</b> can be any username<br>
<b>rpcpassword</b> can be any password<br>
<b>masternodeprivkey</b> will be the key you generate in your cold wallet debug console with the command "masternode genkey"<br>
<b>masternodeaddr</b> will be the ip address of your server<br>
torpassword is set to "privacyisimportant" and should be changed to whatever you change the Tor controller password to in the follwing step. Note that you can build and use as is, it has been configured to work but it is highly suggested that you take the time to edit the Dockerfile and aprcoin.conf changing the tor control password prior to build, or after build once the container is deployed. I have added the following instructions are in the Dockerfile to guide you:
     
#Hashed Password is "privacyisimportant" change this with tor --hash-password \<yournewpassword\><br>
#and use the ouput to replace the following in /etc/tor/torrc. Make sure to also update aprcoin.conf torpassword= with the<br>
#new password in plain text, not hashed.<br>
&&    echo "HashedControlPassword 16:308DF1B8630F039660304560615E238EC2F1E6A992BB94C67CE4CD60D5" >> /etc/tor/torrc \

build the image from the root directory with:<br>
sudo docker build -t apr-tor .

create the container to deploy with:<br>
sudo docker create --name apr-tor --restart=always -p 3134:3134 apr-tor:latest

start the container with:
sudo docker container start apr-tor

enter the container to perform changes of passwords with:
sudo docker exec -it -u 0 apr-tor bash

Make sure to allow port 3134/tcp in your hosts firewall(not within the container), this can usually be accomplished with:<br>
sudo ufw allow 3134/tcp<br>
<br>
<b>Relevant links:</b><br>
<b>S6-INIT:</b> https://skarnet.org/software/s6/ <br>
<b>Tor:</b> https://www.torproject.org/ <br>
<b>APRCoin:</b> https://apr-coin.com/ <br>
<b>Docker:</b> https://www.docker.com/ <br>
