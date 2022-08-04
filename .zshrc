# ================= Appearance ====================================================================

ZSH_THEME="agnoster"
RPROMPT=

# ================= Config ========================================================================

export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH" # Add rbenv

# Tmux
export TERM="screen-256color" # Tmux 256 color forcing
export BUNDLER_EDITOR=nvim

# Zsh
export ZSH=~/.oh-my-zsh                                       # Path to your oh-my-zsh installation
source $ZSH/oh-my-zsh.sh

# asdf
plugins=(asdf)
. $(brew --prefix asdf)/asdf.sh

# Ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin
export GOPRIVATE="github.com/apptegy"

# Source fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# ================= Aliases =======================================================================

# Configs/Utilities
alias kode='cd ~/code/'                                                    # jump to code directory
alias vim='nvim'
alias ve='nvim ~/.vimrc'                                                            # vimrc editing
alias ze='nvim ~/.zshrc'                                                      # zsh profile editing
alias ge='nvim ~/.gitconfig'                                                    # gitconfig editing
alias te='nvim ~/.tmux.conf'                                                  # tmux.config editing
                                                                  # index command for ctags (below)
alias ct='ctags -R --exclude=.git --exclude=node_modules --exclude=spec --exclude=vendor'
alias c='clear'                                                             # clear terminal window
alias chrome="osascript -e 'tell application \"Google Chrome\" to activate'"
alias slack="osascript -e 'tell application \"Slack\" to activate'"

# Bundler
alias be='bundle exec'
alias bu='bundle update'
alias bi='bundle install'

# Tmux
alias tmux="tmux -2"                                                       # tmux 256 color forcing
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'

# Rails
alias rs='be rails s'
alias rc='be rails c'
alias rel='RAILS_ENV=local'
alias ret='RAILS_ENV=test'
alias rep='RAILS_ENV=production'
alias red='RAILS_ENV=development'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Git
alias g='git'

# Stitch Fix
alias stitch='cd ~/code/stitch'                                  # jump to stitchfix code directory
