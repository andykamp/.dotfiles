" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.1+  and nvim jointly and expects you to have Plug installed.
" -----------------------------------------------------------------------------

if !has('nvim')
    set ttymouse=xterm2
endif

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/name

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'ellisonleao/glow.nvim'
Plug 'preservim/tagbar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jo/Users/anderskampenes/Downloads/nvim\ 2/after shdick/onedark.vim'
Plug 'itchyny/lightline.vim'ja

" Initialize plugin system
call plug#end()


" -----------------------------------------------------------------------------
" General mappings 
" -----------------------------------------------------------------------------

set number      " show line numbers
syntax enable       " enable syntax processing
colorscheme onedark     "onedark for atom

" Spaces and tabs 
set tabstop=4       "number of white spaces in a tab
set autoindent      "automatic indentation
set expandtab       "replace tabs with whitespaces
set softtabstop=4

" UI con longer on capital K normal modeig
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

let mapleader = " "

" jk is escape
inoremap jk <esc>     

" Clear search highlights.
nnoremap <leader>, :nohlsearch<CR> 

" space open/closes folds
nnoremap <space> za


"5 times longer on capital J 
nnoremap J 5j 
vnoremap J 5j 
"5 times longer on capital K 
nnoremap K 5k 
vnoremap K 5k 

"join lines-without this the capital J fucks up 
nnoremap <leader>j J 
vnoremap <leader>j J 

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>


" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------


" .....................................................
" nvim-treesitter 
" .....................................................

lua <<EOF

require("nvim-treesitter.configs").setup {
   -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {""},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    disable = {""},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

EOF

" .....................................................
" Press - to check a checkbox in markdown
" .....................................................

function Check()
    let l:line=getline('.')
    let l:curs=winsaveview()
    if l:line=~?'\s*-\s*\[\s*\].*'
        s/\[\s*\]/[.]/
    elseif l:line=~?'\s*-\s*\[\.\].*'
        s/\[.\]/[x]/
    elseif l:line=~?'\s*-\s*\[x\].*'
        s/\[x\]/[ ]/
    endif
    call winrestview(l:curs)
endfunction

autocmd FileType markdown nnoremap <silent> - :call Check()<CR>

" .....................................................
" Telescope
" .....................................................

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" .............................................................................
" scrooloose/nerdtree
" .............................................................................

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" .....................................................
" Tagbar
" .....................................................

let g:tagbar_autofocus = 1

nnoremap <leader>tt :TagbarToggle<CR>

" .....................................................
" NERDtree and tagbar
" .....................................................

function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nnoremap <leader>nt :call ToggleNERDTreeAndTagbar()<CR>

" .....................................................
" vimwiki
" .....................................................

noremap <CR> :VimwikiFollowLink<cr>
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css=fnameescape($HOME).'/.local/lib/github-markdown-css/github-markdown.css'

" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.1+  and nvim jointly and expects you to have Plug installed.
" -----------------------------------------------------------------------------

if !has('nvim')
    set ttymouse=xterm2
endif

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/name

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'ellisonleao/glow.nvim'
Plug 'preservim/tagbar'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jo/Users/anderskampenes/Downloads/nvim\ 2/after shdick/onedark.vim'
Plug 'itchyny/lightline.vim'ja

" Initialize plugin system
call plug#end()


" -----------------------------------------------------------------------------
" General mappings 
" -----------------------------------------------------------------------------

set number      " show line numbers
syntax enable       " enable syntax processing
colorscheme onedark     "onedark for atom

" Spaces and tabs 
set tabstop=4       "number of white spaces in a tab
set autoindent      "automatic indentation
set expandtab       "replace tabs with whitespaces
set softtabstop=4

" UI con longer on capital K normal modeig
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu        " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

let mapleader = " "

" jk is escape
inoremap jk <esc>     

" Clear search highlights.
nnoremap <leader>, :nohlsearch<CR> 

" space open/closes folds
nnoremap <space> za


"5 times longer on capital J 
nnoremap J 5j 
vnoremap J 5j 
"5 times longer on capital K 
nnoremap K 5k 
vnoremap K 5k 

"join lines-without this the capital J fucks up 
nnoremap <leader>j J 
vnoremap <leader>j J 

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>


" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------


" .....................................................
" nvim-treesitter 
" .....................................................

lua <<EOF

require("nvim-treesitter.configs").setup {
   -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {""},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    disable = {""},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

EOF

" .....................................................
" Press - to check a checkbox in markdown
" .....................................................

function Check()
    let l:line=getline('.')
    let l:curs=winsaveview()
    if l:line=~?'\s*-\s*\[\s*\].*'
        s/\[\s*\]/[.]/
    elseif l:line=~?'\s*-\s*\[\.\].*'
        s/\[.\]/[x]/
    elseif l:line=~?'\s*-\s*\[x\].*'
        s/\[x\]/[ ]/
    endif
    call winrestview(l:curs)
endfunction

autocmd FileType markdown nnoremap <silent> - :call Check()<CR>

" .....................................................
" Telescope
" .....................................................

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" .............................................................................
" scrooloose/nerdtree
" .............................................................................

let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=0

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" .....................................................
" Tagbar
" .....................................................

let g:tagbar_autofocus = 1

nnoremap <leader>tt :TagbarToggle<CR>

" .....................................................
" NERDtree and tagbar
" .....................................................

function! ToggleNERDTreeAndTagbar()
    let w:jumpbacktohere = 1

    " Detect which plugins are open
    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    " Perform the appropriate action
    if nerdtree_open && tagbar_open
        NERDTreeClose
        TagbarClose
    elseif nerdtree_open
        TagbarOpen
    elseif tagbar_open
        NERDTree
    else
        NERDTree
        TagbarOpen
    endif

    " Jump back to the original window
    for window in range(1, winnr('$'))
        execute window . 'wincmd w'
        if exists('w:jumpbacktohere')
            unlet w:jumpbacktohere
            break
        endif
    endfor
endfunction
nnoremap <leader>nt :call ToggleNERDTreeAndTagbar()<CR>

" .....................................................
" vimwiki
" .....................................................

noremap <CR> :VimwikiFollowLink<cr>
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css=fnameescape($HOME).'/.local/lib/github-markdown-css/github-markdown.css'

