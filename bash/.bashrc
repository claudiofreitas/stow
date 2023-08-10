[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Disable deprecation warning on MacOS about bash
export BASH_SILENCE_DEPRECATION_WARNING=1

eval "$(starship init bash)"

complete -C /Users/claudio/.local/bin/terraform terraform

. "$HOME/.cargo/env"
