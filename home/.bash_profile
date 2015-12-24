############################################################
# .bash_profile
############################################################
export debug_source=false
# load helper functions (Includes source_if_exists)
source $HOME/.bash_func
export RTV_EDITOR=vi
source_if_exists $HOME/git-prompt.sh $HOME/git-completion.bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
# prevents duplicated path created when using tmux
# by clearing out the old path and then rebuilding it
# like a brand new login shell
# will not do this if bash_login has already been run
if [[ ! -z $TMUX ]] && [[ -z $tmux_path_initialized ]]; then
  if_debug_echo 'initializing tmux...'
  PATH=""
  source /etc/profile
  export tmux_path_initialized=true
  export path_initialized=
fi

initialize_path "$HOME/bin"

# OS specific features
if [[ 'Darwin' == `uname` ]]; then
  # using GNU for coreutils vs BSD
  add_brew_paths coreutils gnu-sed

  # gotta have dircolors
  eval `dircolors $HOME/.dir_colors`

  source_if_exists $(brew --prefix)/etc/bash_completion
  source_if_exists $(brew --prefix grc)/etc/grc.bashrc
elif [[ 'Linux' == `uname` ]]; then
  # make caps lock actually useful (in linux)
  if command -v xmodmap >/dev/null 2>&1; then
    xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
  fi

  # enable bash completion in interactive shells
  source_if_exists /etc/bash_completion
  source_if_exists $HOME/git-prompt.sh $HOME/git-completion.bash
fi

# Source global definitions
source_if_exists $HOME/.bash_styles
source_if_exists $HOME/.bashrc
source_if_exists $HOME/.bash_aliases

# use homeshick to manage dot-files
source_if_exists $HSR/homeshick/homeshick.sh
source_if_exists $HSR/homeshick/completions/homeshick-completion.bash

# autoload other bash configs
for autoload_file in `ls -a $HOME/.bash_autoload* 2>/dev/null`; do
  source_if_exists $autoload_file
done

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if_debug_echo "Profile PATH: $PATH"
if_debug_echo "Profile MANPATH: $MANPATH"
export path_initialized=true
export PATH
