cd module
chmod +x build.sh
./build.sh
sudo apt install python3-pip
pip3 install --upgrade pip
pip3 install pyinstaller
PATH=$PATH:/home/$(whoami)/.local/lib/python3.10/site-packages
source /home/$(whoami)/.profile
pip install -r requirements.txt
cd..
wget https://go.dev/dl/go1.25.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.25.0.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source ~/.bashrc
go version
rm go1.25.0.linux-amd64.tar.gz
make init
pip install aiohttp
pip install js2py

curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

curl -fsSL https://get.pnpm.io/install.sh | sh -
source /home/$(whoami)/.bashrc

make build-pub
