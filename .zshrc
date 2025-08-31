# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
  *) return;;
esac


# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="theunraveler"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(tmux emacs docker docker-compose fzf mvn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# aliases for pacman
#alias look="pacman -Ss"
#alias add="sudo pacman -S"
#alias update="sudo pacman -Syu && yay -Syu"
#alias remove="sudo pacman -Rs"

# Automatically start TMUX, if it's not set
# I got that from a dude on a comment section of this video ~>
# https://www.youtube.com/watch?v=cPWEX2446B4
if [[ ! -z ZSH_TMUX_AUTOSTART ]]; then
  export ZSH_TMUX_AUTOSTART=true
fi

if [[ ! -z ZSH_TMUX_FIXTERM_WITH_256COLOR ]]; then
  ZSH_TMUX_FIXTERM_WITH_256COLOR=true
fi

#
# Set up fzf key bindings and fuzzy completion
#
eval "$(fzf --zsh)"

## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

alias mkdir='mkdir -pv'

#alias reboot="sudo reboot"
#alias poweroff="sudo poweroff"

if [ $UID -ne 0 ]; then
  # for more civilized times..miss you, gentoo
  # alias look="emerge -S"
  # alias fetch="sudo emerge -av1"
  # alias update="sudo emerge --ask --verbose --deep --newuse @world"
  # alias remove-check="emerge -vp --depclean"
  # alias remove="sudo emerge --unmerge"
  # alias sync="sudo emerge --sync"
  #
  # aliases for gitting >:D
  #
  alias gs="git status"
  alias gf="git fetch"
  alias ga="git add"
  alias gpp="git pull"
  alias gp="git push"
  alias gc="git commit -m"
  alias gd="git diff"
  alias gcl="git clone"
  alias pa="php artisan"

  alias pn="pnpm"
  alias lf="ranger"
  alias ff="fastfetch"
fi

# Created by `pipx` on 2024-07-08 13:47:10
export PATH="$PATH:/home/tarffie/.local/bin"

# pnpm
export PNPM_HOME="/home/tarffie/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#[ -s "/home/tarffie/.jabba/jabba.sh" ] && source "/home/tarffie/.jabba/jabba.sh"

#export PATH="/home/tarffie/.config/herd-lite/bin:$PATH"
#export PHP_INI_SCAN_DIR="/home/tarffie/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# bun
#export BUN_INSTALL="$HOME/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

# Slackware heavily needed those
#PATH="/home/lain/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/lain/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/lain/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/lain/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/lain/perl5"; export PERL_MM_OPT;


# fast reload for st
#alias rel="xrdb merge ~/.local/opt/st/xresources && kill -USR1 $(pidof st)"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-you-should-use/you-should-use.plugin.zsh
