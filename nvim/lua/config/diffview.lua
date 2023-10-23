-----------------------------------------------------------------------------
-- git diffs colors
-----------------------------------------------------------------------------
-- vim.cmd [[highlight DiffAdd guifg=#85e89d guibg=#33353f]]
-- vim.cmd [[highlight DiffChange guifg=#9ecbff guibg=#33353f]]
-- vim.cmd [[highlight DiffDelete guifg=#ec7279 guibg=#33353f]]
vim.cmd [[highlight DiffAdd guibg=#323F3C]]
vim.cmd [[highlight DiffChange guibg=#323F3C]]
vim.cmd [[highlight DiffDelete guibg=#2B2429 guifg=#343539]]
vim.cmd [[highlight DiffText guibg=#85e89d guifg=#1C1D20]]
vim.opt.fillchars:append { diff = "╱" }


local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- vim.cmd([[
-- function! IsCurrentBufferDiff()
--     if &diff
--         return 1
--     endif
--     return 0
-- endfunction
-- ]])

-- vim.cmd([[
--   command! OpenDiff if IsCurrentBufferDiff() | :q | endif | Gvdiff origin/master
-- ]])

-- vim.cmd([[
--   command! OpenDiffFull if IsCurrentBufferDiff() | :q | endif | Gvdiff -U1000 origin/master
-- ]])

-- vim.cmd([[
--   command! OpenDiffFromLastCommit if IsCurrentBufferDiff() | :q | endif | Gvdiff HEAD~1
-- ]])

-- map('n', '<leader>gm', ':OpenDiff<CR>', options)
-- -- map('n', '<leader>gM', ':OpenDiffFull<CR>', options)
-- map('n', '<leader>gM', ':OpenDiffFromLastCommit<CR>', options)
-- -- map('n', '<leader>gm', ':Gvdiff origin/master <CR>', options)
-- map('n', '<leader>ga', ':G difftool --name-only master <CR>', options)
-- map('n', '<leader>gl', ':G difftool --name-only HEAD <CR>', options)
-- vim.cmd('command! DiffNext if IsCurrentBufferDiff() | :q | endif | :cn | :OpenDiff')
-- vim.cmd('command! DiffPrev if IsCurrentBufferDiff() | :q | endif | :cp | :OpenDiff')

map('n', '<leader>gg', ':DiffviewOpen <CR>', options) -- current branch
map('n', '<leader>gx', ':DiffviewClose <CR>', options) -- current branch

map('n', '<leader>ga', ':DiffviewFileHistory <CR>', options) -- current branch
map('n', '<leader>gl', ':DiffviewFileHistory % <CR>', options) -- current file 

-- use tab and shift-tab to navigate through diff sections

