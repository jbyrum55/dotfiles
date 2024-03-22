# ChatGPT and Class Resources
import os

def add_aliases():
    return '''
# Aliases
alias c="clear"
alias cl="clear"
alias ckear="clear"
alias clr="clear"
alias .="cd .."
'''

def set_prompt_color():
    return '''
# Set prompt color
PS1='\\[\\e[0;32m\\]\\u\\[\\e[0m\\]\\[\\e[0;32m\\]@\\h\\[\\e[0m\\]:\\[\\e[0;34m\\]\\w\\[\\e[0m\\]\\$ '
'''

def set_ls_colors():
    return '''
# Set LS_COLORS
eval "$(dircolors -b)"
export LS_COLORS='di=34:'$LS_COLORS
alias ls='ls --color=auto'
'''

def replace_dir_color():
    return '''
# Replace the directory color in PS1
BLUE="\\[\\033[0;34m\\]"
PS1="${PS1//\\[\\e[0;34m\\]/$BLUE}"
'''

def append_to_bashrc(content):
    home_dir = os.path.expanduser("~")
    bashrc_path = os.path.join(home_dir, ".bashrc")
    with open(bashrc_path, "a") as bashrc_file:
        bashrc_file.write(content)

def setup_bashrc():
    content = add_aliases() + set_prompt_color() + set_ls_colors() + replace_dir_color()
    append_to_bashrc(content)
    print("Content added to .bashrc file.")
    print(".bashrc successfully setup!")

# Call the function to setup .bashrc
setup_bashrc()

