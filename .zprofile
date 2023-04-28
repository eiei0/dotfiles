
eval "$(/opt/homebrew/bin/brew shellenv)"

export ZSH=~/.oh-my-zsh                                            # Path to oh-my-zsh installation
export ZSH_CUSTOM=~/.config/zsh/                                 # directory for zsh customizations
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"                              # add homebrew to PATH
export GPG_TTY=\$(tty)                                                           # Point GPG to TTY
export EDITOR='vim'                                                    # change shell editor to vim

# Ruby
export BUNDLER_EDITOR='vim'

# Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
