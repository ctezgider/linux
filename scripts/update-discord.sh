#!/bin/bash
# updates discord from /Downloads

# ask sudo password
sudo -v || exit 1

cd "$HOME/Downloads" || exit 1

echo "Downloading discord update file..."

wget -O discord-latest.deb "https://discord.com/api/download?platform=linux&format=deb"

echo "Updating discord..."
sudo apt install -f ./discord-latest.deb

