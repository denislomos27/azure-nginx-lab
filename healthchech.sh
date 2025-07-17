#!/bin/bash

echo "=== 🔧 Cloud Operations Engineer - Quick Health Check ==="
echo ""

# 1. Uptime
echo "⏱️  System uptime:"
uptime
echo ""

# 2. Disk usage
echo "💽 Disk usage (/ partition):"
df -h /
echo ""

# 3. Port 80 status
echo "🌐 Port 80 (HTTP) status:"
if ss -tuln | grep -q ':80'; then
  echo "✅ Port 80 is open and listening."
else
  echo "❌ Port 80 is not open!"
fi
echo ""

# 4. CPU & RAM usage
echo "📊 CPU and RAM usage:"
top -bn1 | head -n 5
echo ""

# 5. Check sudo access
echo "🔐 Checking if current user can use sudo:"
if sudo -n true 2>/dev/null; then
  echo "✅ User has sudo access."
else
  echo "❌ User does NOT have sudo access."
fi
echo ""

# 6. Nginx service status (if installed)
echo "🧪 Nginx service status:"
if systemctl list-unit-files | grep -q nginx; then
  systemctl is-active --quiet nginx && echo "✅ Nginx is running." || echo "❌ Nginx is NOT running."
else
  echo "ℹ️  Nginx is not installed."
fi

echo ""
echo "=== ✅ Health check complete ==="

