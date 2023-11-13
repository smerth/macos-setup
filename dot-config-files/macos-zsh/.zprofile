eval "$(/usr/local/bin/brew shellenv)"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/smerth/Developer/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/smerth/Developer/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/smerth/Developer/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/smerth/Developer/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# >>> aliases >>>
alias tp="open -a typora"
# <<< aliases <<<

