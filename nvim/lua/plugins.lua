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
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false, hidden=true})<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_bcommits()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], { noremap = true, silent = true })


-----------------------------------------------------------------------------
-- harpoon
-----------------------------------------------------------------------------
require('harpoon.term')
map('n',  '<leader>hm',  ':lua require("harpoon.mark").add_file()<CR>', options)
map('n',  '<leader>ha',  ':lua require("harpoon.ui").toggle_quick_menu()<CR>', options)
map('n',  '<leader>hA',  ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', options)
map('n',  '<leader>1',  ':lua require("harpoon.term").gotoTerminal(1)<CR>', options)
map('n',  '<leader>2',  ':lua require("harpoon.term").gotoTerminal(2)<CR>', options)
map('n',  '<M-1>',  ':lua require("harpoon.ui").nav_file(1)  <CR>', options)
map('n',  '<M-2>',  ':lua require("harpoon.ui").nav_file(2)  <CR>', options)
map('n',  '<M-3>',  ':lua require("harpoon.ui").nav_file(3)  <CR>', options)
map('n',  '<M-4>',  ':lua require("harpoon.ui").nav_file(4)  <CR>', options)
map('n',  '<M-5>',  ':lua require("harpoon.ui").nav_file(5)  <CR>', options)
map('n',  'g1',  ':lua require("harpoon.term").sendCommand(1, 1)  <CR>', options)
map('n',  'g2',  ':lua require("harpoon.term").sendCommand(1, 2)  <CR>', options)
map('n',  '<F3>',  ':lua require("harpoon.term").sendCommand(1, 3)  <CR>', options)
map('n',  '<F4>',  ':lua require("harpoon.term").sendCommand(1, 4)  <CR>', options)
map('n',  '<F5>',  ':lua require("harpoon.term").sendCommand(1, 5)  <CR>', options)
map('n',  '<M-f>',  ':Telescope git_files<CR>', options)


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


