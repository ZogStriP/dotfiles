# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# COMPLETION
autoload -U compinit && compinit

# PROMPT
git_branch() {
  branch=$(git symbolic-ref -q HEAD 2> /dev/null) || return
  echo " (%F{yellow}${branch#refs/heads/}%f)"
}

precmd() {
  PROMPT="%B%F{cyan}%~%f%b$(git_branch) → "
}

# PATH
PATH=/usr/local/bin:$PATH # homebrew
PATH=$PATH:$HOME/.rvm/bin # rvm

