# General Aliases

alias ll='ls -l'
alias la='ls -a'
alias magick='nocorrect magick'
alias npx='nocorrect npx'
alias code='nocorrect code'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias tmux='nocorrect tmux'

# tmux

alias cc='tmux has-session -t claude 2>/dev/null && tmux attach -t claude || tmux new -s claude -c "$(pwd)"'
alias tls='tmux ls'
alias tkill='tmux kill-session -t claude'

# iOS Development Aliases

alias recordSimulator='xcrun simctl io booted recordVideo ~/Desktop/video.mov'
alias rmDerivedData='rm -rf ~/Library/Developer/Xcode/DerivedData/'
alias sysDiagnoseSimulator='xcrun simctl diagnose'

# Postgres Aliases

alias psqlStart='pg_ctl -D /usr/local/var/postgres start'
alias psqlStop='pg_ctl -D /usr/local/var/postgres stop'
