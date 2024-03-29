# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="random"
#ZSH_THEME="candy"
ZSH_THEME="steeef"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git lein universalarchive docker docker-compose github gcloud wakeonlan)

source $ZSH/oh-my-zsh.sh
[[ -f ~/.profile ]] && . ~/.profile

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacsclient -ct'
else
  export EDITOR='emacsclient -c'
fi

# # Compilation flagsn
export ARCHFLAGS="-arch x86_64"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias godev="ssh ubuntu@dev"
alias gofprx="ssh ubuntu@fprx -i ~/dev/robot-keys/fairpricerx-virginia.pem"
alias ed="emacsclient -c"
alias trans="docker exec -it translate-shell trans"
alias t="tmate attach || tmate"
alias aws-cli="docker run --rm -it amazon/aws-cli"

# Put your fun stuff here.
# enable color support of ls and also add handy aliases

if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   #alias dir='dir --color=auto'
   #alias vdir='vdir --color=auto'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
   alias cdar='cd ~/dev/wcsidechain/packages/arweave/'
   alias cdsol='cd ~/dev/wcsidechain/packages/solana/'
fi

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#     tmux attach -t default || tmux new -s default
# fi

# Add user-local path
export PATH=~/bin:$PATH
export JAVA_HOME=/opt/openjdk-bin-17

# Aliases
alias arecordvvv='arecord -vvv -f dat /dev/null'
alias diff='diff --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias grep='grep --color --ignore-case'
alias la='ll -A'
alias ll='ls -ghlo'
alias lll='ls -hl'
alias ls='ls --color --group-directories-first'
alias rsync='rsync --human-readable --info=progress2'
alias tree='tree -C'
alias wakequad='wakeonlan 00:23:7d:d0:3f:8e'
alias wakeq520='wakeonlan 90:1b:0e:19:21:a1'
alias wakeall='wakequad;wakeq520'
alias sleepquad="ssh quad 'sudo shutdown -h now'"
alias sleepq520="ssh q520 'sudo s2ram'"
alias sleepall='sleepquad;sleepq520'
alias aws='docker exec -ti aws-cli aws '
alias kali='docker exec -ti kali /bin/bash'

# Prompt
# autoload -U promptinit; promptinit
# prompt fire blue green red

echo "Running terminal"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/home/archer/perl5/bin${PATH:+:${PATH}:$HOME/.dotnet/tools}"; export PATH;
PERL5LIB="/home/archer/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/archer/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/archer/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/archer/perl5"; export PERL_MM_OPT;
