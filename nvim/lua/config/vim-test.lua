local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map('n', '<leader>tn', ':TestNearest<CR>', options)
map('n', '<leader>tf', ':TestFile<CR>', options)
map('n', '<leader>ta', ':TestSuite<CR>', options)
map('n', '<leader>tl', ':TestLast<CR>', options)
map('n', '<leader>tv', ':TestVisit<CR>', options)

