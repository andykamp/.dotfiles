-----------------------------------------------------------------------------
-- This file contains all keymappings for general vim and for pluginsh
-----------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap



--Remap space as leader key
map('n', '<Space>', '', {})
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap (with this wrapped lines are treated as individual lines)
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })


local options = { noremap = true }

-- personally more intuitiv with ; for forward and shift+; for backward. Default is other way around
-- TODO


-- oscyank
map('v', '<leader>c', ':OSCYank<CR>', options)

-- jk is escapr
map('i', 'jk', '<esc>', options)

map('n', 'J', '5j', options)
map('n', 'K', '5k', options)
map('v', 'J', '5j', options)
map('v', 'K', '5k', options)

-- UPS overriding '<tab>' breaks <c-i> seeing they are strictly eqvivalent..
-- map('n', '<Tab>', 'gt', options)
-- map('n', '<S-Tab>', 'gT', options)

-- stop higlighting searches
map('n',  '<leader>,',  ':nohlsearch<CR>', options)

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



-- Set timestampp

map('n', '<leader>wt', ":put =strftime('%c')<CR>", options)


-- get path of current file

-- relative path
map('n', '<leader>br', ':let @+ = expand("%") <CR>', options)
-- full path
map('n', '<leader>ba', ':let @+ = expand("%:p") <CR>', options)
--just filename
map('n', '<leader>bn', ':let @+ = expand("%:t") <CR>', options)

