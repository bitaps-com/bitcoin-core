# bitcoin-core
Bitcoin core docker image
Bitcoin core server builds (no GUI, no wallet) 


Builds: bitcoin-core:latest - v0.17.1 bitcoin-core:v0.17.1

How to use:

Create persistent volume for blockchain

    $ docker volume create bitcoin-core-data

Create Dockerfile

    FROM bitaps/bitcoin-core:latest 
    RUN mkdir /data COPY bitcoin.conf . 
    ENTRYPOINT ["bitcoind", "-conf=/bitcoin.conf"]

Create bitcoin.conf file in same folder

    datadir=/data 
    server=1 
    upnp=1 
    listen=1 
    txindex=1 
    printtoconsole=1 
    maxconnections=100 
    upnp=1 
    externalip=SERVER_IP 
    bind=SERVER_IP:8333 
    rpcuser=USER_NAME 
    rpcpassword=PASSWORD 
    rpctimeout=30 
    rpcthreads=200 
    rpcallowip=RPC_ALLOWED_IP 
    rpcbind=SERVER_IP:8332 
    rpcbind=127.0.0.1:8332 
    maxorphantx=1000 
    maxmempool=500 
    zmqpubhashblock=tcp://SERVER_IP:8900 
    zmqpubrawtx=tcp://SERVER_IP:8900

Build docker image:

    $ docker build -t bitcoin-core-mainnet .

Start container with autostart

    $ docker run --name bitcoin-core-mainnet \
                 --net=host \
                 --restart=always \
                 -v bitcoin-core-data:/data \
                 -it bitcoin-core-mainnet
