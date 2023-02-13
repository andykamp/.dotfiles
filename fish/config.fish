# add greeting spesified in function/fish_greeting.fish
set fish_greeting 

envsource ~/dotfiles/.env

# configure fzf if one want
set fzf_fd_opts --hidden --exclude=.git
fzf_configure_bindings --directory=\cs --variables=\e\cv

# command promp
starship init fish | source

# use z as a smart cd
zoxide init fish | source


# helper functions TODO move to functions ?

function findFiles
    cd $(find * -mindepth 0 -maxdepth 0 -type d | fzf)
end

function findFilesAny
    cd $(find ~/* -mindepth 1 -maxdepth 3 -type d | fzf)
end

function findFilesCoding
    cd  ~/Documents && cd $(find  ./WORK ./side-projects  -mindepth 1 -maxdepth 1 -type d | fzf)
end

function findFilesWork
    cd  ~/Documents && cd $(find  ./WORK -mindepth 1 -maxdepth 1 -type d | fzf)
end


function findFilesSideProjects
    cd  ~/Documents && cd $(find  ./side-projects -mindepth 1 -maxdepth 1 -type d | fzf)
end

function findFilesDotfiles
    cd  ~/dotfiles 
end

function getIPPublic
    dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com
end

# bindings

# need to put this into a folder and source the enitre folder
fish_add_path -P $HOME/.local/scripts

# Where should I put you?
bind -M insert \cf tmux-sessionizer

# aliases

alias nv='nvim .'

alias tk='tmux kill-server'
alias tn='tmux-sessionizer .'  #"tmux new -s (pwd | sed 's/.*\///g')" # creates new session with directory name
alias ta='tmux attach' # attaches to last session if any is open
alias tt="tmux-sessionizer-known"

#alias tw="tmux-sessionizer ~/documents/WORK/"
#alias tp="tmux-sessionizer ~/documents/WORK/placepoint"
#alias ts="tmux-sessionizer ~/documents/side-projects/"
#alias td="tmux-sessionizer ~/dotfiles/"
#alias tt="tmux-sessionizer ~/documents/random/"

alias ls="ls -1"
alias exa="exa --oneline --long"


alias pip=pip3
alias python=python3

alias img="qlmanage -p" # preview a image by img <image_path>

# cd maps
# NB! I also use zoxide as a smart cd
alias fdot=findFilesDotfiles 
alias fran="cd ~/documents/random" 
alias fwork="cd ~/documents/work" 
alias fside="cd ~/documents/side-projects" 
alias f=findFiles
alias fa=findFilesAny
alias fw=findFilesWork
alias fs=findFilesSideProjects

# ip
alias ip=getIPPublic

# superuserful for piping to clipboard
alias c="pbcopy"

alias g=git
alias glog1="sh ~/log-git-live.sh" # remap visualizing github tree for convinience

#vimwiki
alias vimwiki="nvim -c VimwikiIndex"
alias backupvimwiki="cp -R ~/vimwiki ~/Documents/BACKUPS/vimwiki" # takes backup of wimwiki

# processes
alias k="kill -9(lsof -i tcp | fzf --reverse --layout=reverse --border --height=50% --preview-window=wrap --marker='*' --prompt='Kill ports ')"
