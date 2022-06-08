-----------------------------------------------------------------------------
-- This file contains plugin configurations
-----------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local options = { noremap = true }



-----------------------------------------------------------------------------
-- nvim-colorizer
-----------------------------------------------------------------------------
require'colorizer'.setup()


-----------------------------------------------------------------------------
-- gutentags
-----------------------------------------------------------------------------
vim.g.gutentags_ctags_auto_set_tags = 0
vim.g.gutentags_file_list_command = "git ls-files"


-----------------------------------------------------------------------------
-- gitsigns
-----------------------------------------------------------------------------
require('gitsigns').setup {
  signs = {
    add = { hl = 'GitGutterAdd', text = '+' },
    change = { hl = 'GitGutterChange', text = '~' },
    delete = { hl = 'GitGutterDelete', text = '_' },
    topdelete = { hl = 'GitGutterDelete', text = '‾' },
    changedelete = { hl = 'GitGutterChange', text = '~' },
  },
}

-----------------------------------------------------------------------------
-- indent-blankline
-----------------------------------------------------------------------------
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_show_trailing_blankline_indent = false
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

-----------------------------------------------------------------------------
-- vimwiki
-----------------------------------------------------------------------------
vim.g.wiki_global_ext = 0
local l = {}
l.path = '~/vimwiki/'
l.syntax = 'markdown'
l.ext = '.md'
vim.g.vimwiki_list = { l }
vim.g.vimwiki_listsyms = '✗○◐●✓'
map('n', '<leader>wq',  ':VimwikiToggleListItem<CR>', options)

-----------------------------------------------------------------------------
-- goyo
-----------------------------------------------------------------------------
vim.g.goyo_width = '50%'
vim.g.goyo_height = 100
vim.g.goyo_linenr = 1
map('n', '<leader>gy', ':Goyo <CR>', options)

-----------------------------------------------------------------------------
-- Ultisnips
-----------------------------------------------------------------------------
-- TODO add shortcut to toggle
vim.g.UltiSnipsSnippetDirectories= {'~/.config/nvim/UltiSnips' }
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsEditSplit="vertical" -- If you want :UltiSnipsEdit to split your window.

-----------------------------------------------------------------------------
-- ale
-----------------------------------------------------------------------------
local l = {}
l.javascript = {'eslint', 'prettier'}
l.javascriptreact = {'eslint', 'prettier'}
l.typescript = {'eslint', 'prettier'}
l.typescriptreact = {'eslint', 'prettier'}
l.css = {'prettier'}

vim.g.ale_fixers = l
-- vim.g.ale_sign_error = '❌'
-- vim.g.ale_sign_warning = '⚠️'
vim.g.ale_fix_on_save = 1
local aliases = {}
aliases.jsx =  'javascript'
aliases.jsx =  'javascript'
vim.g.ale_linter_aliases = aliases



-----------------------------------------------------------------------------
-- Telescope
-----------------------------------------------------------------------------
require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", 'git', 'tags', 'dist', 'build' },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

--Add leader shortcuts
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false, hidden=true})<CR>]], { noremap = true, silent = true })
map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })

map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], { noremap = true, silent = true })


