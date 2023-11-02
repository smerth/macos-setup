#! /bin/bash

ulimit -n 65536 65536

######
# This file loads each time terminal is opened (user login).  
# It does not re-load each time a new session is started.
# .bashrc will load with each new session.
# Put the configuration you want to load once here.
# Put the configuration you want to load with each session into .bashrc 
# Call .bashrc from this file.
######

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# This only runs on user login
echo ""
echo -n "Welcome to Unix on Mac OS X, "; whoami
echo ""
echo -n "Today is "; date "+%m-%d-%Y %H:%M:%S"
echo ""
cal

# This loads in the configuration in .bashrc
# Put all configuration there!
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/smerth/google-cloud-sdk/path.bash.inc' ]; then source '/Users/smerth/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for Google Cloud SDK.
if [ -f '/Users/smerth/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/smerth/google-cloud-sdk/completion.bash.inc'; fi

# RUBY, RBENV, GEMS, ETC... 

#To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following to your /Users/smerth/.bash_profile:
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"

eval "$(rbenv init -)"

export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
