print_status() {
  local STATUS
  STATUS=$(git --work-tree=/Users/claudio/stow status --porcelain --ignore-submodules 2> /dev/null | tail -n1)
  if [[ -n $STATUS ]]
  then
    echo '#[fg=#282c34,bg=#e06c75] Stow:  '
  else
    echo '#[fg=#282c34,bg=#98c379] Stow:  '
  fi
}

print_status

#set -g @online_icon  "#[fg=#282c34,bg=#98c379]"
#set -g @offline_icon "#[fg=#282c34,bg=#e06c75]"

