-- @todo: learn to use remote. set S as default search key, change the highlight color
require 'flash'.setup {}

-- Mapping definitions using 'map'
local map = vim.api.nvim_set_keymap
map('n', 's', '<cmd>lua require("flash").jump()<cr>', { noremap = true, desc = "Flash" })

map('x', 's', '<cmd>lua require("flash").treesitter()<cr>', { noremap = true, desc = "Flash Treesitter" })

map('o', 'r', '<cmd> lua require("flash").remote()<cr>', { noremap = true, desc = "Remote Flash" })

-- map('n', 's', '<cmd> lua require("flash").treesitter_search()<cr>', { noremap = true, desc = "Treesitter Search" })

-- map('c', 's',  '<cmd> lua require("flash").toggle()<cr>', { noremap = true, desc = "Toggle Flash Search" })

vim.cmd [[highlight FlashLabel guifg=#000000 guibg=#d38aea ]]
