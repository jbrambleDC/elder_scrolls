############################################################
# .bashrc
############################################################
# If not running interactively, don't do anything
if [[ -n "$PS1" ]]; then
  source $HOME/.bash_func
  source_if_exists $HOME/.bash_styles

  # append to the history file, don't overwrite it
  shopt -s histappend

  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=100000
  HISTFILESIZE=200000

  # don't put duplicate lines in the history. See bash(1) for more options
  # ... or force ignoredups and ignorespace
  HISTCONTROL=ignoredups:ignorespace

  # add timestamps to history
  export HISTTIMEFORMAT='%F %T '
  export HISTIGNORE="bg:fg"

  # no empty command completion
  shopt -s no_empty_cmd_completion

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  shopt -s cdspell # cd spell guessing
  shopt -s cdable_vars # if path not found assumes is var

  # disable XON/XOFF so ctrl-s works for forward-searching
  stty -ixon

  export TERM='xterm-256color'

  export EDITOR=vim
  export INPUTRC=$HOME/.inputrc

  export HSR="$HOME/.homesick/repos"
  export CDPATH=.:$HOME:$HSR:/opt

  if [ $(id -u) -eq 0 ]; then
    export HostInfoWColor="$IRed$UserName#$IPurple$HostName"
    export PathColor="$IGreen"
  else
    export HostInfoWColor="$ICyan$UserName@$IPurple$HostName"
    export PathColor="$IGreen"
  fi

  export PROMPT_COMMAND=ps1_w_pwd_info

  # Customize BASH PS1 prompt to show current GIT or SVN repository and branch
  # along with colorization to show local status (red dirty/green clean)
  function ps1_w_pwd_info() {
    last_command_exit=$?
    # svn info
    stat .svn > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        SURL=`svn info | grep URL | head -1 | perl -pe 's/URL: (.*)/\1/'`
        if [ `echo $SURL | grep -E "branches|tags"` ]; then
          SVER=`echo $SURL \
            | perl -pe 's{.*/(branches|tags)/(.*)}{\1/\2}' | cut -d/ -f1-2`
          SPTH=`echo $SURL \
            | perl -pe 's{.*svnroot/(.*)/(branches|tags)/.*}{/\1}'`
          SPWD="$SPTH/$SVER"
          SCL=$IGreen
        else
          SPWD=`echo $SURL \
            | perl -pe 's{.*svnroot/(.*)/trunk(.*)}{/\1/trunk}'`
          SCL=$IYellow
        fi
        svn status | egrep '.+' > /dev/null 2>&1
        if [ $? -eq 0 ]; then
          SCL=$IRed
        fi
      SvnInfoWColor="$SCL[SVN: $SPWD]"
    else
      SvnInfoWColor=""
    fi

    # git info
    git branch >/dev/null 2>&1 && command -v __git_ps1 >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      GitBranch=`__git_ps1 "%s"`
      if [[ $GitBranch =~ ^\( ]]; then
        char=$detached_head_char
      else
        char=$branch_char
      fi
      git status | grep "nothing to commit" >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        # Clean repository - nothing to commit
        GitInfoWColor="${IGreen}$char $GitBranch $check_char$Color_Off"
      else
        git status | egrep '(Changes to be committed|Changes not staged for commit)' >/dev/null 2>&1
        if [ $? -eq 0 ]; then
          # Changes to working tree
          GitInfoWColor="${IRed}$char $GitBranch $x_char$Color_Off"
        else
          GitInfoWColor="${Orange}$char $GitBranch $x_char$Color_Off"
        fi
      fi
    else
      GitInfoWColor=""
    fi

    # flag if last command had non-zero exit status
    if [ $last_command_exit -eq 0 ]; then
      export PBJ="$HostInfoWColor $PathColor$PathFull"
    else
      export PBJ="${IRed}$x_char $HostInfoWColor $PathColor$PathFull"
    fi

    export PS1="$PBJ $SvnInfoWColor$GitInfoWColor$NewLine$arrow_char $Color_Off"
  }
fi
