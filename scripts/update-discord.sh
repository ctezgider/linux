#!/bin/bash
# Starts & checks for Discord updates. If there is a new .deb file,
# installs it and launches discord.

set -e

TMP_DIR="/tmp"
DEB_FILE="$TMP_DIR/discord-latest.deb"
URL="https://discord.com/api/download?platform=linux&format=deb"

sudo -v || exit 1

echo "Checking for Discord update..."


SIZE=$(wget --spider --server-response "$URL" 2>&1 \
	| awk '/Content-Length/ {print $2}'| tail -n1)

if [[ -n "$SIZE" ]]; then
	SIZE_MB=$(echo "scale=2; $SIZE/1024/1024" | bc)
	echo "Found update: ${SIZE_MB} MB"

	read -rp "Want to update Discord? [y/N]: " answer
	case "$answer" in
		y|Y|yes|YES)
			echo "Downloading update..."
			cd "$TMP_DIR"
			wget -O discord-lastest.deb "$URL"

			echo "Installing update..."
			sudo apt install -y ./discord-latest.deb
			rm -f discord-lastest.deb
			;;
		*)
			echo "Skipping update."
			;;
	esac
else
	echo "No update information found."
fi

echo "Starting Discord..."
exec /usr/bin/discord
