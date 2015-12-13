# Most of the time you don’t want to maintain two separate config files for login and non-login shells — when you set a PATH,
# you want it to apply to both. You can fix this by sourcing .bashrc from your .bash_profile file, then putting PATH and
# common settings in .bashrc.
if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$PATH:/usr/local/mysql/bin
export IP=127.0.0.1
export REDISTOGO_URL=redis://localhost:16379
export PORT=8080
export DOMAIN=localhost
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
alias vim='mvim -v'
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export EDITOR=vim
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
set -o vi
source dnvm.sh
$(boot2docker shellinit 2>/dev/null)
eval "$(rbenv init -)"

[ -s "/Users/paul/.dnx/dnvm/dnvm.sh" ] && . "/Users/paul/.dnx/dnvm/dnvm.sh" # Load dnvm
