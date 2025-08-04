# 한국시간 설정
sudo timedatectl set-timezone Asia/Seoul

# 스왑 8G
sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab

# 리눅스 업데이트 & 업그레이드
echo "tzdata tzdata/Areas select Asia" | sudo debconf-set-selections
echo "tzdata tzdata/Zones/Asia select Beirut" | sudo debconf-set-selections
sudo apt-get -y install debconf-utils
sudo debconf-set-selections <<< 'debconf debconf/frontend select Noninteractive'
export DEBIAN_FRONTEND=noninteractive
sudo apt-get update
sudo apt-get -y -o Dpkg::Options::="--force-confdef" \
                -o Dpkg::Options::="--force-confold" \
                upgrade -y

# 도커&도커컴포즈 설치
sudo groupadd docker
sudo usermod -aG docker $(whoami)
sudo apt update && sudo apt install -y nano curl apt-transport-https ca-certificates gnupg software-properties-common && sudo mkdir -p /etc/apt/keyrings && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo chmod 666 /var/run/docker.sock

# 오라클 OCI-CLI 설치
docker pull ghcr.io/oracle/oci-cli:latest

# 쉘스크립트 삭제
rm pb
