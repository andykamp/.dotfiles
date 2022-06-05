local map = vim.api.nvim_set_keymap
local options = { noremap = true }


-----------------------------------------------------------------------------
-- vimwiki
-----------------------------------------------------------------------------

vim.g.vimwiki_listsyms = '✗○◐●✓'
map('n', '<leader>wq',  ':VimwikiToggleListItem<CR>', options)

-----------------------------------------------------------------------------
-- tagbar
-----------------------------------------------------------------------------

vim.g.tagbar_autofocus = 1

map('n', '<leader>tt',  ':TagbarToggle<CR>', options)

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
vim.g.UltiSnipsSnippetDirectories= {'~/.config/nvim/UltiSnips' }
vim.g.UltiSnipsExpandTrigger = "<Tab>"

--- If you want :UltiSnipsEdit to split your window.
vim.g.UltiSnipsEditSplit="vertical"

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
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeQuitOnOpen = 0
vim.g.NERDTreeMinmalUi= 1
vim.g.NERDTreeDirArrows = 1
map('n',  '<leader>nn',  ':NERDTreeToggle<CR>', options)


-----------------------------------------------------------------------------
--- test-vim
-----------------------------------------------------------------------------
map('n',  't<C-n>', ':TestNearest<CR>', options)
map('n',  't<C-f>', ':TestFile<CR>', options)
map('n',  't<C-s>', ':TestSuite<CR>', options)
map('n',  't<C-l>', ':TestLast<CR>', options)
map('n',  't<C-g>', ':TestVisit<CR>', options)

-----------------------------------------------------------------------------
-- orgmode
-----------------------------------------------------------------------------
require('orgmode').setup_ts_grammar()
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/notes.org'},
  org_default_notes_file = '~/notes.org',
  org_todo_keywords = {'TODO', 'PROGRESS', 'REVIEW', '|', 'DONE'}
})
-- require("headlines").setup ()

