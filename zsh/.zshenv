# This is always sourced -- https://unix.stackexchange.com/a/71258

# Order of execution:
# .zshenv
# .zprofile - for login shells
# .zshrc    - for interactive shells
# .zlogin   - for login shells

. "$HOME/.cargo/env"
ZDOTDIR="$HOME/.config/zsh"
