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
- hop

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

## Setup instructions
**Note**: Remember that most dotfiles has a place somewhere. Make sure they point/symlink to the links inside this dotfile repo. 
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
-----
To check the symlinks go to `.config` and exa will show the following:
```
lrwxr-xr-x  40 anderskampenes 10 Dec  2022 alacritty -> /Users/anderskampenes/dotfiles/alacritty
drwxr-xr-x   - anderskampenes  9 Mar  2022 coc
drwxr-xr-x   - anderskampenes 13 Nov  2022 com.filestar.macos
drwx------   - anderskampenes 15 Oct 18:32 configstore
lrwxr-xr-x  36 anderskampenes 28 Dec  2022 fish -> /Users/anderskampenes/dotfiles/fish
drwxr-xr-x   - anderskampenes 17 Jun  2020 gcloud
drwx------   - anderskampenes 30 Dec  2022 github-copilot
drwx------   - anderskampenes 27 Sep  2022 htop
drwxr-xr-x   - anderskampenes  6 Jun  2022 iterm2
lrwxr-xr-x  39 anderskampenes 29 Dec  2022 neofetch -> /Users/anderskampenes/dotfiles/neofetch
lrwxr-xr-x  35 anderskampenes  5 Jun  2022 nvim -> /Users/anderskampenes/dotfiles/nvim
drwxr-xr-x@  - anderskampenes 11 Jun 18:48 raycast
lrwxr-xr-x  44 anderskampenes 28 Dec  2022 starship.toml -> /Users/anderskampenes/dotfiles/starship.toml
drwxr-xr-x   - anderskampenes 11 Jul  2022 yarn
```

