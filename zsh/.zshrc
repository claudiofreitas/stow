function prependToPath {
  export PATH="$1:$PATH"
}

function appendToPath {
  export PATH="$PATH:$1"
}

# Prepending to PATH has more importance than appending
prependToPath "/usr/local/opt/ruby/bin"
prependToPath "$HOME/.local/n/bin"
prependToPath "$HOME/.yarn/bin"

# Appending to PATH
appendToPath "$HOME/.config/yarn/global/node_modules/.bin"
appendToPath "$HOME/.vimpkg/bin"
appendToPath "$HOME/repos/lua-language-server/bin/macOS"
appendToPath "$HOME/.local/bin"
appendToPath "/usr/local/opt/node@10/bin"
appendToPath "/usr/local/bin"
appendToPath "/usr/local/sbin"
appendToPath "/usr/bin"
appendToPath "/bin"
appendToPath "/usr/sbin"
appendToPath "/sbin"
appendToPath "/usr/local/opt/ruby/bin"
appendToPath "/usr/local/go/bin"
# Rancher (Docker)
appendToPath "$HOME/.rd/bin"

# Exports
export LC_ALL=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export LSCOLORS="exfxcxdxbxegedabagacad"
export N_PREFIX="$HOME/.local/n"
export NVM_DIR="$HOME/.nvm"
export FIREFOX_BIN="/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox"
export MANPAGER="sh -c 'col -bx | bat --color=always --decorations=always --style=grid --language=man'"
export AWS_PAGER="cat"
export GPG_TTY=$(tty)
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yaml"
ZSH_THEME="claudio"
DISABLE_UPDATE_PROMPT="true"

# Disable telemetry for dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Disable telemetry for Next.js
export NEXT_TELEMETRY_DISABLED=1

plugins=(
  aws
)

function sourceIfExists {
  [[ -s $1 ]] && source $1
}
sourceIfExists "$ZSH/oh-my-zsh.sh"
sourceIfExists "/usr/local/share/zsh/site-functions/aws_zsh_completer.sh"
sourceIfExists "${HOME}/.iterm2_shell_integration.zsh"
sourceIfExists "$NVM_DIR/bash_completion"
sourceIfExists "$HOME/.fzf.zsh"
sourceIfExists "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
sourceIfExists "/etc/grc.zsh" # Generic colorizer
sourceIfExists "$HOME/.bun/_bun" # bun completions

# Aliases
alias ls="ls -lahFG"
alias cheat="$HOME/.local/bin/cht.sh"
alias gs="git s"
alias gss="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gcm="git commit -m"
# alias gl="git log --pretty=format:'%C(blue)%h%C(red)%d %C(white)%s - %C(cyan)%cn, %C(green)%cr'"
alias gl="source $HOME/.local/bin/pretty_git_log.bash && pretty_git_log"
alias v="nvim"
alias tempo="curl 'wttr.in/Koto?format=\"%l++%c++%t++%w++%p\"'"
alias ls="exa --long --header --git --links --time-style=long-iso --icons -a"
alias luamake="$HOME/repos/lua-language-server/3rd/luamake/luamake"
alias dirsize="du -sh * 2> /dev/null | gsort -h"
alias tmuxconf="$EDITOR $HOME/.tmux.conf"
alias zshrc="$EDITOR $HOME/.zshrc"
alias yabairc="$EDITOR $HOME/stow/yabai/.config/yabai/yabairc"
alias skhdrc="$EDITOR $HOME/stow/skhd/.config/skhd/skhdrc"
alias kittyconf="$EDITOR $HOME/stow/kitty/.config/kitty/kitty.conf"
alias vimrc="$EDITOR $HOME/stow/nvim/.config/nvim/init.lua"
alias hammerspoonrc="$EDITOR $HOME/stow/hammerspoon/.hammerspoon/init.lua"
alias hsrc="hammerspoonrc"
alias tf="terraform"
alias lg="lazygit"
alias yd="yarn dev"
alias ys="yarn start"
alias pn="pnpm"

fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

pr() {
  gh pr view --web || gh pr create --web
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/.local/bin/terraform terraform

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# bun
export BUN_INSTALL="$HOME/.bun"
prependToPath "$BUN_INSTALL/bin"

# TODO: organize this part -- config for pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

