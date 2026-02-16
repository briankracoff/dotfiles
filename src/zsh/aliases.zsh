# General Aliases

alias ll='ls -l'
alias la='ls -a'
alias magick='nocorrect magick'
alias npx='nocorrect npx'
alias code='nocorrect code'
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

# iOS Development Aliases

alias recordSimulator='xcrun simctl io booted recordVideo ~/Desktop/video.mov'
alias rmDerivedData='rm -rf ~/Library/Developer/Xcode/DerivedData/'
alias sysDiagnoseSimulator='xcrun simctl diagnose'
alias videoToGif='ffmpeg -i ~/Desktop/video.mov ~/Desktop/video.gif && rm ~/Desktop/video.mov'

# Postgres Aliases

alias psqlStart='pg_ctl -D /usr/local/var/postgres start'
alias psqlStop='pg_ctl -D /usr/local/var/postgres stop'
