echo "loading .bash_profile"

export TERM=xterm-256color

if [ -x "$(command -v oh-my-posh)" ]; then
        eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/jandedobbeleer.omp.json)"
fi

if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

echo ".bash_profile loaded"

