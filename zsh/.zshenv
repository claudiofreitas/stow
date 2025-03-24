# This is always sourced -- https://unix.stackexchange.com/a/71258

# echo "Loading .zshenv"

# Order of execution:
# .zshenv
# .zprofile - for login shells
# .zshrc    - for interactive shells
# .zlogin   - for login shells

ZDOTDIR="$HOME/.config/zsh"
# [[ "$(tty)" == "/dev/tty1" ]] && exec ~/startGnome;
