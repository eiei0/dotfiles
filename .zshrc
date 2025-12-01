# ================= Appearance ====================================================================

ZSH_THEME="agnoster"                           # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ================= Golang ========================================================================

GOPRIVATE="github.com/myprizepicks/*"          # Set GOPRIVATE to allow go get private repos

# ================= PrizePicks ====================================================================
export KUBESEAL_CONFIG_DIR="$HOME/code/prizepicks/kubeseal-config"
export GITOPS_TOOLS_DIR="$HOME/code/prizepicks/gitops-tools"
# ================= Configs =======================================================================

source $ZSH/oh-my-zsh.sh                                               # load main oh-my-zsh script
eval $(export GPG_TTY=$(tty))                                                    # Point GPG to TTY

zstyle ':omz:update' mode auto                                # update automatically without asking
set -o vi                                                                  # enable vim keybindings

plugins=(git asdf)

eval "$(direnv hook zsh)"                                     # load direnv
