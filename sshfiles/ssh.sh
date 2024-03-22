#!/bin/bash

SSH_FOLDER=~/.ssh
DOTFILES_FOLDER=~/dotfiles

ssh_setup() {
    # Check network connection
    if ! ping -c 1 fry.cs.wright.edu &> /dev/null; then
        echo "[ERROR] Not connected to WSU-Secure or Wright State VPN. Please connect before setting up SSH."
        exit 1
    fi

    # Check if ~/.ssh folder exists. If not, create it.
    if [ ! -d "$SSH_FOLDER" ]; then
        echo "[INFO] Creating SSH folder..."
        if ! mkdir -p "$SSH_FOLDER"; then
            echo "[ERROR] Unable to create SSH folder. Exiting."
            exit 1
        fi
    else
        echo "[INFO] SSH folder exists, continuing..."
    fi

    # Symbolically link authorized_keys
    ln -sf "$DOTFILES_FOLDER/authorized_keys" "$SSH_FOLDER/authorized_keys"

    # Create or update ~/.ssh/config file with an entry for fry.cs.wright.edu
    if [ ! -f "$SSH_FOLDER/config" ]; then
        echo -e "Host fry\n\tUser w695sxc\n\tHostName fry.cs.wright.edu\n\tPort 22" > "$SSH_FOLDER/config"
    else
        # Ensure entry doesn't already exist
        if ! grep -q "Host fry" "$SSH_FOLDER/config"; then
            echo -e "\nHost fry\n\tUser w695sxc\n\tHostName fry.cs.wright.edu\n\tPort 22" >> "$SSH_FOLDER/config"
        fi
    fi

    # Symbolically link config file
    ln -sf "$DOTFILES_FOLDER/config" "$SSH_FOLDER/config"

    echo "[INFO] SSH setup completed."
}

ssh_setup
