# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH:/home/casan/.local/share/gem/ruby/3.0.0/bin

# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/ohmyzsh"

# Custom Variables
PROMPT_EOL_MARK=''

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

fcd() {
  local dir
  dir=$(find . -type d 2> /dev/null | fzf +m) && cd "$dir" && tmux new -s $(basename "$PWD")
}

glow_open() {
  local file
  file=$(find . -type f 2> /dev/null | fzf +m) && glow -p "$file"
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'
alias mbsync='mbsync -c "$XDG_CONFIG_HOME"/isync/mbsyncrc'
alias tmux='tmux -f "$XDG_CONFIG_HOME/tmux/tmux.conf"'
alias sd=fcd
alias nb0="nb use Random"
alias nbl="nb list --filename --sort"
alias nb1="nb use Notes_Org"
alias nb2="nb use Learnings"
alias nb3="nb use Exams\&Academics"
alias nb4="nb use CTFs"
alias cat="bat"
alias ocat="/bin/cat"
alias og=glow_open

# HISTFILE is used by interactive shells only. Plus, 
# sub shells & external commands don't need this var.
# Hence, we put it in .zshrc and don't export it.
HISTFILE=$XDG_STATE_HOME/zsh/history

# Previously, I would’ve recommended putting the vars 
# below into `.zprofile`. However, many systems and 
# terminals _never_ start any Zsh login shells (unless 
# specifically instructed to do so). So, if you use the
# same dotfiles with different OSes and terminals, this
# is not a good idea.

# Only vars needed by external commands or non-
# interactive sub shells should be exported. Note that 
# you can export vars without assigning values to them.
export XDG_CONFIG_HOME XDG_STATE_HOME
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share
export EDITOR=nvim VISUAL=nvim
export BROWSER=firefox

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
 typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
