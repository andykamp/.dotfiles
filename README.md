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


**Note**: Remember that most dotfiles har a place somewhere. Make sure they point/symlink to the links inside this dotfile repo. 
Use the `ln -s <actual existing filepath> <this will point to existing file filepath>` to create a symlink
This must be done for (might be missing some):
- nvim
- vimrc
- zshrc
- .zsh_profile
- 

## 🙇 Worth remembering
- terminal commands and replacements descibed [here](https://andrew.cloud/blog/dev-setup/)
- exa to replace ls
- bat to replace cat
- fd to replace find (fuzzy search)
- htop to inspect performace
- https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts for exa icons



## 🤷 TODO look into
- hold w, b, e, or j/k to go superfast. Could consider it if I speeeeeeeed up the button delay. 
- lazygit https://github.com/jesseduffield/lazygit
- use this fzf for completion?? https://github.com/Aloxaf/fzf-tab
- always open tmux when using ff (see https://www.youtube.com/watch?v=bdumjiHabhQ&t=5s)
- use fzf for more usecasess https://www.youtube.com/watch?v=qgG5Jhi_Els
- mimic this worfkflow? https://elijahmanor.com/blog/neovim-tmux
- cool setup https://github.com/AstroNvim/AstroNvim/tree/main/lua/configs or https://elijahmanor.com/blog/neovim-tmux
- tag manaement. does gutentags do anything?
- Neovim Session Manager for being able to close and reopen sessions again
- tmux
    - use https://github.com/tmux-plugins/tmux-resurrect or https://github.com/tmuxinator/tmuxinator
- session manager? https://github.com/Shatur/neovim-session-manager
- best workflow ever by primagen https://www.youtube.com/watch?v=bdumjiHabhQ&t=5s
- terminal alias/worklows
    - utilize htop better to identify 
    - alias for lsof -i tcp:3000 etc. maybe use fzf completion to find open ports? 
    - alias for kill -9 
    - alias for getting own ip adress
- Remove bashrc and bash_profile when i use zsh
- Remove vimrc? or maybe make it super up-to-date without plugins to utilize it on remote servers etc?
- Add script to dynamically create all files and symlinks ? 


## 💡 Currently experimenting with 
- use harpoon quicktoggle more
- keep gitsigns as is or revert to oldschool?
- use trouble or loclist for error/warnings?
-  use aerial as tagbar alternativ. overrides { and  } but i usually dont use that anywhat
- use <leader>fs to search for functions and symbolds
    - insp [here](https://user-images.githubusercontent.com/39233597/110256294-57385c00-7f98-11eb-86e9-9f647bb2a659.mp4)  and [here](https://www.reddit.com/r/neovim/comments/m9vwy2/search_for_class_using_telescope_and_native_lsp/)

## 😩 Existing painpoints
- zsh 
    -  cannot use vim commands to edit vims :term commands. It only focus on the end of the input command, not where the cursor is. So the solution here is to try to use harpoon to write most commenly used commands and limit the writing in the .term. see issue at [github](https://github.com/neovim/neovim/issues/8805) 
- workflow
    - context switching overhead: to many tabs to keep track of for frontend + server + misc  
- sometimes lag  
