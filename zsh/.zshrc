# Append to $PATH
path+=(
  "$HOME/.yarn/bin"
  "$HOME/.config/yarn/global/node_modules/.bin"
  "$HOME/.vimpkg/bin"
  "$HOME/repos/lua-language-server/bin/macOS"
  "$HOME/.local/bin"
  "$HOME/.local/n/bin"
  "/usr/local/opt/node@10/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
  "/usr/local/opt/ruby/bin"
)

# Exports
export LC_ALL=en_US.UTF-8
export ZSH="/Users/claudio/.oh-my-zsh"
export EDITOR='nvim'
export LSCOLORS="exfxcxdxbxegedabagacad"
export N_PREFIX="$HOME/.local/n"
export NVM_DIR="$HOME/.nvm"
export FIREFOX_BIN="/Applications/Firefox Developer Edition.app/Contents/MacOS/firefox"
export MANPAGER="sh -c 'col -bx | bat --color=always --decorations=always --style=grid --language=man'"
export AWS_PAGER="cat"
ZSH_THEME="claudio"
DISABLE_UPDATE_PROMPT="true"


plugins=(
  aws
)

function sourceIfExists {
  [[ -s $1 ]] && source $1
}
sourceIfExists "$ZSH/oh-my-zsh.sh"
sourceIfExists "/usr/local/share/zsh/site-functions/aws_zsh_completer.sh"
sourceIfExists "${HOME}/.iterm2_shell_integration.zsh"
sourceIfExists "$NVM_DIR/nvm.sh"
sourceIfExists "$NVM_DIR/bash_completion"
sourceIfExists "$HOME/.fzf.zsh"
sourceIfExists "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
sourceIfExists "/etc/grc.zsh" # Generic colorizer


# Aliases
alias ls="ls -lahFG"
alias cheat="$HOME/.local/bin/cht.sh"
alias gs="git s"
alias gss="git status"
alias gd="git diff"
alias ga="git add"
alias gcm="git commit -m"
alias gl="git log --reverse"
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

# print "Loaded zshrc"

