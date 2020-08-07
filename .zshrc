# ================= Appearance ====================================================================

ZSH_THEME="agnoster"
RPROMPT=

# ================= Config ========================================================================

export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$PATH" # Add rbenv
export SSH_USER=jmacdonald

# Tmux 256 color forcing
export TERM="screen-256color"
export BUNDLER_EDITOR=nvim

export ZSH=~/.oh-my-zsh                                       # Path to your oh-my-zsh installation

source $ZSH/oh-my-zsh.sh
export PATH="${PATH}:${HOME}/Library/Python/2.7/bin"                               # for aws config

plugins=(asdf)
. $(brew --prefix asdf)/asdf.sh

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export GOPATH=$HOME/go # don't forget to change your path correctly!
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:$GOROOT/bin
export GOPRIVATE="github.com/apptegy"

# Remove escape key delay
export KEYTIMEOUT=1

# kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
export PS1='$(kube_ps1)'$PS1
# ================= Aliases =======================================================================

# Configs/Utilities
alias kode='cd ~/code/'                                                    # jump to code directory
alias dotfiles='cd ~/.dotfiles'                                        # jump to dotfiles directory
alias vim='nvim'
alias ve='nvim ~/.vimrc'                                                            # vimrc editing
alias ze='nvim ~/.zshrc'                                                      # zsh profile editing
alias ge='nvim ~/.gitconfig'                                                    # gitconfig editing
alias te='nvim ~/.tmux.conf'                                                  # tmux.config editing
                                                                  # index command for ctags (below)
alias ct='ctags -R --exclude=.git --exclude=node_modules --exclude=spec --exclude=vendor'
alias c='clear'                                                             # clear terminal window
alias eve='nvim $HOME/.dotfiles/env_variables.local'                   # edit environment variables
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

# Apptegy
alias startThrillshare='be rails s -b 127.0.0.1 -p 3000'
alias startDocuments='be puma -b tcp://0.0.0.0:9293'
alias startChat='be puma'
alias startRooms='DOCUMENT_SERVICE="http://localhost:5000/ "CHAT_SERVICE="http://localhost:9292/chats" be rails s -b 127.0.0.1 -p 4000'

# added by travis gem
[ -f /Users/jonathanmacdonald/.travis/travis.sh ] && source /Users/jonathanmacdonald/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ================= Functions =====================================================================

function weather {
  curl -s "http://wttr.in/${1:-Little Rock}" | head -n 27
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
