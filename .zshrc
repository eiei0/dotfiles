# ================= Appearance ====================================================================

ZSH_THEME="agnoster"                           # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ================= Configs =======================================================================

source $ZSH/oh-my-zsh.sh                                               # load main oh-my-zsh script

zstyle ':omz:update' mode auto                                # update automatically without asking
set -o vi                                                                  # enable vim keybindings

plugins=(git asdf)                                                  
