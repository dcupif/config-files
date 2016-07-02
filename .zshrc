###################################
### ENVIRONNEMENT CONFIGURATION ###
###################################

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME=random

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
#ZSH_CUSTOM=/path/to/new-custom-folder

### ZSH OPTIONS
setopt CORRECTALL
setopt EXTENDED_HISTORY     # puts timestamps in the history
setopt HIST_VERIFY          # when using ! cmds, confirm first
setopt HIST_IGNORE_DUPS     # ignore same commands run twice+
setopt APPEND_HISTORY       # don't overwrite history 
setopt SHARE_HISTORY        # _all_ zsh sessions share the same history files
setopt INC_APPEND_HISTORY   # write after each command
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search) # other plugin battery



##########################
### USER CONFIGURATION ###
##########################
if [ "`id -u`" -eq 0 ]; then
  export PATH=$PATH
else
  export PATH=$HOME/bin:/usr/local/bin:$PATH
fi
export MANPATH="/usr/local/man:$MANPATH"

## Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You may need to manually set your language environment
#export LANG=en_US.UTF-8
#export LANG=en_GB.UTF-8

# Compilation flags
#export ARCHFLAGS="-arch x86_64"
export BROWSER=firefox
export EDITOR=vim
export PAGER=less
export TERMINAL=terminator

# ssh
#export SSH_KEY_PATH="~/.ssh/dsa_id"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.wm_chooser.sh" ]; then
  source "$HOME/.wm_chooser.sh"
fi

## PROMPT SETTING
PROMPT='[%{$fg_bold[green]%}%n%{$reset_color%}@%{$fg_bold[blue]%}%m%{$reset_color%}] (%{$fg[cyan]%}%/%{$reset_color%}) %{$fg_bold[blue]%}$(git_prompt_info)
%{$reset_color%}%{$fg[blue]%}└> ${ret_status}%{$reset_color%}$ '

RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"
