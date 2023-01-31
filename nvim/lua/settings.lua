-----------------------------------------------------------------------------
-- This file contaqins all general vim settings
-----------------------------------------------------------------------------

local o = vim.o
local wo = vim.wo
-- local bo = vim.bo

o.cursorline = true
o.autoindent = true
o.cmdheight=1
o.expandtab = true
o.hidden= true
o.ignorecase= true
o.smartcase= true
o.laststatus=2
o.linebreak= true
o.matchtime=1
o.modeline = true
o.mouse='a'
o.breakindent = true
o.backup = false
o.cursorcolumn = false
o.foldenable = false
o.hlsearch = true
o.number = true
o.relativenumber= true
o.swapfile  = false
o.numberwidth=1
o.pumheight =10
o.scrolloff=0
o.shiftwidth=4
o.showcmd = true
o.showmatch= true
o.smartindent = true
o.tabstop=4
o.undofile = true
o.hidden = true
o.updatetime = 250

wo.signcolumn = 'yes'


-- always use cliboard
vim.cmd [[set clipboard=unnamed]]

-- Set completeopt to have a better completion experience
o.completeopt = 'menuone,noselect'

-- Override tab spacing for javascript and typescript and html
-- @todo: make sure we have correct tabs for e.g python also
 vim.api.nvim_command('autocmd FileType javascript setlocal shiftwidth=2 tabstop=2')
 vim.api.nvim_command('autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2')
 vim.api.nvim_command('autocmd FileType typescript setlocal shiftwidth=2 tabstop=2')
 vim.api.nvim_command('autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2')
 vim.api.nvim_command('autocmd FileType html setlocal shiftwidth=2 tabstop=2')
 vim.api.nvim_command('autocmd FileType graphql setlocal shiftwidth=2 tabstop=2')
