#!/usr/bin/env sh
# mise/tasks/hosts-remove.sh
# Remove brigade.io from /etc/hosts

HOSTS_FILE="/etc/hosts"

# Windows paths
if [ -f "/mnt/c/Windows/System32/drivers/etc/hosts" ]; then
  HOSTS_FILE="/mnt/c/Windows/System32/drivers/etc/hosts"
elif [ -f "/c/Windows/System32/drivers/etc/hosts" ]; then
  HOSTS_FILE="/c/Windows/System32/drivers/etc/hosts"
fi

if ! grep -q "brigade.io" "$HOSTS_FILE" 2>/dev/null; then
  echo "brigade.io not found in $HOSTS_FILE — nothing to do"
  exit 0
fi

# macOS needs -i '' , Linux needs -i only
if [ "$(uname)" = "Darwin" ]; then
  sudo sed -i '' '/brigade.io/d' "$HOSTS_FILE"
else
  sudo sed -i '/brigade.io/d' "$HOSTS_FILE"
fi

echo "✓ Removed brigade.io from $HOSTS_FILE"
