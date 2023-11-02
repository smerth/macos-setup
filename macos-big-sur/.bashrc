#! /bin/bash

################
# export a variable - set a variable and make it available to other programs
################
MYNAME='Stephen Merth'
export MYNAME
# You can set a variable and export it in one line
# export FOO='foo'

################
# Echo something to the shell everytime you open it
################
echo -n "Uptime: "; uptime
echo ""

###############
# Fix too many open files problem
###############
# ulimit -n 65536


################
# Customize the bash prompt
# See: http://bashrcgenerator.com
# NOTE: MY BASH PROMPT IS UNDER CONTROL OF .git-prompt.sh
# SEE GIT SECTION BELOW
################
# export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
# export LSCOLORS=exfxcxdxbxegedabagacad

# Simple Prompt (no color)
# export PS1="\n\d (\A) [\u@\h \W] $ "

# Prompt with time, user, colors
# export PS1="\[\033[;38;5;190m\]\u\[\033[1;36m\]@\[\033[;38;5;203m\]mbp \[\033[;38;5;10m\]\W \[\033[0m\]\$ "


#################
# GIT
#################

# Use the Homebrew installation of Git (instead of the default MacOS version.)
export PATH="$(brew --prefix git)/bin:$PATH"

# Load git-competion.bash if it exists
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi


#################
# Setting global variables 
# for the GREP program
#################

# GREP_COLOR codes
# Attributes:   Text color:    Background:
#   0 reset all   30 black       40 black
#   1 bright      31 red         41 red
#   2 dim         32 green       42 green
#   4 underscore  33 yellow      43 yellow
#   5 blink       34 blue        44 blue
#   7 reverse     35 purple      45 purple
#   8 hidden      36 cyan        46 cyan
#                 37 white       47 white
# Separate with ";"
#
export GREP_COLOR="37;41"
# turn on extended regex set by default
export GREP_OPTIONS="-E"
# case insensitive search always on
# export GREP_OPTIONS="-i"
# turn coloring on for grep results in the terminal
export GREP_OPTIONS="--color=auto"

#################
# History program - Setting global variables
#################
# eg. setting variables for the program "history"
export HISTSIZE=10000                      # 500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p '    # using strftime format
export HISTCONTROL=ignoreboth              # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll"

# set config variables for an existing cmd -> less command for reading files
# M option gives maximum verbose prompt
# N option gives line numbers
export LESS='-MN'

################
# $PATH
################

# composer executables
# export PATH="Users/smerth/.composer/vendor/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# pear executables
export PATH="$PATH:/Users/smerth/pear/bin"

# ctags exectuables
export PATH="/usr/local/Cellar/ctags/5.8_1/bin:$PATH"

# MySQL exectuable
# system mysql
# export PATH="/usr/local/bin/mysql:$PATH"
# homebrew mysql - now using mariadb...
# export PATH="/usr/local/Cellar/mysql/5.7.16/bin:$PATH"

# sqlite used by my Homebrew install of Python
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# PHP
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"

# Drush (added using composer)
export PATH="$HOME/.composer/vendor/bin:$PATH"

#################
# Tell system compilers where to find the Brew installed openssl certificates
#################
# For compilers to find this software you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
# For pkg-config to find this software you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"


#################
# Disc Usage and Disc Freespace programs - humanize the output for disc_freespace and disc_usage commands
#################
alias df='df -h'
alias du='du -h'

#################
# Redefine UNIX commands with set options
#################

# make these commands interactive by default
# alias mv='mv -i'
# alias cp='cp -i'
# alias rm='rm -i'

# Aliased commands
alias ls='ls -GFh'
alias ll='ls -lahG'


#################
# Edit configuration files
#################

# Edit UNIX configuration in the ".bashrc" and ".bash_profile" files
alias conf-unix="code /Users/smerth/.bashrc && code /Users/smerth/.bash_profile"
# Edit Apache configuration in the "httpd.conf" file
alias conf-apache="code /usr/local/etc/httpd/httpd.conf"
# Edit PHP configuration in the "php.ini" files for each version
alias conf-php="code /usr/local/etc/php/7.4"
# Edit Virtual Hosts
alias conf-hosts="code /private/etc/hosts && code /usr/local/etc/httpd/extra/httpd-vhosts.conf"
# Edit Drush aliases and Drush configuration in ".drush" folder
alias conf-drush="code ~/.drush"
# Edit Git Settings in ".gitconfig" file
alias conf-git="code /Users/smerth/.gitconfig"
# Edit MySQL configuration.
alias conf-mysql="code /usr/local/etc/my.cnf"

#################
# Drush Configuration
#################
# Include Drush bash customizations.
if [ -f "/Users/smerth/.drush/drush.bashrc" ] ; then
    source /Users/smerth/.drush/drush.bashrc
fi
# Include Drush completion.
if [ -f "/Users/smerth/.drush/drush.complete.sh" ] ; then
    source /Users/smerth/.drush/drush.complete.sh
fi
# Include Drush prompt customizations.
if [ -f "/Users/smerth/.drush/drush.prompt.sh" ] ; then
    source /Users/smerth/.drush/drush.prompt.sh
fi

#################
# DRUPAL CONSOLE
#################
# On executing Drupal init
# Bash or Zsh: Add this line to your shell configuration file:
source "$HOME/.console/console.rc" 2>/dev/null

#################
# set the path for a accessing exectuables located in 
# the node_modules folder of any node based projects 
#################
# export PATH=$PATH:./node_modules/.bin

#################
# Automatically added by the Platform.sh CLI installer
#################
# export PATH='/Users/smerth/.platformsh/bin':"$PATH"
# [ "$BASH" ] || [ "$ZSH" ] && . '/Users/smerth/.platformsh/shell-config.rc' 2>/dev/null || true

#################
# Add phantomjs executable to the path
#################
# export PATH='/Users/smerth/.phantomjs/bin':"$PATH"

#################
# Set an env variable for the path the the Android Studio
#################
# export ANDROID_HOME=/Users/smerth/Library/Android/sdk
# export PATH=${PATH}:${ANDROID_HOME}/tools
# export PATH=${PATH}:${ANDROID_HOME}/platform_tools

#################
# Set a variable to Format Docker output into something
# more readable
#################
# export FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



