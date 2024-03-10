# .dotfiles Todos

## new year resolution
-  end day retro
-  better test pipeline 
-  use stash names 
    - git stash push -m "should use name for long-living-stashes"
- get to 100 wpm typing speed
- start dressign up
- try to be less self aware in every singlge moment. always be in the moment. Whatever else i can do nothing about. appearanse, er whatever. if i glow of un-self-awareness i win. 
- keep appearnce up to date (harikut, tan etc all eyar around. new year new me.. be a better person next time i meat someone)
- use calendar
- clean and use gmail optimally
- better financial overview
- keep dotfiles clean an minimalistic
- keep removed github branches deleted and clean
- be epic. act like a senior in everything. anders is a brand
 
## @todo: seperate into "fix" and "keep-in-mind"
- maybe use @note to denote "keep-in-mind"
- separate todo and notes/readme into different files

- movement
    - more generic snippets? https://github.com/rafamadriz/friendly-snippets

    - yank is very enoying. tpope created some util for this...
    - use macros
    - always relative numbers on neotree
    - set z to be in the middle always on U and D (primagen?)
    - fix the pair parantenses color from white....
    - fix <leader>D shortcut
    - use zz to center the screen around the cursor (M will move cursor to current midscreen)
    - shortcut to format arguments/object properties in one line or with newline 
    - FOLDS
        - use https://github.com/kevinhwang91/nvim-ufo!!!!! 
        - fold shortcuts
        -  i need to be able to fold large json and arrays...
        - make folding look like in vscode
            - remove the fill-char by : : set fillchars=fold:\ (https://stackoverflow.com/questions/4614048/custom-folding-in-vim) 
    - snippr tabs does not work
    - [X] shortcuts to go up/down quicklist when open....
    - use unimpared for shorcuts for quickfix and others
    - shortcut for cdo for renaming
    - shortcut for copypasting the error under the cursor
    - use the <command>k together with <command>l in copilot in order to get multiple suggestions
    - use :Telescope resume and create a shortcut foGr it
    - SHAVE OF TYPING SECONDS: cntr+w  and cntr+hfor backspace 
    - add the barbarian vim movements so i can go to argumetns etc
    - test mikaels implementation of js/ts manouvering
    - relative numbers on neotree! important!!!! just run autocomman on neotree open
    - [X] remove shorctus on <leader>c so that code-actions are faster. dont need chatGPT
    - create a open in new vertival split shortcut!!
    - [X] make comment-out work for jsx
    - use undotree more
    - shortcut for control+a (choose everything) 
    - [quicklist](quicklist) using :cdo
        - https://github.com/gabrielpoca/replacer.nvim
    - use macros more
    - use 0 and $ more instad of i and a 
    - use global rename  (quicklist and :cdo)
    - set relative numbers on neotree
    - use hop more?
    - [X] add a open go-to in next window `:vs + gd`
    - make u and d always center the screen (zz in vim)
        - is this not the case already?
    - Disable j and K to test only using relative numbers + f/t !!!!!
    - move faster with arrow keys see https://www.reddit.com/r/vim/comments/o26h8/ask_rvim_can_you_change_the_speed_of_cursor/
    - manouver between splits much faster
        -  use 4 c-h/l to jump between splits the same way as with vertical movementes
    - use paragraph jumping more
    - marks
        - add @cr: comments to the todo-comments
        - start using them more
        - use harpoon more
        - make harpoonn and marks more similar in mapping
        - make mark/harpoon stick to line number in the opened file also
        - use some anchor plugin for @todo @note etc?
        - better todo and note list shorcuts!!! need to build by workflow around it. use it as marks!!!!
        - [Ancher] document the use of @todo, @note, @fixme etc. maybe look at plugins or atleast some custom shortcuts?
            - for file
            - for nearest folder
            - for projects
            - for git repo
            - only created by meonly created by me??
            - use https://github.com/folke/todo-comments.nvim

    - shortcut for openging gd in a selected pane. use the neotree functionality??
    - personally more intuitiv with ; for forward and shift+; for backward. Default is other way around
    - add 15j 15k to vim fugitivea
    - use $ and 0 more for movement. remap the ^ to somethign useable
    - get new top vim shortuts (see redit no phone)
    - use riw insted of ciw/diw
    - quiclist actions! rename every file etc
    - lsp and treesitter
        - autocomplete
        - completion by default when i enter inset mode .. now i have to start typing
        - fix eslint/prettier in placepoint (might need to add prettier in repo)
        - look at pategoen lsp
        - use code action `leader+c` more often
        - shortcut to autoimport (does not always happen on copy-paste!!!)
            - solution: use code action on word!!!
        - switch sumeleku to lua_ls??
        - use info/typscript-info to get info about the current file like THOMAS
        - use the treesitter function functionality more
        - shortcuts
        - check for jsdoc options
        - check for anchors (se lua_ls)
        - renamin using https://github.com/smjonas/inc-rename.nvim 
        - consider lspsaga
        - improved code-action UI (https://elijahmanor.com/blog/neovim-tmux )
        - [X] learn to use the cdo command
            - use `:cdo s/old_name/new_name` to replace across buffers do `:cdo s/old_name/new_name | update`. i this we dont need the `$ and the /g` because we already have the spesific loaation in the quicklist
        - [X] shorcut to replace all higlighted texts in file with whatever i type in!!
            - leader-rn will do this now
        - better tyepscript definitions with lsp
            - maybe lssage? https://github.com/nvimdev/lspsaga.nvim
            - https://nvimdev.github.io/lspsaga/definition/
            - snippets 
                - clean up ultisnips
                - create ultinip templates for vimwiki
                    - [X] diary
                    - [X] scrum review/retrospective/etc
    - multicursor in vim (like thomas)
        - multicursor on all occurences of word under cursor for example
    - neotree
        - neotree open buffer https://www.reddit.com/r/neovim/comments/rx67tf/new_features_in_neotree_open_buffers_source_added/


- tmux
    - better shortcuts for/in copy mode?
    - saving tmux session is on some weird key
    - fix higlighting on active panes in tmux. atleast fix border highlight
    - POMODORO
        - get it into dotfiles
        - make sure the clock color is same in tmux, sketchybar and own skript
        - create a blocking flaoting panel showing a coffe for the break of the pomodoro
            - see conversation: https://chat.openai.com/share/ba990ead-297d-449b-92b9-69cc671a4d97
            - currently only using osascript -e 'display notification "message"'
            - osascript -e 'tell app "System Events" to display dialog "Time is up!"'
            - osascript -e 'display notification "Time is up!" with title "Pomodoro Timer"'
            - osascript -e 'tell app "System Events" to choose from list {"Break", "Continue"} with title "Pomodoro Timer" with prompt "What next?"'
        - make the pomodoro visible for single-monitor also!! make the popup sound/bigger etc
    - set tmux statusbar to update less (smaller interval). same with sketchybar
    - use <prefix>+  z to toggletmux zoom . Can be used to show termnial on left side!!! (see https://elijahmanor.com/blog/neovim-tmux)
    - change tmux status background ??
    - other tmux shortcut for copy [mode](mode)
    - add tmux vim. map jk so that it is similar to how neovim is now. but also fix the "i" so it dont just go to default
    - entire line of tmux to higlight on tmux-key pressed
    - make tmux-session take in the target paths and great a <command>+g to go to alternative path
    - fix tmux bar and limelight bar in vim

- terminal
    - remove zsh, neofetch bash?
    - remove neofetch
    - remove github options in startupship
    - warp terminal
    - add timestamp to terminal
    - remove fish stuff that is not used..
    - i want fish vim to higlight instert/vim mode so i know if i can scroll etc
    - fzf
        - use vim shortcuts in fzf ???
        - add treeview to fuzzysearch https://pragmaticpineapple.com/four-useful-fzf-tricks-for-your-terminal/
    - fish
        - use fish history fuzzy search more often (ctrl+r))
        - better tab completion
        - ps fuzzy search
        - variable search
        - remove fish terminal github branch icons. never use them and dont know what they mean
    - cleanup startship colors and unused stuff

- vimwiki
    - vim diary creates a local path.. dont want that 
    - shortcuts for wimwiko to go back and forth between notes
    - figure out why wimwiki and diary opens in wrong folder sometimes
    - move vimwiki to github. just put it into a private git repo and push occacially

- insp 
    - get insp for dotfiles from  https://github.com/joshmedeski/dotfiles
    - add https://apps.apple.com/no/app/network-battery/id1387780159?mt=12
    - look at https://github.com/atidyshirt/MacOS-Dotfiles for inspiration

- worflow
    - shortcut to close all notification
    - write the essential apps/workflow down in readme
        - postman and hoppscotch.io
        - ....
    - use tabs to split up backend/frontend vim files??
    - use pomodoro for non-programming tasks also @note
    - creat script for setting up entire dotfile
    - create script to start yabai, skhd and sketchybar
    - create internal @todo for how to set up
    - sketchybar
        - fix sketchybar
        - move sketchybar to dotfiles
    - yabai
        - turn of yabai on everything but chrome, slack and alacrity. Everything else is just annoying? finder might also be nice to have in yabai?
            - or look into options for monitor switch .... because not all panes go to 1st workspace. should keep the existing workspaces...
        - [X] fix jabai resize in both directions
        - fix focus etc like here? https://github.com/koekeishiya/yabai/issues/475
            - need to disable security
        - fixed workspace tabs? nice because i cannot go to 89
        - higlight what is the active tab? https://github.com/koekeishiya/yabai/issues/565
        - fix multi monitor yabai workspace 
            - need to disable security
        - set he yabai transparancy isntead of just alacritty ?? yabai -m config window_opacity               off
    - chrome
        - [X] learn chrome pinned tabs etc
    - playground and js tests
        - setup environment for quick tests
        - use codepen etc to test out stuff quickly(but need to be wim)
        - tmp file
            - have a way to always create a tmp file of a certain file type
            - like thomas does
    - a pasteapp.io for pasting history
    - setapp - markedplace for alle mulige kule apper
    - look into chrome shortcuts 
        - open/close all shortcuts
    - is https://activitywatch.net/ a good all-app tracker?
    - clean mail (gmail and outlook)

desk
- checkout opitions for ergodox stand where curretn headphones are
- remarkable stand
- laptop stand for home


- testing
    - test workflow needs to be improved

- appearance
    - make colors into a global file maybe??
    - set border around each app to higlight the one that is active
    - [X] opacity on all backgrounds
    - [X] costumize vimium colors to be pink
    - toggle padding on smaller screen
    - see image on phone for font etc
    - chrome same color as github
    - jira black theme same color as chrome
    - use dressing for UI?
    - 
    - COLORSCHEME 
            - insp 
                - see https://vscodethemes.com/e/sldobri.bunker/dobri-next-a00-black?language=javascript
            - update vimium color
            - experiment with highlight MyGroup guifg=#FF0000 guibg=#FFFF00
            - matching parantesematching parantesess
                - highlight MatchParen ctermbg=white guibg=white
            - icons
                - icons have very weird colors
                - tried to add the nvim-web-devicons, but it does not work....
                - can update the config (see https://github.com/nvim-tree/nvim-web-devicons/tree/master)
                - can fix manually (see https://github.com/bryanmylee/vim-colorscheme-icons) 
            - markdown is very white
            - string values are to neon. should be more dimmed
            - yellow is to ugly and bright
 
        - fork edge color and use that 
        - remap the green to red? looked nice, but maybe more towards github
        - more black/gray/white
        - diffuse the non-important code stuff. want the important stuff to POP while the rest is in the background
        - fix colorscheme for pomordory timer aswell
        - use mikaels div setup
        - use pywal to generate colorscheme???
    - colorschema
        - create own colorschema repo with minimal colors so i know which color is actually what
        - fix colorschema for markdown etc so i know what they are
        - use it as often as possible, and make it fit with ANDERS BRAND 
    - make a chrome theme to match setup
    - tiptop alternative thatt does not hog memory/cpu
    - make lock screen use the same background as the desktop (https://www.idownloadblog.com/2023/02/13/how-to-change-lock-screen-wallpaper-mac/)

- github
    - remove old github branches (BUT NOT TERRRACE_MVP)
    - use github workspaces
    - delete unused stashes and branches (locally and remotely) PERIODICALLY
    - use tags for how completed a TAP-repo is like this https://github.com/dense-analysis/neural
    - make markdown files dropdowns  like below 
        ```
        <details>
        <summary>How do I dropdown?</summary>
        This is how you dropdown.
        </details>
        <details>
        <summary><a href="https://hello.ca">link text</a></summary>
        Works!
        </details>
        ```

## unsorted TODOES
- gitdiffs
    -  @todo: check master vs main and also if on master/main exclude the --range so we get everything. will currently fail
- unify dotfiles
    - copypaste pomodoro to dotfiles
    - copypaste sketchybar to dotfiles
    - create a startupscript that can be accessed from dotfile root that
        - ** if not already started
        - start pomodoro
        - starts sketchybar
        - initiates yabai and skhd 
        - verifies if yabai has the nessesarry permissions
        
- mobile images

    - select, swap, move and peek
- leap.nvim
- clever-f: https://github.com/rhysd/clever-f.vim?tab=readme-ov-file
- flit.nvim
- quick-scope.nvim
- flash.nvim
- ADD THE VISUAL SELECTION EXPAND FOR THOMAS
- https://github.com/christoomey/vim-tmux-navigator to move along vim and tmux
- resize tmux split. hide/show split (so i can have vim and tmux open, instead of using vim tab with terminal)
- prefix- N for backward  
- transient prompts:      https://ohmyposh.dev/docs/configuration/transient#:~:text=Transient%20prompt%2C%20when%20enabled%2C%20replaces,the%20previous%20primary%20prompt%20run
- wez terminal ?
- use signature/hover inside insert to show all types
- replace s with /
- :TodoTelescope or :TodoTrouble
- open last split file
- use lsp sage and nvim-bqf like thomas for info manouvering
- GO-TO function/const name. so that i can go to definition. maybe a w/b for next signature or something?
- @thomas: fyi, ser du bruker en gammel versjon av colorizer, nvchad har forket en nyere versjon her: https://github.com/NvChad/nvim-colorizer.lua 
    - tailwind=true i config for å få taiwind farger inline
    - også color preview i viturel texts <3
- https://flak.tedunangst.com/post/terminal-smooth-scrolling
- hotkey for disaple line wrapping (option + z)
- og kan pipe output til nvim buffer slik at man kan formattere.
- terminal commands/tools (unix utils)
    - bruke e.g ls | xargs for å formattere input/params til neste input. feks finn alle png via ls, pipe gjennom xargs også pipe til en annen kommando
    - sed (streaming editor). search and replace in files. kan brukes som command line util
    - jq (json query). bruke dotpath til a gjore operations på objects. see primagen video
    - OBS: forsiktig med å bruke xargs med rm etc. bedre å først outputte til cat/bat/less for verifisering også pipe til rm etterpå
-make the keyReapeat and InitalKeyRepoeat faster. The UI settings are not fast enough
- consider using delayTrain.nvim. it is a plugin that trains the delay of the keypresses so i cannot hammer the hjkl keys

- use [% and ]& and [m and ]m  and [{ and ]} to jump between scopes : https://vi.stackexchange.com/questions/16829/moving-to-an-outer-block
- 
- skru av automatic comment continuation for line comments, men beholde det for block comments. irr når man tar o i normal mode også må man ta cc for å escape kommentaren 
- relative line numbers on neotree!!getMatchingService!
- use more text-objects. found a site with the extra ones 
- Chrome devtool shortcuts
- gitSigns for entire PR: https://github.com/lewis6991/gitsigns.nvim/issues/268
- harpoon relative marks.  currently it is static
- octo.nvim for github review
- yadm dotfile manager
- do i need ultisnippets??? rewrite the entire lsp stuff with readme and setup script
- switch typescript server? https://github.com/pmizio/typescript-tools.nvim
- multi cursor? https://github.com/mg979/vim-visual-multi
- auto session (also for tmux maybe): https://github.com/rmagatti/auto-session