## Git workree > stash and checkout 
- use [git-worktrees](https://www.gitkraken.com/learn/git/git-worktree) to have multiple workspaces open at all times
    - good explanation [here](https://www.gitkraken.com/learn/git/git-worktree)
- all workspaces are added to `./worktrees` folder for convinience (so they dont float around)
    - simply `cd` into one of the workspaces to work on it and the active branch inside it
    - NB! Remember to add ./worktrees to .gitignore
- use 3 workspaces per repo
    - m (main/master)
    - wb (working-branc)
    - hotfix
- consider using the [git-worktree.nvim](https://github.com/ThePrimeagen/git-worktree.nvim)
- commands
    - git worktree list 
    - git worktree add
    - git worktree remove

## Git diff
 - use Gvdiff <some_commit_sha> to see diff between current commit and other commit
 - use Gvdiff HEAD~1 to see diff between current commit and previous commit
 - use Gvdiff master to see diff between current commit and master
 - use :G difftool --name-only master to get all changed files between current commit and master
 - use :G difftool --name-only HEAD to get all changed files between current commit and last commit
 - use :G difftool --name-only <some_commit_sha> to get all changed files between current commit and other commit


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
- tmux sessionizer https://www.youtube.com/watch?v=bdumjiHabhQ&t=5s)
- use fzf for more usecasess https://www.youtube.com/watch?v=qgG5Jhi_Els
- mimic this worfkflow? https://elijahmanor.com/blog/neovim-tmux
- cool setup https://github.com/AstroNvim/AstroNvim/tree/main/lua/configs or https://elijahmanor.com/blog/neovim-tmux or https://github.com/LunarVim/LunarVim
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

## 📈 Monitoring
- htop or tiptop
    - (cant descide which one to use)
- tmux session monitoring TODO i need this!!!

# 👨👨👦👦 Tmux
- can create a server that re-uses buffers. 
- currently i have to 
    - either close and repoen nvim all the time and 'start form frach'
    - have a shitton of tabs etc open

## Alfred
- move to applications quickly
- search folders in finder (cmd+space -->cmd+space -->  alfre preferences preferences--> features --> default results)
- search a file (not folder) by prefixing space

## Raycast
- better but alot of unessesarry stufffff

## Shell
- use fish
- use starship for a nice and easy prompt
    - @todo: add a nice battery prompt (?)

## Pomodoro timer
- used for maximum focus in short bursts
- also benifitial for taking breaks to keep the efficiency up
- hypototy:
    - time used is proportional to the time one has  
    - reduce time and remain as efficient
    - net win on time/work ratio
- https://github.com/olimorris/tmux-pomodoro-plus
- @todo: add a popup for showing the timer in big-view [see implementation here](https://github.com/thegoldgoat/pomodoro-countdown)
- @todo: add notifications
- commands
    - z pomodoro-countdown
    - python pomodoro-timer.py


## Tmux
- use `tmp` as tmux plugin manager
- located in `~/.tmux/plugins/tpm` 
- install via `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- copy plugins and install via `prefix-I`


## LSP 
- lsp is for smart language stuff. use :Lsp... in vim to get options
- `nvim-lsp-installer` installs and manages lsp servers
    - also provides a graphic interface. use `:LspInstallInfo` to see it
- `lsp_config` has some sane efalt configs for us
    - users that to setup a variaty of servers
- for different languages see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
- or see :help lspconfig-all
- install lua-language server via `brew install lua-language-server` 
- install tailwindcss-language-server via `brew install tailwindcss-language-server` 

## Treeesitter and heighlighting
- we use  nvim-lsp-installer  to install language servers
    - do :LSPInstall <some_laguage> to install get a popup about a relevant language server
- Treesitter is used fro syntax higlghtihng etc. use :TsInstall typescript5 etc to make sure higlighting is installes
    -   nvim-treesitter gives Neovim better language parsing capabilities. The most noticeable improvement is a better and more precise syntax highlighting, but it also brings other improvements to folding and indentation. It does that by building a syntax tree of our code rather than relying on regexps and patterns
- IMPORTANT: tsserver will not work unless we run `:TSInstall tsx` and `:TSInstall typescript` and `:TSInstall typesscripInstall typesscript` (`jsx` does not xist)

## Ideas
- mikael div higlighting
- create own colorschema create own colorschema [ondark exaple](https://github.com/lukas-reineke/onedark.nvim) 
- use less color on if statements etc and make variables and functions POP. more black background

## get path  (pwd like stuff)
- DONE see the the maps section  

## neotree
- resize shortcut
- use < to toggle fulltree-gittree-buffertree
- use :setlocal relativenumber (see https://github.com/nvim-tree/nvim-tree.lua/issues/422)

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



## Swithcing to fish 


## Switching to fish? (see [docs](https://fishshell.com/docs/3.0/tutorial.html))
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

## FISH Alot of usefull hints [here](/docs/current/interactive.html)
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

## chrome debugger
- use cntr+p to get commends
    - show console/network/elements etc

## chrome
- use cntr+d duplicatoin plugin https://chrome.google.com/webstore/detail/duplicate-tab-shortcut/klehggjefofgiajjfpoebdidnpjmljhb
- use saved chrome tab groups?

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

## change colorscheme colors
- go to .local/share/nvim/site/packer/packer/start
- go into the lua and replace the defautl sedction of edge with the on e under nvim/color/edge

## fun
- cmatrix

## sketchybar
- run  sketchybar --config $HOME/side-projects/SketchyBar/sketchybarrc 
- could also set upt the path as described here https://felixkratz.github.io/SketchyBar/setup
- to add a plugin:
    - create a folder in plugin
    - make it executable with chmod +x or chmod 755
    - now i t can be added as the other plugins

## resizing nvim splits
- added mappings
- vert resize: `<leader> < >`
- hor resize  `<leader> + -`
- also in neotree one can autoexpand width vie `e`

## fold
- use https://github.com/kevinhwang91/nvim-ufo!!!!! 
- small letter --> non-recursice folding
- big letter --> recursive folding 
- za/zA to toggle folds
- zm/zM to fold all functions
- zr/zR to unfold all functions
- zc — close the fold (where your cursor is positioned)
- zM — close all folds on current buffer
- zo — open the fold (where your cursor is positioned)
- zR — open all folds on current buffer
- zj — cursor is moved to next fold
- zk — cursor is moved to previous fold
- 
- zi - toggle fold, but save fold state

## Install new language
- install language server via homebrew. e.g `brew install lua-language-server` or `bew install go`
- LSPInstall <language> to install the language server
- TSInstall <language> to install the treesitter parser (syntax higlighting)


## Slack
- cmd + k -->  command line
- up/down arrow keys --> go up
- left/right to --> into tread 
- cmd + control + left/right --> go between section 
- cmd + . --> close right panel
- cmd + shift + d --> open/close nav panel 
- cmd + n --> new message
- message
    - up | cmd + up --> edit last messsage
    - e --> edit
    - r -- emoji reaction
    - u --> mark unread
    - m --> remind me 
- huddle
    - cmd + shift + h to enter huddle
    - cmd + shift + space --> mute
    - V --> video ?? or just for calls
- quick jump
    - cmd + shift + t --> treds
    - cmd + shift + a --> unread
    - cmd + shift + w --> reopen last closed window 
    - option + up/down to go up/down channels
    - cmd + u --> add file 
