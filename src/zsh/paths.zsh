# PATH and Environment Configuration

# asdf version manager
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Java (Android Studio)
export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
