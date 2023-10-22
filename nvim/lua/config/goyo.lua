local map = vim.api.nvim_set_keymap
local options = { noremap = true }

vim.g.goyo_width = '100%'
vim.g.goyo_height = 100
vim.g.goyo_linenr = 1
map('n', '<leader>gy', ':Goyo <CR>', options)


