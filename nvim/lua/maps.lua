-----------------------------------------------------------------------------
-- This file contains all keymappings for general vim and for pluginsh
-----------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

--Remap space as leader key
map('n', '<Space>', '', {})
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap (with this wrapped lines are treated as individual lines)
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- jk is escape
map('i', 'jk', '<esc>', options)

-- movement
map('n', 'J', '5j', options)
map('n', 'K', '5k', options)
map('v', 'J', '5j', options)
map('v', 'K', '5k', options)

-- stop higlighting searches
map('n',  '<leader>,',  ':nohlsearch<CR>', options)

-- close loclist/quiclist
map('n', '<leader>.', ':cclose<CR>', options)

-- keep cursor on bottom when yanking
map('v', 'y', 'ygv<esc>', options)

-- manouver tabs and split fast
map('n',  '<C-h>', '<C-W>h', options)
map('n',  '<C-j>', '<C-W>j', options)
map('n',  '<C-k>', '<C-W>k', options)
map('n',  '<C-l>', '<C-w>l', options)

--  save a paste to be abale to do it multiple times in a row
map('x', '<leader>p', "\"_dhp", options)

--  terminal mappings
map('t', '<C-x>', '<C-\\><C-n>', options)
map('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', options)
map('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', options)
map('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', options)
map('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', options)
map('t', '<C-o>', '<C-\\><C-n><C-o>', options)

-- marks
map('n', "æ", "'", options)

-- get relative path
map('n', '<leader>br', ':let @+ = expand("%") <CR>', options)
-- get full path
map('n', '<leader>ba', ':let @+ = expand("%:p") <CR>', options)
-- get just filename
map('n', '<leader>bn', ':let @+ = expand("%:t") <CR>', options)


-- renmaing file 
-- map('n', '<leader>rn', ':IncRename ', options) -- did not work properly
map('n', '<leader>rn', ':%s/<C-r><C-w>//g<Left><Left>', options)


