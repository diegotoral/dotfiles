# Diego Toral's zsh configuration.
# ================================

# Zsh configuration
# -----------------

# Update zsh every 13 days.
export UPDATE_ZSH_DAYS=13

# Path to your oh-my-zsh installation.
export ZSH="/home/diegotoral/.oh-my-zsh"

ZSH_THEME="avit"

# Use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Add some plugins.
plugins=(git bundler)

source $ZSH/oh-my-zsh.sh

# User configuration
# ------------------

# Load dotfiles.
source $HOME/.exports
source $HOME/.aliases
source $HOME/.functions

PATH=$PATH:$HOME/.bin

