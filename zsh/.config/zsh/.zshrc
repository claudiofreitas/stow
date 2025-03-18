# set -x

# Zsh Options
setopt BEEP # activates beep when error (autocomplete fails, etc)
# current BEEP sound on MacOs: "Jump"

# Let me tab-complete for directories starting with dot
# Eg.: cd stow/zsh/.<TAB> -> cd stow/zsh/.config
# https://zsh-manual.netlify.app/options#1623-expansion-and-globbing
setopt GLOBDOTS

# Better help
unalias run-help
autoload run-help
alias help="run-help"

# It seems this is not the correct place to add Nix stuff, but on /etc/zshrc (https://github.com/NixOS/nix/issues/3616)
# https://github.com/NixOS/nix/issues/3616#issuecomment-1655785404
# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  if [ "$(uname)" = "Darwin" ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  fi
fi
# End Nix

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
prependToPath "/opt/homebrew/bin"
prependToPath "/opt/homebrew/opt/jpeg/bin"
prependToPath "/opt/homebrew/opt/libpq/bin"

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
appendToPath "$HOME/.npm-global/bin"
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
export MANROFFOPT="-c"
export AWS_PAGER="cat"
export GPG_TTY=$(tty)
export LG_CONFIG_FILE="$HOME/.config/lazygit/config.yaml"
ZSH_THEME="claudio"
DISABLE_UPDATE_PROMPT="true"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export DIRENV_LOG_FORMAT=$'\033[2mdirenv: %s\033[0m'

# ----- Configure HISTORY - https://zsh-manual.netlify.app/options#1624-history
# https://zsh-manual.netlify.app/parameters?highlight=HISTFILE#156-parameters-used-by-the-shell
export HISTFILE="$HOME/.config/zsh/.zsh_history"

# https://zsh-manual.netlify.app/parameters?highlight=HISTSIZE#156-parameters-used-by-the-shell
export HISTSIZE=100000

# https://zsh-manual.netlify.app/parameters?highlight=SAVEHIST#156-parameters-used-by-the-shell
export SAVEHIST=100000

# https://zsh-manual.netlify.app/options?highlight=inc_append_history#1624-history
setopt inc_append_history
# -----------------------------------------------------------------------------

# Disable analytics for Homebrew
export HOMEBREW_NO_ANALYTICS=1

# Disable telemetry for dotnet
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Disable telemetry for Next.js
export NEXT_TELEMETRY_DISABLED=1

plugins=(
  aws
)

function sourceIfExists {
	# local debugNotFound=1
  if [[ -s $1 ]]; then
		source $1
	else
		if [[ $debugNotFound = 1 ]]; then
			echo "$1 not found"
		fi
	fi
}

# sourceIfExists "$ZSH/oh-my-zsh.sh"
# Ref.: https://github.com/wincent/wincent/blob/be7fde5bf2/aspects/dotfiles/files/.zshrc#L185
# On pressing up or down with a word inserted, display history items that starts with that word
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
if [ "$(uname)" = "Darwin" ]; then
	bindkey "^[[A" up-line-or-beginning-search # Up
	bindkey "^[[B" down-line-or-beginning-search # Down
else
	bindkey "$key[Up]" up-line-or-beginning-search # Up
	bindkey "$key[Down]" down-line-or-beginning-search # Down
fi

# autoload: https://zsh-manual.netlify.app/functions?highlight=autoload#91-autoloading-functions
autoload -U compinit
# compinit: https://zsh-manual.netlify.app/completion-system?highlight=compinit#2021-use-of-compinit
compinit -d "$HOME/.cache/zsh/zcompdump-$ZSH_VERSION"

# aws_zsh_completer raises warnings when I disable oh-my-zsh
# sourceIfExists "/usr/local/share/zsh/site-functions/aws_zsh_completer.sh"
sourceIfExists "$NVM_DIR/bash_completion"
sourceIfExists "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # MacOS
sourceIfExists "$HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" # NixOS
sourceIfExists "$ZDOTDIR/extras/grc.zsh" # Generic colorizer
sourceIfExists "$HOME/.cargo/env"
eval "$(fzf --zsh)"

# Aliases
alias ls="ls -lahFG"
alias cheat="$HOME/.local/bin/cht.sh"
alias gs="git s"
alias gss="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gcm="git commit -m"
alias gl="source $HOME/.local/bin/pretty_git_log.bash && pretty_git_log"
alias v="nvim"
alias tempo="curl 'wttr.in/Koto?format=\"%l++%c++%t++%w++%p\"'"
alias ls="exa --long --header --git --links --time-style=long-iso --icons -a"
alias luamake="$HOME/repos/lua-language-server/3rd/luamake/luamake"
alias dirsize="du -sh * 2> /dev/null | gsort -h"
alias tmuxconf="$EDITOR $HOME/.tmux.conf"
alias zshrc="$EDITOR $HOME/.config/zsh/.zshrc"
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
alias neovide="/Applications/neovide.app/Contents/MacOS/neovide"
alias tn="tmux-nav.sh"
alias i3config="$EDITOR $HOME/.config/i3/config"
alias Sway="sway --config $HOME/.config/sway/config"
alias fd="fd --hidden --follow"

if [ -x "/Users/claudio/Downloads/nvim-macos-arm64/bin/nvim" ]; then
  # Temporary, while nvim in work computer is bad
	alias nvim="/Users/claudio/Downloads/nvim-macos-arm64/bin/nvim"
elif [ -x "/Users/claudio/.nix-profile/bin/nvim" ]; then
	alias nvim="/Users/claudio/.nix-profile/bin/nvim"
# else
	# Do not alias it
	# echo "No valid 'nvim' found in specified paths."
fi

gr() {
	cd $(git rev-parse --show-toplevel)
}

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

ghpoi-safe() {
	gh poi --dry-run;
	selectedOption=$(printf "No\nYes" | fzf --prompt "Run again without --dry-run? "  --height=4 --no-sort --reverse)
	if [ "${selectedOption:-}" = "Yes" ]; then
		gh poi;
	fi
}

vv() {
  # Assumes all configs exist in directories named ~/.config/nvim-*
  local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)
 
  # If I exit fzf without selecting a config, don't open Neovim
  [[ -z $config ]] && echo "No config selected" && return
 
  # Open Neovim with the selected config
  NVIM_APPNAME=$(basename $config) nvim $@
}

function take() {
	mkdir -p $@ && cd ${@:$#}
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/.local/bin/terraform terraform

# Config rbenv
if which rbenv > /dev/null; then
	eval "$(rbenv init -)"; 
fi

# Config bun
export BUN_INSTALL="$HOME/.bun"
prependToPath "$BUN_INSTALL/bin"

# Config pyenv
if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Config nvm
export NVM_DIR="$HOME/.nvm"
sourceIfExists "$NVM_DIR/nvm.sh"
sourceIfExists "$NVM_DIR/bash_completion"

# Config pnpm
export PNPM_HOME="/Users/claudio/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# TODO: maybe organize all brew related code under a single place with an IF
if [[ -s /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Config starship (should be at the end of the .zshrc)
eval "$(starship init zsh)"

# GTK_THEME=Adwaita-dark

function isBinInPath {
	builtin whence -p "$1" &> /dev/null
}

if isBinInPath direnv; then
	eval "$(direnv hook zsh)"
fi

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && [ "$(uname)" = "Linux" ]; then
	exec ~/startGnome;
fi
