#!/bin/bash
# Code snippets from ChatGpt
if [[ "$(id -u)" -eq 0 ]]; then
	echo "Script is running as root"
	# check if brew is package manager
	# if apt is package manager and you run which apt it will specify a path to where its stored
	echo $(which apt)
	if [[ -n "$(which brew)" ]]; then
		echo "brew is available"
		# Check and install bind-tools if not installed
		if ! dpkg -s bind9utils &> /dev/null; then
			echo "Installing bind-tools..."
			brew install -y bind9utils
		else
			echo "bind-tools is already installed."
		fi

		# Check and install nmap if not installed
		if ! dpkg -s nmap &> /dev/null; then
			echo "Installing nmap..."
			brew install -y nmap
		else
			echo "nmap is already installed."
		fi

		# Check and install anaconda if not installed
		# Note: Please replace the placeholder with the actual installation command for anaconda
		if ! dpkg -s anaconda &> /dev/null; then
			echo "Installing anaconda..."
			# Replace this with the actual command to install Anaconda
			# Example: apt install -y anaconda
		else
			echo "anaconda is already installed."
		fi

		# Check and install ninvaders if not installed
		if ! dpkg -s ninvaders &> /dev/null; then
			echo "Installing ninvaders..."
			brew install -y ninvaders
		else
			echo "ninvaders is already installed."
		fi
	else
		echo "brew is not installed at the specified location."
	fi
		# install packages with brew
else
	echo "Script is not running as root, exiting..." 1>&2
	exit 1
fi

