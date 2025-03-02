#!/bin/bash

RED="\e[31m"
GREEN="\e[1;32m"
BLUE="\e[1;34m"
MAGENTA="\e[35m"
INFO="${MAGENTA}[ INFO ]"
PROSES="${BLUE}[ PROSES ]"

logo() {
    echo -e "${RED}"
    echo " ######################################################### "
    echo " #                   INSTALL TOOLS CTFD                  # "
    echo " ######################################################### "
    echo " ███████ ███████ ███████ ██████  ███    ██ ███    ███ "
    echo "     ███ ██      ██      ██   ██ ████   ██ ████  ████ "
    echo "   ███   █████   █████   ██████  ██ ██  ██ ██ ████ ██ "
    echo " ███     ██      ██      ██   ██ ██  ██ ██ ██  ██  ██ "
    echo " ███████ ██      ███████ ██   ██ ██   ████ ██      ██ "
    echo -e "${RESET}"
    echo -e "${GREEN} Tools created by ZFERNM X META4SEC ${RESET}"
    echo ""
}

logo

echo -e "${GREEN}Welcome to the CTF Platform Installer${NC}"
echo "Pilih opsi instalasi:"
echo "1. Instalasi CTFd (Single VPS)"
echo "2. Instalasi Netcat (Double VPS)"
echo "3. Keluar"
read -p "Masukkan pilihan Anda (1/2/3): " pilihan

if [ "$pilihan" == "1" ]; then
    echo -e "${GREEN}Mulai instalasi CTFd...${NC}"
    
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt-get update
    
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
    echo -e "${GREEN}Verifikasi instalasi Docker:${NC}"
    docker version
    docker compose version
    
    echo -e "${GREEN}Mengunduh CTFd dan menjalankan Docker Compose...${NC}"
    git clone https://github.com/CTFd/CTFd.git
    cd CTFd
    docker compose up -d
    echo -e "${GREEN}CTFd telah berhasil diinstal. Akses di http://localhost:8000/${NC}"

elif [ "$pilihan" == "2" ]; then
    echo -e "${GREEN}Mulai instalasi Netcat...${NC}"
    
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt-get update
    
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
    echo -e "${GREEN}Verifikasi instalasi Docker:${NC}"
    docker version
    docker compose version
    echo -e "${GREEN}Netcat environment telah siap di VPS Anda.${NC}"

else
    echo -e "${GREEN}Keluar dari installer.${NC}"
fi
