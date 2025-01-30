#!/bin/sh

# Display emerge info
emerge --info

REPO_TIMESTAMP_FILE="/var/db/repos/gentoo/metadata/timestamp.chk"

if [ -f "$REPO_TIMESTAMP_FILE" ]; then
  LAST_SYNC_TIME=$(stat -c %Y "$REPO_TIMESTAMP_FILE")
  CURRENT_TIME=$(date +%s)
  TIME_DIFF=$((CURRENT_TIME - LAST_SYNC_TIME))

  # Define the threshold for considering a sync necessary (e.g., 1 day)
  SYNC_THRESHOLD=86400

  if [ "$TIME_DIFF" -gt "$SYNC_THRESHOLD" ]; then
    echo "Syncing database.."
    echo "Entering sudo environment:"
    sudo emerge --sync
  else
    echo "Repository was synced recently. No need to sync again."
  fi
else
  echo "Timestamp file not found. Syncing database..."
  echo "Entering sudo environment:"
  sudo emerge --sync
fi

# Proceed to update Discord if necessary
echo "Checking for Discord updates..."
sudo emerge -av1 "net-im/discord"

if equery list discord >/dev/null 2>&1; then
  echo "Discord was successfully emerged. Installing vencord now.."
  sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
else
  echo "Discord was not emerged. There may have been an error."
fi
