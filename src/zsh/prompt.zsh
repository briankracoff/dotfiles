# Custom Prompt Configuration

setopt PROMPT_SUBST

parse_git_branch() {
    branch=$(git_current_branch)
    if [ ! -z $branch ];then
        echo '@'$branch
    fi
}

PROMPT=$'%{${fg[cyan]}%}%~%{${fg[magenta]}%}$(parse_git_branch)%{${fg[default]}%} '
