# Most of the time you don’t want to maintain two separate config files for login and non-login shells — when you set a PATH,
# you want it to apply to both. You can fix this by sourcing .bashrc from your .bash_profile file, then putting PATH and
# common settings in .bashrc.
if [ -f ~/.bashrc ]; then
     source ~/.bashrc
fi

# enable brew completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# give me a git like prompt when in git repos
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  GIT_PROMPT_THEME=Solarized
  GIT_PROMPT_START="(\u@\w"
  GIT_PROMPT_END=")> "
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# use fancy colors when ls'ign
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

# set vim as my default editor
export EDITOR=vim
set -o vi

#Proxy settings
export http_proxy=http://webproxysea.nordstrom.net:8181
export https_proxy=$http_proxy
# export no_proxy=localhost,*.local,127.0.0.1/8,.nordstrom.net,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
export no_proxy=127.0.0.1,localhost,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,nordstrom.net,dev.nordstrom.com,wsperf.nordstrom.com,website.nordstrom.com,.local
export NO_PROXY=127.0.0.1,localhost,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,nordstrom.net,dev.nordstrom.com,wsperf.nordstrom.com,website.nordstrom.com,.local

echo "========Nordstrom Proxy set=========="
echo Proxy:  $http_proxy
echo Bypass: $no_proxy
echo "====================================="
