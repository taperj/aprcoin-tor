FROM ubuntu:16.04

RUN apt-get update \
	&&    apt-get install curl wget unzip -y \
	&&    curl --fail --silent -L https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz | tar xzvf - -C / \
	&&    apt-get install -y sudo libboost1.58 tor software-properties-common libzmq5 libminiupnpc10 libevent-pthreads-2.0-5 \
	&&    add-apt-repository -y ppa:bitcoin/bitcoin \
	&&    apt-get update \
	&&    apt-get install -y libdb4.8 libdb4.8++ \
	&&    mkdir -v /home/debian-tor \
	&&    chown -v debian-tor:debian-tor /home/debian-tor \
	&&    chmod -v 750 /home/debian-tor \
	&&    wget https://github.com/APRCoin/zenith-repository/releases/download/V3.1.0/aprcoin-v3.1.0-linux.zip \
	&&    unzip aprcoin-v3.1.0-linux.zip \
	&&    chmod 755 Ubuntu/aprcoin* \
	&&    mv -v Ubuntu/aprcoin* /usr/bin \
	&&    rm -vrf Ubuntu aprcoin-v3.1.0-linux.zip \
	&&    useradd -s /usr/sbin/nologin -m -d /home/aprcoin aprcoin \
	&&    export CONF_DIR=/home/aprcoin/.aprcoin \
	&&    mkdir -v $CONF_DIR \
	&&    chown -vR aprcoin:aprcoin $CONF_DIR \
	&&    echo "Setting up /etc/tor/torrc" \
	&&    echo "User debian-tor" >> /etc/tor/torrc \
	&&    echo "DataDirectory /home/debian-tor/.tor" >> /etc/tor/torrc \
	&&    echo "HiddenServiceDir /home/debian-tor/.torhiddenservice/" >> /etc/tor/torrc \
	&&    echo "HiddenServicePort 3134 127.0.0.1:3134" >> /etc/tor/torrc \
	# Hashed Password is "privacyisimportant" change this with tor --hash-password <yournewpassword> 
	# and use the ouput to replace the following in /etc/tor/torrc. Make sure to also update aprcoin.conf torpassword= with the 
        # new password in plain text, not hashed.
	&&    echo "HashedControlPassword 16:308DF1B8630F039660304560615E238EC2F1E6A992BB94C67CE4CD60D5" >> /etc/tor/torrc \
	&&    echo "ControlPort 9051" >> /etc/tor/torrc \
	&&    echo "Done." \
	&&    echo "This may take a moment..."

COPY ./services /etc/services.d/
##Comment out the next 3 lines if you are going to sync the blockchain from scratch. 
COPY --chown=aprcoin:aprcoin blocks /home/aprcoin/.aprcoin/blocks
COPY --chown=aprcoin:aprcoin chainstate /home/aprcoin/.aprcoin/chainstate
COPY --chown=aprcoin:aprcoin sporks /home/aprcoin/.aprcoin/sporks
##End blockchain section.
COPY --chown=aprcoin:aprcoin aprcoin.conf /home/aprcoin/.aprcoin/
ENTRYPOINT [ "/init" ]
