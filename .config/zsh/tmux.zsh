# ================= tmux =========================================================================

alias tmux="tmux -2"                                                       # tmux 256 color forcing
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
