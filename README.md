# Dotfiles

Portable macOS/Linux app configuration copied from `~/.config`.

Included: Fish, Git CLI, GitHub CLI, GitHub Copilot JetBrains instructions, Kitty, Neofetch, Neovim, OpenCode, Spotatui, tmux, Zed, and the portable portion of the Zsh configuration.

Run `./install.sh` after installing the apps you use. It creates absolute symlinks and refuses to replace any existing file or directory. Tmux is linked through `~/.tmux.conf` and `~/.tmux.conf.local`, which works on both macOS and Linux.

Authentication/session data, caches, package installs, the macOS-only Raycast state, Flutter tool state, and `tmux.bkp` were intentionally left out. OpenCode now expects `gitnexus` on `PATH` instead of a Mac-specific Node path.
