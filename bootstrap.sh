#!/usr/bin/env bash

function _log {
    timestamp=$(date +"%Y-%m-%d %T")
    echo "$timestamp $0: $1"
}

if ! command -v brew &> /dev/null
then
    _log "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v python3 &> /dev/null
then
    _log "Installing Python 3"
    brew install python
fi

_log "Bootstrapping complete, setting up local config"

./install.py
