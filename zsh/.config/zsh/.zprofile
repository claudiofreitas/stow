

function appendToPath {
  export PATH="$PATH:$1"
}
appendToPath "$HOME/.local/bin"

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
