#!/bin/sh
set -eu

repo=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
config_home=${XDG_CONFIG_HOME:-"$HOME/.config"}
failed=0

check_link() {
  source=$1 target=$2
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    return
  fi
  if [ -e "$target" ] || [ -L "$target" ]; then
    printf 'exists (not changed): %s\n' "$target" >&2
    failed=1
  fi
}

link() {
  source=$1 target=$2
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    printf 'already linked: %s\n' "$target"
    return
  fi
  mkdir -p "$(dirname "$target")"
  ln -s "$source" "$target"
  printf 'linked: %s\n' "$target"
}

for app in fish gh git github-copilot kitty neofetch nvim opencode spotatui zed; do
  check_link "$repo/config/$app" "$config_home/$app"
done
check_link "$repo/config/tmux/oh-my-tmux/.tmux.conf" "$HOME/.tmux.conf"
check_link "$repo/config/tmux/tmux.conf.local" "$HOME/.tmux.conf.local"
check_link "$repo/config/zsh/.zshrc" "$HOME/.zshrc"

[ "$failed" -eq 0 ] || exit 1

for app in fish gh git github-copilot kitty neofetch nvim opencode spotatui zed; do
  link "$repo/config/$app" "$config_home/$app"
done
link "$repo/config/tmux/oh-my-tmux/.tmux.conf" "$HOME/.tmux.conf"
link "$repo/config/tmux/tmux.conf.local" "$HOME/.tmux.conf.local"
link "$repo/config/zsh/.zshrc" "$HOME/.zshrc"
