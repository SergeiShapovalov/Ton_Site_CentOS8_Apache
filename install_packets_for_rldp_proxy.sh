!/bin/bash



 #Создаём раздел подкачки (иначе не на всех серверах запустится tonlib-cli)
mkdir -p /var/cache/swap/
dd if=/dev/zero of=/var/cache/swap/swap0 bs=64M count=64
chmod 0600 /var/cache/swap/swap0
mkswap /var/cache/swap/swap0
swapon /var/cache/swap/swap0
swapon -s

cd /root
mkdir TON
cd TON
dnf update -y
sudo dnf install epel-release -y
sudo dnf update -y
sudo dnf install libmicrohttpd -y
sudo sudo dnf install gperf -y
sudo dnf install -y gcc gcc-c++ make openssl-devel zlib-devel readline-devel wget cmake 
wget https://github.com/ccache/ccache/releases/download/v3.7.12/ccache-3.7.12.tar.xz
tar -xf ccache-3.7.12.tar.xz
cd ccache-3.7.12
./configure
make
sudo make install
cd ..
git clone --recurse-submodules https://github.com/ton-blockchain/ton.git
mkdir build
cd build
cmake ../ton
wget https://ton-blockchain.github.io/global.config.json
cmake --build . --target lite-client
cmake --build . --target func
cmake --build . --target fift
cmake --build . --target tonlib-cli
cmake --build . --target rldp-http-proxy
cmake --build . --target generate-random-id


