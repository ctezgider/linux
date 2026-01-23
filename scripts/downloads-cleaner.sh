#!/bin/bash
# organizes files in the Downloads folder
# by moving them into categorized subfolders

DIR="$HOME/Downloads"

mkdir -p "$DIR"/{PDF,Images,Archives,Videos,Audio,Others}

for file in "$DIR"/*; do
  [ -f "$file" ] || continue

  case "${file##*.}" in
    pdf)
      mv "$file" "$DIR/PDF/"
      ;;
    jpg|jpeg|png|gif)
      mv "$file" "$DIR/Images/"
      ;;
    zip|tar|gz|rar|7z)
      mv "$file" "$DIR/Archives/"
      ;;
    mp4|mkv|avi)
      mv "$file" "$DIR/Videos/"
      ;;
    mp3|wav|ogg)
      mv "$file" "$DIR/Audio/"
      ;;
    *)
      mv "$file" "$DIR/Others/"
      ;;
  esac
done

