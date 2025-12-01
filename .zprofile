
eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH=~/.oh-my-zsh                                            # Path to oh-my-zsh installation
export ZSH_CUSTOM=~/.config/zsh/                                 # directory for zsh customizations
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"                              # add homebrew to PATH
export EDITOR='vim'                                                    # change shell editor to vim

# Ruby
export BUNDLER_EDITOR='vim'

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Tmux
export TERM="screen-256color" # Tmux 256 color forcing
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
