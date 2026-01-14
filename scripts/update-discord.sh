#!/bin/bash
# updates discord from /Downloads

cd "$HOME/Downloads" || exit 1

# takes the last downloaded file
file="$(ls -t discord-*.deb | head -n 1)"

# print out the file name 
echo "installing file: $file"

# install package .deb
sudo apt install "./$file"
