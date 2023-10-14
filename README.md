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

# Git diff
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

# 📈 Monitoring
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
- 

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


## change colorscheme colors
- go to .local/share/nvim/site/packer/packer/start

## fun
- cmatrix

## sketchybar
- run  sketchybar --config $HOME/side-projects/SketchyBar/sketchybarrc 
- to add a plugin:
    - create a folder in plugin
    - make it executable with chmod +x or chmod 755
    - now i t can be added as the other plugins

## fold
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
- zi - toggle fold, but save fold state

### new todos
- chrome
    - learn chrome pinned tabs etc
    - @testing: https://chrome.google.com/webstore/detail/workspaces/hpljjefgmnkloakbfckghmlapghabgfa
- yabai
    - fix jabai resize in both directions
- fzf
    - use vim shortcuts in fzf ???
    - add treeview to fuzzysearch https://pragmaticpineapple.com/four-useful-fzf-tricks-for-your-terminal/
- snippets 
    - clean up ultisnips
    - create ultinip templates for vimwiki
        - diary
        - scrum review/retrospective/etc
- multicursor in vim (like thomas)
    - multicursor on all occurences of word under cursor for example
- tests
    - vim test
    - nx tests
- lsp and treesitter
    - [✓] shortcut to autoimport (does not always happen on copy-paste!!!)
        - use code action on word!!!
    - switch sumeleku to lua_ls?
    - use info/typscript-info to get info about the current file like THOMAS
    - use the treesitter function functionality more
    - inspect more lsp options and code actions etc
    - check for jsdoc options
    - check for anchors (se lua_ls)
- vim movements
    - move faster with arrow keys see https://www.reddit.com/r/vim/comments/o26h8/ask_rvim_can_you_change_the_speed_of_cursor/
    - [✓] manouver between splits much faster
        -  use 4 c-h/l to jump between splits the same way as with vertical movementes
    - Disable j and K to test only using relative numbers + f/t !!!!!
    - setup aerial to work with depth to manouver from function to function to variable 
        - then inside a func/variable  use relative_line_number +  f/t
    - use paragraph jumping more
    - look into useage of https://github.com/easymotion/vim-easymotion. have some cool ones
    - make u and d always center the screen (zz in vim)
        - is this not the case already?
    - shortcut for openging gd in a selected pane. use the neotree functionality??
    - neotree
        - - neotree open buffer https://www.reddit.com/r/neovim/comments/rx67tf/new_features_in_neotree_open_buffers_source_added/
    - use macros more
    - use 0 and $ more instad of i and a 
    - use global rename  (quicklist and :cdo)
    - set relative numbers on neotree
- aerial
    - add nested stuff so that react tsx files work. currently there is only on level
- folds
    - fold shortcuts
    - aerial fix with depth for fast overview 
- fish
    - use fish history fuzzy search more often (ctrl+r))
    - better tab completion
    - ps fuzzy search
    - variable search
    - remove fish terminal github branch icons. never use them and dont know what they mean
