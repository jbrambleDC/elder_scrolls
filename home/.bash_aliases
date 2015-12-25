############################################################
#  aliases
############################################################
alias ls='ls -G'
alias ls='ls --color=auto'
alias l='ls -CF'
alias la='ls -a'
alias ll='ls -lkh'
alias lla='ll -a'
alias lrt='ll -rtF'
alias lrta='lrt -a'
alias lrtr='lrt -R'
alias lrs='ll -rS'
alias lrsa='lrs -a'
alias lrsr='lrs -R'
alias lr='ls -R'
alias llr='ll -R'
alias llra='llr -a'
alias clr='clear'
alias df='df -kTh'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias rmf='rm -f'
alias grep='grep --color=auto --exclude-dir="\.git" --exclude-dir="\.svn"'
alias egrep='egrep --color=auto --exclude-dir="\.git" --exclude-dir="\.svn"'
alias fgrep='fgrep --color=auto --exclude-dir="\.git" --exclude-dir="\.svn"'
alias t1='tail -n1'
alias h1='head -n1'
alias vi='vim'
alias g='hub_or_git'
__git_complete g __git_main
alias sbp="source_if_exists $HOME/.bash_profile"
alias hr="cd $HSR"
alias rakeit="rake db:drop && rake db:create && rake db:migrate && rake db:seed"
alias beeline="beeline --color=true"
alias tree="tree -I sandcube"
alias brew_cleaner="brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup"
alias sq=squash
alias gp=gpush
alias gfp=gfpush
alias gpo="gp origin"
alias gpu="gp upstream"
alias gfpo="gfp origin"
alias gfpu="gfp upstream"
alias gs="g status"
alias ga="g add"
alias reb=i_rebase
alias hideme='history -d $((HISTCMD-1)) &&'
alias gt='g log --graph --decorate --pretty=oneline --abbrev-commit'
alias histg="history | grep"
alias top='htop'
alias df="pydf -kTh"
alias tsvcut="csvcut -t"
alias ntsv="tsvcut -n"
alias ncsv="csvcut -n"
alias myip="curl http://ipecho.net/plain; echo"
export GRC=`which grc 2>/dev/null`
if [ "$TERM" != dumb ] && [ -n GRC ]
then
  alias colourify="$GRC -es --colour=auto"
  alias mvnk="colourify -c $HOME/.grc/mvn.config mvn"
  alias kat="colourify -c $HOME/.grc/mvn.config"
fi
