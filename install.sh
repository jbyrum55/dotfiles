#!/bin/bash

# Check if running as root
if [[ "$(id -u)" -eq 0 ]]; then
    echo "Script is running as root"
    
    # Update repositories
    apt update
    
    # Check if apt is available
    if [[ -n "$(which apt)" ]]; then
        echo "apt is available"
        
        # Check and install bind-tools if not installed
        if ! dpkg -s bind9utils &> /dev/null; then
            echo "Installing bind-tools..."
            apt install -y bind9utils
        else
            echo "bind-tools is already installed."
        fi

        # Check and install nmap if not installed
        if ! dpkg -s nmap &> /dev/null; then
            echo "Installing nmap..."
            apt install -y nmap
        else
            echo "nmap is already installed."
        fi

        # Check and install ninvaders if not installed
        if ! dpkg -s ninvaders &> /dev/null; then
            echo "Installing ninvaders..."
            apt install -y ninvaders
        else
            echo "ninvaders is already installed."
        fi
        
        # Anaconda installation - replace with appropriate command
        # Check if anaconda is installed
        if ! command -v anaconda &> /dev/null; then
            echo "Anaconda is not installed, installing..."
            # Insert the command to install Anaconda here
        else
            echo "Anaconda is already installed."
        fi
        
        # Cleanup
        apt autoremove -y
        apt autoclean
    else
        echo "apt is not installed at the specified location."
    fi
else
    echo "Script is not running as root, executing non-sudo commands..."
    
    # Execute non-sudo commands
    
    non_sudo() {
        bash ~/dotfiles/gitfiles/.gitsetup
        bash ~/dotfiles/sshfiles/ssh.sh
        bash ~/dotfiles/AWSSetup
        bash ~/dotfiles/vimrc
        bash ~/dotfiles/.bashrc
    }

    # Call the non-sudo function
    non_sudo
fi

