-----------------------------------------------------------------------------
-- This file contaqins all general vim settings
-----------------------------------------------------------------------------

local o          = vim.o
local wo         = vim.wo
local bo         = vim.bo
-- local bo = vim.bo

bo.softtabstop   = 2
o.cursorline     = true
o.autoindent     = true
o.cmdheight      = 1
o.expandtab      = true
o.hidden         = true
o.ignorecase     = true
o.smartcase      = true
o.laststatus     = 2
o.linebreak      = true
o.matchtime      = 1
o.modeline       = true
o.mouse          = 'a'
o.breakindent    = true
o.backup         = false
o.cursorcolumn   = false
o.foldenable     = false
o.hlsearch       = true
o.number         = true
o.relativenumber = true
o.swapfile       = false
o.numberwidth    = 1
o.pumheight      = 10
o.scrolloff      = 0
o.showcmd        = true
o.showmatch      = true
o.smartindent    = true
o.tabstop        = 2
o.shiftwidth     = 2
o.undofile       = true
o.hidden         = true
o.updatetime     = 250
o.linespace      = 2
o.termguicolors  = true


wo.signcolumn = 'yes'

-- fold color
-- vim.cmd [[ highlight Folded guibg=#d38aea]]

-- always use cliboard
vim.cmd [[set clipboard=unnamed]]

-- set higlight on parantes/brachet/... matches
vim.cmd [[ highlight MatchParen ctermfg=yellow guifg=yellow ]]

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- Override tab spacing for javascript and typescript and html
vim.api.nvim_command('autocmd FileType javascript setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType typescript setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType html setlocal shiftwidth=2 tabstop=2')
vim.api.nvim_command('autocmd FileType graphql setlocal shiftwidth=2 tabstop=2')

-----------------------------------------------------------------------------
-- Highlight on yank
-----------------------------------------------------------------------------
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-----------------------------------------------------------------------------
-- autocammand setting .mdx to markdown
-----------------------------------------------------------------------------
vim.cmd [[
    autocmd BufNewFile,BufRead *.mdx :set filetype=vimwiki
]]

-----------------------------------------------------------------------------
-- folds
-- @todo: not really used...
-----------------------------------------------------------------------------
vim.cmd [[set foldmethod=expr]]
vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
vim.cmd [[set nofoldenable]]
vim.cmd [[set foldlevelstart=99]] --start file with all folds opened
-- vim.cmd [[
-- augroup MyTreesitterFolding
--     autocmd!
--     autocmd BufEnter * set foldmethod=expr
--     autocmd BufEnter * set foldexpr=nvim_treesitter#foldexpr()
--     autocmd BufEnter * set nofoldenable
--     autocmd BufEnter * set foldlevelstart=99
-- augroup END
-- ]]
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.wo.foldenable = false
-- -- vim.g.foldlevelstart = 99

-----------------------------------------------------------------------------
-- virtual-colors aka hovered diagnostics
-----------------------------------------------------------------------------
vim.cmd [[highlight VirtualTextError guifg=#f97583]]
vim.cmd [[highlight VirtualTextWarning guifg=#ffea7f]]
-- vim.cmd [[highlight VirtualTextInfo guifg=#10B981]]
-- vim.cmd [[highlight VirtualTextHint guifg=#0db9d7]]

-----------------------------------------------------------------------------
-- Diagnostic icons for nerdtreee and gutter
-----------------------------------------------------------------------------
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" })

-- Set textwidth for Git commit messages
vim.cmd [[
  autocmd FileType gitcommit setlocal textwidth=150
]]
