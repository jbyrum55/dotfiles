#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

echo "Script is running without root privileges"

# Check and install bind-tools if not installed
if ! brew list bind &>/dev/null; then
    echo "Installing bind-tools..."
    brew install bind
else
    echo "bind-tools is already installed."
fi

# Check and install nmap if not installed
if ! brew list nmap &>/dev/null; then
    echo "Installing nmap..."
    brew install nmap
else
    echo "nmap is already installed."
fi

# Check and install anaconda if not installed
if ! brew list anaconda &>/dev/null; then
    echo "Installing anaconda..."
    # Replace this with the actual command to install Anaconda using Homebrew
    # Example: brew install anaconda
else
    echo "anaconda is already installed."
fi

# Check and install ninvaders if not installed
if ! brew list ninvaders &>/dev/null; then
    echo "Installing ninvaders..."
    brew install ninvaders
else
    echo "ninvaders is already installed."
fi

