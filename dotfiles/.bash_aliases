# ssh <> -t "/bin/bash -ic tsh"
alias tsh='tmux attach -t main || tmux new -s main'
