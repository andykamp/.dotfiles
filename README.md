List of further plugins to enchange stuff: 
- use vi mode following this [link](https://www.barbarianmeetscoding.com/blog/5-minutes-vim-enabling-vim-in-zsh)
** alot of terminal hacks are explaied here https://andrew.cloud/blog/dev-setup/
-https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts for exa icons
- exa to replace ls
- bat to replace cat
- fd to replace find (fuzzy search)
- htop to inspect performace


Some painpoints that still exists: 
- cannot use vim commands to edit vims :term commands. I only focus on the end of the input command, not where the cursor is. So the solution here is to try to use harpoon to write most commenly used commands and limit the writing in the .term. see issue at [github](https://github.com/neovim/neovim/issues/8805) 
- 

## Symlinks needed for this repo
Remember that most dotfiles har a place somewhere. Make sure they point to the links inside this dotfile repo. 
Use the `ln -s <actual existing filepath> <this will point to existing file filepath>` to create a symlink

## TODO
-  lazygit https://github.com/jesseduffield/lazygit
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


## Trial period
- use harpoon quicktoggle more
- keep gitsigns as is or revert to oldschool?
- use trouble or loclist for error/warnings?
-  use aerial as tagbar alternativ. overrides { and  } but i usually dont use that anywhat
- use <leader>fs to search for functions and symbolds
    - insp [here](https://user-images.githubusercontent.com/39233597/110256294-57385c00-7f98-11eb-86e9-9f647bb2a659.mp4)  and [here](https://www.reddit.com/r/neovim/comments/m9vwy2/search_for_class_using_telescope_and_native_lsp/)

