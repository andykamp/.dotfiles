local map = vim.api.nvim_set_keymap
local options = { noremap = true }
-- @todo: add shortcut to toggle
-- @todo: a little painful to use tab completion inside a snippet 
vim.g.UltiSnipsSnippetDirectories = { '~/.config/nvim/UltiSnips' }
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsEditSplit = "vertical" -- If you want :UltiSnipsEdit to split your window.
vim.g.UltiSnipsJumpForwardTrigger = "<F13>" -- so not copilot fucks up with ultisnips
vim.g.UltiSnipsJumpBackwardTrigger = "<F14>"-- so not copolot fucks up with ultisnips
map('n', '<leader>uu', ':UltiSnipsEdit<CR>', options)
map('n', '<leader>ual', ':UltiSnipsEdit all<CR>', options)
map('n', '<leader>ujs', ':UltiSnipsEdit javascript<CR>', options)
map('n', '<leader>uts', ':UltiSnipsEdit typescript<CR>', options)
map('n', '<leader>ujx', ':UltiSnipsEdit javascriptreact<CR>', options)
map('n', '<leader>utx', ':UltiSnipsEdit typescriptreact<CR>', options)
map('n', '<leader>umd', ':UltiSnipsEdit md<CR>', options)


