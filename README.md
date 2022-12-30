# .dotfiles

**Goal**: Super fast terminal based dev environment 

**Worfklow**:
- go to places i visit less often
    -  could use fuzzy finder
- go to places i go to all the time
    - would expect single key-stroke to get there
- go into editing 

**Must have plugins to note:**
- fzf (for zsh) 
- telescope
- harpoon
- vim-fugitive
- easy-motion

Yabai:
- read https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection
- inspired by https://www.youtube.com/watch?v=fYsCAOfGjxE
- start yabai and skhd by:
    - brew services start yabai / brew services stop yabai
    - brew services start skhd
    - brew services stop skhd
- make symlink to dotfiles 
    - ln -s ~/dotfiles/.yabairc ~/.yabairc
    - ln -s ~/dotfiles/.skhdrc ~/.skhdrc

**Note**: Remember that most dotfiles har a place somewhere. Make sure they point/symlink to the links inside this dotfile repo. 
Use the `ln -s <actual existing filepath> <this will point to existing file filepath>` to create a symlink
This must be done for (might be missing some):
- nvim (located in ~/.config/nvim)
- vimrc
- zshrc
- .zsh_profile
- alacritty.yml (located in ~/.config/alacritty)
    - ln -s ~/.dotfiles/alacritty ~/.config/alacritty
- fish (located in ~/.config/fish)
    - ln -s ~/dotfiles/fish/ ~/.config/fish 
- starfish (located in ~/.config/starfish.toml)
    - ln -s ~/dotfiles/staship.toml ~/.config/starship.toml
- neofetch (located in  ~/.config/neofetch/config.conf)
    - ln -s ~/dotfiles/neofetch ~/.config/neofetch 
Also for ll scrips/executable u need to make it executble and giev u access
`chmod u+x filepath`
- make sure to remap capslock to control 



