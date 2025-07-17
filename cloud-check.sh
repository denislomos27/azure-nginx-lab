#!/bin/bash

echo "===== Cloud Health Check ====="
echo "Data: $(date)"
echo ""

# 1. Verifică starea serviciului Nginx
echo "[+] Verificare serviciu nginx:"
systemctl is-active --quiet nginx && echo "Nginx este activ" || echo "Nginx NU rulează"
echo ""

# 2. Spațiu pe disc
echo "[+] Spațiu pe disc:"
df -h /
echo ""

# 3. Portul 80 deschis
echo "[+] Verificare port 80:"
ss -tuln | grep ':80' && echo "Portul 80 este deschis" || echo "Portul 80 NU este ascultat"
echo ""

# 4. Test disponibilitate site
echo "[+] Testare răspuns site (localhost):"
curl -I http://localhost 2>/dev/null | head -n 1
echo ""

# 5. Salvare într-un fișier log (opțional)
echo "=== Salvare log în ~/cloud-status.log ==="
{
  echo "[$(date)]"
  systemctl is-active nginx
  df -h /
  ss -tuln | grep ':80'
  curl -I http://localhost 2>/dev/null | head -n 1
  echo "-------------------------------"
} >> ~/cloud-status.log

echo "✅ Script rulat cu succes."
