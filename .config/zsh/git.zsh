# ================= git ==========================================================================

alias g='git'
alias purgeb='g branch | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
