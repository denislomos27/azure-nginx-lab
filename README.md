Azure Nginx Lab

In acest mini-proiect, am creat o masina virtuala pe Linux (Ubuntu) in Azure, am instalat pachetul Nginx pentru a hosta un site web (doar fisier html) accesibil public.


Descriere

- Creează o VM Linux (Ubuntu) în Azure.
- Deschide portul 80 pentru trafic HTTP.
- Instalează Nginx ca server web.
- Servește o pagină HTML simplă.
- Leagă totul de GitHub pentru versionare și backup.
- Folosește Git via SSH din VM către GitHub.

---
Cerințe

- Cont Azure activ
- Masina virtuala Ubuntu creata în Azure
- Azure CLI sau acces SSH la VM.
- Cont GitHub.
- Git instalat în VM.
- serviciul nginx instalat

---

Comenzi rulate (pe VM)

--bash
 Instalare Git
sudo apt update
sudo apt install -y git

- Configurare Git
git config --global user.name "denislomos27"
git config --global user.email "denislomos27@github.com"

- Instalare Nginx
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

- Creare fisiere proiect
mkdir azure-nginx-lab
cd azure-nginx-lab
echo "<h1>Site-ul meu pe Azure</h1>" > index.html

- Initializare Git
git init
git add .
git commit -m "Initial commit - Nginx site"
