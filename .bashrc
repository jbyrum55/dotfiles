#!/bin/bash

# Check if running as root
if [[ "$(id -u)" -eq 0 ]]; then
    echo "Script is running as root, please run as a regular user" 1>&2
    exit 1
fi

# Install any additional packages required for bashrc configurations
# (if needed)

# Create .bashrc with aliases and configurations
cat << 'EOF' > ~/.bashrc
# Two useful aliases
alias cls='clear'
alias ll='ls -alF'

# Awesome bash aliases
# Add your awesome bash aliases here

# 30 okay aliases
# Add your okay aliases here

# 70 more aliases
# Add your more aliases here

# Grab something cool from The Ultimate B.A. .bashrc file
# Add cool configurations from The Ultimate B.A. .bashrc file here

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
EOF

# Copy .bashrc to the Git repository
cp ~/.bashrc /path/to/dotfiles/.bashrc

# Symbolic link .bashrc to the user's home directory
ln -sf /path/to/dotfiles/.bashrc ~/.bashrc

echo "Bashrc configuration completed."

