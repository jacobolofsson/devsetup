echo "loading .bash_profile"

export TERM=xterm-256color

# Fuzzy completion/search
if [ -x "$(command -v fzf)" ]; then
        # TODO: upgrade to 0.48.0 or later
        # eval "$(fzf --bash)"
        source /usr/share/doc/fzf/examples/key-bindings.bash
fi

# Pretty shell prompt
if [ -x "$(command -v oh-my-posh)" ]; then
        eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/jandedobbeleer.omp.json)"
fi

if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

echo ".bash_profile loaded"


. "$HOME/.local/bin/env"
