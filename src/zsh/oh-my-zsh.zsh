# Oh-My-Zsh Configuration

export ZSH=~/.oh-my-zsh

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

ZSH_THEME_AWS_PREFIX="["
ZSH_THEME_AWS_SUFFIX="]"

plugins=(
    asdf
    dotenv
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