-----------------------------------------------------------------------------
-- harpoon
-----------------------------------------------------------------------------
require('harpoon.term')
map('n',  '<leader>hm',  ':lua require("harpoon.mark").add_file()<CR>', options)
map('n',  '<leader>ha',  ':lua require("harpoon.ui").toggle_quick_menu()<CR>', options)
map('n',  '<leader>hA',  ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', options)

map('n',  '<leader>t1',  ':lua require("harpoon.term").gotoTerminal(1)<CR>', options)
map('n',  '<leader>t2',  ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n',  '<leader>t3',  ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n',  '<leader>t4',  ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n',  '<leader>t5',  ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n',  '<leader>t6',  ':lua require("harpoon.term").gotoTerminal(6)<CR>', options)

-- TODO can add global go-to-files here aswell
map('n',  '<leader>h1',  ':lua require("harpoon.ui").nav_file(1)  <CR>', options)
map('n',  '<leader>h2',  ':lua require("harpoon.ui").nav_file(2)  <CR>', options)
map('n',  '<leader>h3',  ':lua require("harpoon.ui").nav_file(3)  <CR>', options)
map('n',  '<leader>h4',  ':lua require("harpoon.ui").nav_file(4)  <CR>', options)
map('n',  '<leader>h5',  ':lua require("harpoon.ui").nav_file(5)  <CR>', options)
map('n',  '<leader>h6',  ':lua require("harpoon.ui").nav_file(6)  <CR>', options)

-- map('n',  'g1',  ':lua require("harpoon.term").sendCommand(1, 1)  <CR>', options)
-- map('n',  'g2',  ':lua require("harpoon.term").sendCommand(1, 2)  <CR>', options)
-- map('n',  '<F3>',  ':lua require("harpoon.term").sendCommand(1, 3)  <CR>', options)
-- map('n',  '<F4>',  ':lua require("harpoon.term").sendCommand(1, 4)  <CR>', options)
-- map('n',  '<F5>',  ':lua require("harpoon.term").sendCommand(1, 5)  <CR>', options)
map('n',  '<leader>hg',  ':Telescope git_files<CR>', options)

-----------------------------------------------------------------------------
--- nerdtree
-----------------------------------------------------------------------------
vim.g.webdevicons_enable_nerdtree = 1
vim.g.NERDTreeGitStatusUseNerdFonts = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeQuitOnOpen = 0
vim.g.NERDTreeMinmalUi= 1
vim.g.NERDTreeDirArrows = 1

-- shortcut to remove allow the J and K to be the normal 5j and 5k
vim.g.NERDTreeMapJumpLastChild = 'z'
vim.g.NERDTreeMapJumpFirstChild = 'z'

-- shortcuts to toggle and find 
map('n',  '<leader>nn',  ':NERDTreeToggle<CR>', options) -- toggle on/off nerdtree
map('n', '<leader>r', ':NERDTreeFind<cr>', options) -- map nerdtree switch to active file

-- Exit Vim if NERDTree is the only window remaining in the only tab.
vim.cmd([[
 autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])
-- Close the tab if NERDTree is the only window remaining in it.
vim.cmd([[
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]])


-----------------------------------------------------------------------------
--- marks
-----------------------------------------------------------------------------
require'marks'.setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- which builtin marks to show. default {}
  builtin_marks = { ".", "<", ">", "^" },
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- whether the shada file is updated after modifying uppercase marks. default false
  force_write_shada = false,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world"
  },
  mappings = {}
}

-----------------------------------------------------------------------------
--- toggleterm
-----------------------------------------------------------------------------
require('toggleterm').setup({
	size = 20,
	open_mapping = [[<C-t>]],
	hide_numbers = true,
	-- shade_filetypes = {},
	-- shade_terminals = true,
	-- shading_factor = '1',
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- UNCOMMENT IF FIND USEFUL IN THE FUTURE
-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

-- function _LAZYGIT_TOGGLE()
-- 	lazygit:toggle()
-- end

-- local node = Terminal:new({ cmd = "node", hidden = true })


-- function _NODE_TOGGLE()
-- 	node:toggle()
-- end

-- -- map('n',  '<leader>tn',  ':lua _NODE_TOGGLE() <CR>',  {noremap = true, silent = true})

-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

-- function _NCDU_TOGGLE()
-- 	ncdu:toggle()
-- end

-- local htop = Terminal:new({ cmd = "htop", hidden = true })

-- function _HTOP_TOGGLE()
-- 	htop:toggle()
-- end

-- local python = Terminal:new({ cmd = "python", hidden = true })

-- function _PYTHON_TOGGLE()
-- 	python:toggle()
-- end
