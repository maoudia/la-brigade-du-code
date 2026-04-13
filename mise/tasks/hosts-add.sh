#!/usr/bin/env sh
# mise/tasks/hosts-add.sh
# Add brigade.io to /etc/hosts for local production simulation
# Works on macOS, Linux, Windows (Git Bash / WSL)

HOSTS_FILE="/etc/hosts"
ENTRY="127.0.0.1 brigade.io"

# Windows paths
if [ -f "/mnt/c/Windows/System32/drivers/etc/hosts" ]; then
  HOSTS_FILE="/mnt/c/Windows/System32/drivers/etc/hosts"
elif [ -f "/c/Windows/System32/drivers/etc/hosts" ]; then
  HOSTS_FILE="/c/Windows/System32/drivers/etc/hosts"
fi

if grep -q "brigade.io" "$HOSTS_FILE" 2>/dev/null; then
  echo "brigade.io already in $HOSTS_FILE"
else
  echo "$ENTRY" | sudo tee -a "$HOSTS_FILE" > /dev/null
  echo "✓ Added: $ENTRY"
  echo "  File: $HOSTS_FILE"
fi
