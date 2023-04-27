# ================= Appearance ====================================================================

ZSH_THEME="agnoster"                           # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ================= Configs =======================================================================

export ZSH=~/.oh-my-zsh                                            # Path to oh-my-zsh installation
export GPG_TTY=\$(tty)                                                           # Point GPG to TTY
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh                                               # load main oh-my-zsh script

zstyle ':omz:update' mode auto                                # update automatically without asking
eval $(ssh-agent -s) > /dev/null                                    # start ssh-agent in background
set -o vi                                                                  # enable vim keybindings

plugins=(git asdf)                                                  
