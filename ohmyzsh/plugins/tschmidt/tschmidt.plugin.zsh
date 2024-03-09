c() { cd ~/code/$1; }
_c() { _files -W ~/code -/; }
compdef _c c

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function gbin {
  echo branch \($1\) has these commits and \($(parse_git_branch)\) does not
  git --no-pager log ..$1 --no-merges --format='%h | Author:%nan | Date:%ad | %s' --date=local $2
}

function gbout {
  echo branch \($parse_git_branch\) has these commits and \($1\) does not
  git --no-pager log $1.. --no-merges --format='%h | Author:%nan | Date:%ad | %s' --date=local $2
}

function dirtouch {
  mkdir -p "$(dirname $1)" && touch "$1"
}

alias ggpush='git push -u origin $(git_current_branch)'
alias main='git checkout main'
alias resource='source ~/.zshrc'
alias vim='nvim'

