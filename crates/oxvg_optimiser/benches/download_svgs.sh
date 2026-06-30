#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

if ! command -v curl >/dev/null 2>&1; then
  echo "error: curl is required" >&2
  exit 1
fi

download() {
  url="$1"
  filename="${url##*/}"
  output="$SCRIPT_DIR/$filename"
  tmp="$output.tmp"

  echo "Downloading $filename"

  curl \
    --fail \
    --location \
    --silent \
    --show-error \
    --retry 3 \
    --connect-timeout 15 \
    --output "$tmp" \
    "$url"

  mv "$tmp" "$output"
}

download "https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/raw/main/backgrounds/blobs-d.svg"
download "https://archlinux.org/static/logos/archlinux-logo-dark-scalable.518881f04ca9.svg"
download "https://inkscape.org/gallery/item/39652/Inkscape_About_Screen_Isometric_madness_HdG4la4.svg"
download "https://github.com/tldr-pages/tldr/raw/refs/heads/main/images/banner.svg"
download "https://upload.wikimedia.org/wikipedia/en/8/80/Wikipedia-logo-v2.svg"
download "https://upload.wikimedia.org/wikipedia/commons/6/6c/Trajans-Column-lower-animated.svg"