## 🙇 Worth remembering
- terminal commands and replacements descibed [here](https://andrew.cloud/blog/dev-setup/)
- exa to replace ls
- bat to replace cat
- fd to replace find (fuzzy search)
- htop to inspect performace
- https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts for exa icons
- lsof to inspect pids
- kill -9 <pid>  to kill a pid
- fzf for fuzzy search
- TODO alias them to replace DEFAULY COMMANDS



## 🤷 TODO look into
- hold w, b, e, or j/k to go superfast. Could consider it if I speeeeeeeed up the button delay. 
- lazygit https://github.com/jesseduffield/lazygit
- use this fzf for completion?? https://github.com/Aloxaf/fzf-tab
- always open tmux when using ff (see https://www.youtube.com/watch?v=bdumjiHabhQ&t=5s)
- use fzf for more usecasess https://www.youtube.com/watch?v=qgG5Jhi_Els
- mimic this worfkflow? https://elijahmanor.com/blog/neovim-tmux
- cool setup https://github.com/AstroNvim/AstroNvim/tree/main/lua/configs or https://elijahmanor.com/blog/neovim-tmux or https://github.com/LunarVim/LunarVim
- tag manaement. does gutentags ds
- terminal alias/worklows
    - utilize htop better to identify 
    - alias for lsof -i tcp:3000 etc. maybe use fzf completion to find open ports? 
    - alias for kill -9 
    - alias for getting own ip adress
- Remove bashrc and bash_profile when i use zsh
- Remove vimrc? or maybe make it super up-to-date without plugins to utilize it on remote servers etc?
- Add script to dynamically create all files and symlinksand settings chmod premissions 
- better at identifying performance by using htop or tiptop 
- how to make first letter become uppercase
- use somethign like this tmux session chooser https://waylonwalker.com/tmux-choose-tree/
- øve på nummer
    - Sette vimium til kun nr for å øve?
- fikse copy to clipboard and remove oscyank

## 💡 Currently experimenting with 
- use harpoon quicktoggle more
- keep gitsigns as is or revert to oldschool?
- [use](use) trouble or loclist for error/warnings?
-  use aerial as tagbar alternativ. overrides { and  } but i usually dont use that anywhat
- use <leader>fs to search for functions and symbolds
    -insp [here](https://user-images.githubusercontent.com/39233597/110256294-57385c00-7f98-11eb-86e9-9f647bb2a659.mp4)  and [here](https://www.reddit.com/r/neovim/comments/m9vwy2/search_for_class_using_telescope_and_native_lsp/)
- 

## 😩 Existing painpoints
- zsh  and tmux terminals
    -  cannot use vim commands to edit vims :term commands. It only focus on the end of the input command, not where the cursor is. So the solution here is to try to use harpoon to write most commenly used commands and limit the writing in the .term. see issue at [github](https://github.com/neovim/neovim/issues/8805) 
-  zsh and tmux and neovim terminals not 100% sure on optimal flow
- [○] workflow
    - [✓] context switching overhead: to many tabs to keep track of for frontend + server + misc  
    - [✗] cannot open random tmux panes
    - [✗] ff does not work anymore
- eslint warning does not work properly in placepoint monorepo
- tsx colors not working
- lss.references opens quiqlist
- want to make a selction bord OR in general add "more stuff to surround" at the same time

# 📈 Monitoring
- htop or tiptop
    - (cant descide which one to use)
- tmux session monitoring TODO i need this!!!

# 👨👨👦👦 Tmux
- can create a server that re-uses buffers. 
- currently i have to 
    - either close and repoen nvim all the time and 'start form frach'
    - have a shitton of tabs etc open




## Treeesitter and heighlighting
- lsp is for smart language stuff. use :Lsp... in vim to get options
- Treesitter is used fro syntax higlghtihng etc. use :TsInstall typescript5 etc to make sure higlighting is installes

## Ideas
- mikael div higlighting
-create own colorschema create own colorschema [ondark exaple](https://github.com/lukas-reineke/onedark.nvim) 

## get path  (pwd like stuff)
- DONE see the the maps section  

## neotree
- resize shortcut

## orgmode???
- pretty cool stuff right here https://github.com/nvim-orgmode/orgmode


## TAGs??
- not using it atm


## renaming and file path update on neotree movement
- learn cdo  https://vimhelp.org/quickfix.txt.html#%3Acdo
j- 

## should i use nvim-cmp 
- https://github.com/hrsh7th/nvim-cmp
- https://github.com/quangnguyen30192/cmp-nvim-ultisnips


## tiling manager and mac shortcuts
- https://github.com/koekeishiya/yabai
    - security risk??? se [this arcile](https://apple.stackexchange.com/questions/411598/what-are-the-potential-consequences-of-partially-disabling-sip-for-yabai)
- https://ayazhafiz.com/articles/19/tiling-wm-macos
- setup script to add daily notes + vorgmode to always have ut 
-  pretty dope setup https://www.youtube.com/watch?v=fYsCAOfGjxE


TODO 
-  add a open go-to in next window `:vs + gd`
-  personally more intuitiv with ; for forward and shift+; for backward. Default is other way around
- get insp for dotfiles from  https://github.com/joshmedeski/dotfiles
- add 15j 15k to vim fugitiveaJ
-  add https://apps.apple.com/no/app/network-battery/id1387780159?mt=12
- vim diary creates a local path.. dont want that 
- add tmux vim. map jk so that it is similar to how neovim is now. but also fix the "i" so it dont just go to default
- warp terminal
- a pasteapp.io for pasting history
- add timestamp to terminal
- setapp - markedplace for alle mulige kule apper
- [✓] opacity on all backgrounds
- entire line of tmux to higlight on tmux-key pressed
- i want fish vim to higlight instert/vim mode so i know if i can scroll etc
- see image on phone for font etc
- padding
- test workflow needs to be improved
- look into chrome shortcuts etc (goto brain.fm commands etc)
- [✓] costumize vimium colors to be pink
- chrome same color as github
- jira black theme same color as chrome
- get new top vim shortuts (see redit no phone)
- use riw insted of ciw/diw
- make tmux-session take in the target paths and great a <command>+g to go to alternative path
- quiclist actions! rename every file etc
- shortcuts for wimwiko to go back and forth between notes
- figure out why wimwiki and diary opens in wrong folder sometimes
- is https://activitywatch.net/ a good all-app tracker?

# Swithcing to fish 


# Switching to fish? (see [docs](https://fishshell.com/docs/3.0/tutorial.html))
If you wish to use fish (or any other shell) as your default shell, you need to enter your new shell's executable /usr/local/bin/fish in two places:

- add /usr/local/bin/fish to /etc/shells
- change your default shell with chsh -s to /usr/local/bin/fish

You can use the following commands for this:

Add the fish shell /usr/local/bin/fish to /etc/shells with:
`echo /usr/local/bin/fish | sudo tee -a /etc/shells`

Change your default shell to fish with:
`chsh -s /usr/local/bin/fish`

## fisher
We also use `fisher` plugin manager. It is more barebone than `oh-my-fish` and is more like npm where `oh-my-fish` is a actual framework
## fish.fzf
- see documentation [here](https://github.com/PatrickF1/fzf.fish/blob/main/functions/_fzf_configure_bindings_help.fish)
- nice way to show fuzzy search
- used for control-r
- and for displaying the tmux session and file explorer
- instead of piping to ilc fzf we can pipe to `_fzf_wapper` e.g `ls | _fzf_wrapper`
- OR just use the native popup in fzf that the `_fzf_wrapper` by just adding `fzf --border --height=90% --preview-window=wrap --layout=reverse` 

# [Zoxide](https://github.com/ajeetdsouza/zoxide)
- zoxide is a smarter cd comman
- install `brew install zoxide`
- add `zoxide init fish | source` to config.fish
- use z <folder> to go directly to folders you have visited before

# FISH Alot of usefull hints [here](/docs/current/interactive.html)
Especially directory movement
```
Several commands are provided to interact with this directory history:

dirh prints the history

cdh displays a prompt to quickly navigate the history

prevd moves backward through the history. It is bound to Alt+←

nextd moves forward through the history. It is bound to Alt+→
```
- `control + l ` clears + repaints the screen
- 
- o

# if path is lost restore by https://stackoverflow.com/questions/15872666/how-to-remove-entry-from-path-on-mac
- export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"

## Fortune | Cowsay
- cool asci drawing.Fortune creates text that we pipe into cowsay
- run by `fortune | cowsay`
- add to fish greeting by configurating `fish/functions/fish_greeting.fish`

## Neofetch
- check out some cool configurations [here](https://github.com/Chick2D/neofetch-themes/blob/main/README.md)
- run by `neofetch`
- configure in `neofetch/config.conf`
 
## Image viewer in shell
- builtin command `qlmanage -p <path>` opens a popup in full-size that can be escaped awy
- e.g `qlmanage -p ~/documents/backgrounds/background.jpegqlmanage`
- we alias this to `img <path>`

## vim-startify
- keeps bookmarks and easy access to reasonly used files and bookmarks
- good for easy acces to dotfiles, work and side-projects

## colros and higlightgroups
- to see all highlilght groups do `:hl`
- to filter based on seach do `:filter /NeoTree/ highlight`
- to change a highlight group do `vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg="#5DBBC1" })`

## keyboard speed
- go to `system settings` and make sure the keyboard delays are as fast as possible
