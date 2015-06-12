# Most of the time you don’t want to maintain two separate config files for login and non-login shells — when you set a PATH,
# you want it to apply to both. You can fix this by sourcing .bashrc from your .bash_profile file, then putting PATH and
# common settings in .bashrc.
if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi

source ~/.git-completion.sh
PS1="$PS1\$($( cat /Users/paulm/git-ps1.sh ))"

export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$PATH:/usr/local/mysql/bin
export IP=127.0.0.1
export REDISTOGO_URL=redis://localhost:16379
export PORT=8080
export DOMAIN=localhost
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export EDITOR=vim
alias k='knife'
#alias vagrant='chef exec vagrant'
alias be='bundle exec'
set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# PATH=/opt/chefdk/bin:$PATH
