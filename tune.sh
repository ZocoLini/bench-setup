#!/bin/bash

# If not root exit
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

if [ ! -d ".venv" ]; then
    if ! python3 -m venv .venv; then
        echo "Error creating python virtual environment. Install python3-venv."
        exit 1
    fi
    
    source .venv/bin/activate
    pip install --upgrade pip
    pip install matplotlib
    pip install pyperf
fi

./.venv/bin/pyperf system tune