- lsp
    - use code action `leader+c` more often
    - renamin using https://github.com/smjonas/inc-rename.nvim 
    - consider lspsaga
    - improved code-action UI (https://elijahmanor.com/blog/neovim-tmux )
    - learn to use the cdo command
        - use `:cdo s/old_name/new_name` to replace across buffers do `:cdo s/old_name/new_name | update`. i this we dont need the `$ and the /g` because we already have the spesific loaation in the quicklist
    - [✓] shorcut to replace all higlighted texts in file with whatever i type in!!
        - leader-rn will do this now
- [quicklist](quicklist) using :cdo
    - https://github.com/gabrielpoca/replacer.nvim
- tmux
    - use <prefix>+  z to toggletmux zoom . Can be used to show termnial on left side!!! (see https://elijahmanor.com/blog/neovim-tmux)
    - change tmux status background ??
    - other tmux shortcut for copy [mode](mode)
- marks
    - start using them more
    - use harpoon more
    - make harpoonn and marks more similar in mapping
    - make mark/harpoon stick to line number in the opened file also
    - use some anchor plugin for @todo @note etc?
- misc
    - setup environment for quick tests
    - use codepen etc to test out stuff quickly(but need to be wim)
- github tree
- COLORSCHEME 
    - more black/gray/white
    - diffuse the non-important code stuff. want the important stuff to POP while the rest is in the background
    - fix colorscheme for pomordory timer aswell
    - use mikaels div setup
    - use pywal to generate colorscheme???
- look at https://github.com/atidyshirt/MacOS-Dotfiles for inspiration

- tiptop alternative thatt does not hog memory/cpu
- better tmux bar?
- shortcut for control+a (choose everything) 
- alfred settings: make slack come up on s
- clean mail (gmail and outlook)
pomodoro
- remove github options in startupship
- check out chrome "fest fane" vs the tab manager
desk
- checkout opitions for ergodox stand where curretn headphones are
- remarkable stand
- laptop stand for home
yabai fixes:
- fix focus etc like here? https://github.com/koekeishiya/yabai/issues/475
- fixed workspace tabs? nice because i cannot go to 89
- higlight what is the active tab? https://github.com/koekeishiya/yabai/issues/565
- fix multi monitor yabai workspace 
lsp
- remove unused lsp
- look at pategoen lsp

- set tmux statusbar to update less (smaller interval)
- 
- undotree
- make the pomodoro visible for single-monitor also!! make the popup sound/bigger etc
- set border around each app to higlight the one that is active


- [X] clean disk space 
    - [X] clean my mac 
    - create script to detect and/or remove all node-modules in a folder
    - remove old placepoint repos
    - move all old ragnarock stuff over to a minnepinne
    - move stuff to icloud??
    - create a polycy for desctop storage... always delete? or never put stuff there. with cleanshot i can maybe create a "proof" folder to put it in?
    - create shortcut to remove hj 
    - update to new mac (check if yabai needs to be updated aswell? :0)
    - rename all path
    - remove/disable icloud bilder
    - go trough side project
        - delete unused repos
        - make sure they have a github account
            - make sure i have a naming standard for done/experimental/done projects
            - or maybe prefix [side]
            - or just have a banner in the readme!
            - find some cool open source ways to write the readmes like [this](https://stackoverflow.com/questions/58737436/how-to-create-a-good-looking-notification-or-warning-box-in-github-flavoured-mar)
            - 
        - add private repos for rvs, ragnario and ragnaock account
        - 
- write the essential apps down
    - postman and hoppscotch.io
    - ....
- delete unused stashes and branches (locally and remotely)
- use tags for how completed a repo is like this https://github.com/dense-analysis/neural
- make markdown files dropdowns  like below 

<details>
<summary>How do I dropdown?</summary>
This is how you dropdown.
</details>

<details><summary><a href="https://hello.ca">link text</a></summary>

Works!

</details>

- make comment-out work for jsx
- [Ancher] document the use of @todo, @note, @fixme etc. maybe look at plugins or atleast some custom shortcuts?
    - for file
    - for nearest folder
    - for projects
    - for git repo
    - only created by meonly created by me??
    - use https://github.com/folke/todo-comments.nvim
- move vimwiki to github. just put it into a git repo and push occacially
- create a open in new vertival split shortcut!!
- remove shorctus on <leader>c so that code-actions are faster. dont need chatGPT
- create script to start yabai, skhd and sketchybar
- create the pomodory timer in sketchybar so i can use it for non-programming also!!
- make lock screen use the same background as the desktop (https://www.idownloadblog.com/2023/02/13/how-to-change-lock-screen-wallpaper-mac/)
- relative numbers on neotree! important!!!! just run autocomman on neotree open
- test mikaels implementation of js/ts manouvering
- create a own todo.md for all todos because they are messsssy
- fix tmux bar and limelight bar in vim
- remove old stuff from tmux configs
- fix tailwind automcomlete
- fix eslint/prettier in placepoint (might need to add prettier in repo)
- fix sketchybar
- move sketchybar to dotfiles
- remove all unused configs and put them into a tried-and-failed.lua file that is not imported into app
- cleanup startship colors and unused stuff
- make colors into a global file maybe??
- fix tmux active pane style (or atleast border style to indicate what is active)
- set he yabai transparancy isntead of just alacritty ?? yabai -m config window_opacity               off
- colorschema
    - create own colorschema repo with minimal colors so i know which color is actually what
    - fix colorschema for markdown etc so i know what they are
- movement
    - add the barbarian vim movements so i can go to argumetns etc
    - use harpoon more
    - use marks more
- make a chrome theme to match
- SHAVE OF TYPING SECONDS: cntr+ w for backspace? 
- tmp file
    - have a way to always create a tmp file of a certain file type
    - like thomas does
- fix folding
- use :Telescope resume and create a shortcut foGr it
- 
- shortcuts to go up/down quicklist when open....
- use unimpared for shorcuts for quickfix and others
- shortcut for cdo for renaming
- shortcut for copypasting the error under the cursor
- use the <command>k together with <command>l in copilot in order to get multiple suggestions
- snippr tabs does not work
- saving tmux session is on some weird key
- better tyepscript definitions with lsp
    - maybe lssage? https://github.com/nvimdev/lspsaga.nvim
    - https://nvimdev.github.io/lspsaga/definition/
- POMODORO
    - create a blocking flaoting panel showing a coffe for the break of the pomodoro
- FOLDS
    -  i need to be able to fold large json and arrays...
    - make folding look like in vscode
    - remove the fill-char by : : set fillchars=fold:\ (https://stackoverflow.com/questions/4614048/custom-folding-in-vim) 
    - 
