############################################################
#  aliases
############################################################
alias ls='ls -G'
#alias ls='ls --color=auto'
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
alias py='python'

__git_complete g __git_main
alias sbp="source_if_exists $HOME/.bash_profile"
alias hr="cd $HSR"
alias beeline="beeline --color=true"
alias tree="tree -I sandcube"
alias brew_cleaner="brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup"

alias gh="open https://github.com"
alias gmail="open https://gmail.com"
alias news="open https://news.ycombinator.com"
alias reddit="open https://reddit.com"
alias datatau="open http://www.datatau.com"
alias morning="gmail && news && reddit && datatau"


### Git ###
alias sq=squash
alias gp=gpush
alias gfp=gfpush
alias gpo="gp origin"
alias gpu="gp upstream"
alias gfpo="gfp origin"
alias gfpu="gfp upstream"
alias gpa="gpo && gpu"
alias gfpa="gfpo && gfpu"
alias gs="g status"
alias ga="g add"
alias gt='g ls'
alias gpr='g pull-request --browse'
alias reb=i_rebase
### Hist ###
alias hideme='history -d $((HISTCMD-1)) &&'
alias histg="history | grep"
alias helium="helium --api-key FN7ldoXOz/6PiIp/wbMn9RINlLlBnpEo+1r5H8FgnEM="

### Server Utils ###
alias top='htop'
alias df="pydf -kh"

### csvkit ###
alias tsvcut="csvcut -t"
alias ntsv="tsvcut -n"
alias ncsv="csvcut -n"

### Cool Utils ###
alias myip="curl http://ipecho.net/plain; echo"
alias rand="shuf"
alias hn="pyhn"
alias prettyjson='python -m json.tool'
alias weather="curl http://wttr\.in/washington"
alias mycolors="printf \"\e[%dm%d dark\e[0m  \e[%d;1m%d bold\e[0m\n\" {30..37}{,,,} "

### Infrastructure connections ###

## add a tweets.csv from your twitter account to your home directory for next alias to work.
alias 1tweet="rand -n 1 $HOME/tweets.csv | csvcut -c 4,6 | csvlook"

alias ipn="ipython notebook"
alias jpn="jupyter notebook"
alias cheatsheet="cat ~/cheatsheet.txt"
alias ds_new="cookiecutter https://github.com/drivendata/cookiecutter-data-science"
export GRC=`which grc 2>/dev/null`
if [ "$TERM" != dumb ] && [ -n GRC ]
then
  alias colourify="$GRC -es --colour=auto"
fi
