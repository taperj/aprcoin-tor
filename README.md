# aprcoin-tor
docker container: aprcoin masternode with tor

Description and purpose:
This repository is my personal contribution to all as a resource to easily build a docker image and create a container that contains a hot APRCoin wallet configured to run as a masternode, aprcoind uses Tor to connect to the network for privacy and anonymity. Tor is also contained within the container making this an all-in-one solution using s6-init to run multiple processes in the same container. The linkage bewtween aprcoind and the local Tor is configured on build of the image. All of the processes within the container have been set up to run as their proper non-privileged users. Tor runs as user debian-tor within the container and aprcoind runs as user aprcoin. The image is based on ubuntu 16.04 and the Dockerfile will pull this image as a base on build.

Relevant links:
S6-INIT: https://skarnet.org/software/s6/
Tor: https://www.torproject.org/
APRCoin: https://apr-coin.com/
Docker: https://www.docker.com/
