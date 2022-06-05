local map = vim.api.nvim_set_keymap

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

local options = { noremap = true }

-- map nerdtree switch to active file
map('n', '<leader>r', ':NERDTreeFind<cr>', options)

-- oscyank
map('v', '<leader>c', ':OSCYank<CR>', options)

-- jk is escapr
map('i', 'jk', '<esc>', options)

map('n', 'J', '5j', options)
map('n', 'K', '5k', options)
map('v', 'J', '5j', options)
map('v', 'K', '5k', options)

-- TODO not working cycle trough tabs
map('n', '<Tab>', 'gt', options)
map('n', '<S-Tab>', 'gT', options)

-- stop higlighting searches
map('n',  '<leader>,',  ':nohlsearch<CR>', options)

-- keep cursor on bottom when yanking
map('v', 'y', 'ygv<esc>', options)

-- manouver tabs and split fast
map('n',  '<C-h>', '<C-W>h', options)
map('n',  '<C-j>', '<C-W>j', options)
map('n',  '<C-k>', '<C-W>k', options)
map('n',  '<C-l>', '<C-w>l', options)

--  terminal mappings
map('t', '<C-x>', '<C-\\><C-n>', options)
map('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', options)
map('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', options)
map('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', options)
map('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', options)
map('t', '<C-o>', '<C-\\><C-n><C-o>', options)


