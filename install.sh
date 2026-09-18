#!/bin/sh
set -eu

# Usage: sh install.sh [pets-directory]
# Use bundled assets when run from a clone; otherwise download from GitHub.
pet_root=${1:-${CODEX_HOME:-"$HOME/.codex"}/pets}
script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
temp_dir=$(mktemp -d)
trap 'rm -rf "$temp_dir"' EXIT HUP INT TERM

if [ -f "$script_dir/blue-whale/pet.json" ] && [ -f "$script_dir/blue-whale/spritesheet.webp" ]; then
  source_dir=$script_dir/blue-whale
else
  command -v curl >/dev/null 2>&1 || { echo '需要 curl。' >&2; exit 1; }
  command -v unzip >/dev/null 2>&1 || { echo '需要 unzip。' >&2; exit 1; }
  curl --fail --location --retry 3 --connect-timeout 15 \
    https://raw.githubusercontent.com/mengmengjiang1999/blue-whale-pet/main/blue-whale-pet.zip \
    --output "$temp_dir/pet.zip"
  unzip -q "$temp_dir/pet.zip" -d "$temp_dir/package"
  source_dir=$temp_dir/package/blue-whale
fi

test -s "$source_dir/pet.json"
test -s "$source_dir/spritesheet.webp"
mkdir -p "$pet_root"
if [ -e "$pet_root/blue-whale" ] || [ -L "$pet_root/blue-whale" ]; then
  backup_dir=$(mktemp -d "$pet_root/blue-whale-backup-XXXXXXXX")
  mv "$pet_root/blue-whale" "$backup_dir/previous"
  printf '旧版本已备份到：%s/previous\n' "$backup_dir"
fi
mkdir -p "$pet_root/blue-whale"
cp "$source_dir/pet.json" "$source_dir/spritesheet.webp" "$pet_root/blue-whale/"
printf '已安装到：%s/blue-whale\n请在 Codex 宠物设置中刷新并选择「蓝色大肥鱼」。\n' "$pet_root"
