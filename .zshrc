# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/anderskampenes/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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


# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"


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
plugins=(vi-mode zsh-autosuggestions zsh-syntax-highlighting fzf-zsh-plugin )
# bindkey '^I' autosuggest-accept
bindkey '^I' autosuggest-execute

# Enable vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode


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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
findFiles(){
    cd $(find * -mindepth 0 -maxdepth 0 -type d | fzf)
}

findFilesAny(){
    cd $(find ~/* -mindepth 1 -maxdepth 3 -type d | fzf)
}


findFilesCoding(){
    cd  ~/Documents && cd $(find  ./WORK ./side-projects  -mindepth 1 -maxdepth 1 -type d | fzf)
}

findFilesWork(){
    cd  ~/Documents && cd $(find  ./WORK -mindepth 1 -maxdepth 1 -type d | fzf)
}

findFilesSideProjects(){
    cd  ~/Documents && cd $(find  ./side-projects -mindepth 1 -maxdepth 1 -type d | fzf)
}
findFilesDotfiles(){
    cd  ~/dotfiles 
}

alias fdot=findFilesDotfiles 
alias f=findFiles
alias fa=findFilesAny
alias ff=findFilesCoding
alias fw=findFilesWork
alias fs=findFilesSideProjects
alias ls="ls -1"
alias exa="exa --oneline --long"
alias g=git
alias pip=pip3
alias python=python3
# remap visualizing github tree for convinience
alias glog1="sh ~/log-git-live.sh"
# remap taking backup of wimwiki
alias backupvimwiki="cp -R ~/vimwiki ~/Documents/BACKUPS/vimwiki"

 # add fast back/forward work laps
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey "^[[C" end-of-line 
bindkey "^[[D" beginning-of-line 

# Add colors to Terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
