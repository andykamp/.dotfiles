local map = vim.api.nvim_set_keymap
local options = { noremap = true }

require('harpoon.term')
map('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<CR>', options)
map('n', '<leader>ha', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', options)

map('n', '<leader>hA', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', options)

map('n', '<leader>t1', ':lua require("harpoon.term").gotoTerminal(1)<CR>', options)
map('n', '<leader>t2', ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n', '<leader>t3', ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n', '<leader>t4', ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n', '<leader>t5', ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n', '<leader>t6', ':lua require("harpoon.term").gotoTerminal(6)<CR>', options)

-- @todo: can add global go-to-files here aswell
map('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)  <CR>', options)
map('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)  <CR>', options)
map('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)  <CR>', options)
map('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)  <CR>', options)
map('n', '<leader>h5', ':lua require("harpoon.ui").nav_file(5)  <CR>', options)
map('n', '<leader>h6', ':lua require("harpoon.ui").nav_file(6)  <CR>', options)

-- map('n',  'g1',  ':lua require("harpoon.term").sendCommand(1, 1)  <CR>', options)
-- map('n',  'g2',  ':lua require("harpoon.term").sendCommand(1, 2)  <CR>', options)
-- map('n',  '<F3>',  ':lua require("harpoon.term").sendCommand(1, 3)  <CR>', options)
-- map('n',  '<F4>',  ':lua require("harpoon.term").sendCommand(1, 4)  <CR>', option
-- map('n',  '<F5>',  ':lua require("harpoon.term").sendCommand(1, 5)  <CR>', options)
map('n', '<leader>hg', ':Telescope git_files<CR>', options)

