local map = vim.api.nvim_set_keymap
local options = { noremap = true }

vim.cmd([[
function! IsCurrentBufferDiff()
    if &diff
        return 1
    endif
    return 0
endfunction
]])

vim.cmd([[
  command! OpenDiff if IsCurrentBufferDiff() | :q | endif | Gvdiff origin/master
]])

vim.cmd([[
  command! OpenDiffFull if IsCurrentBufferDiff() | :q | endif | Gvdiff -U1000 origin/master
]])

vim.cmd([[
  command! OpenDiffFromLastCommit if IsCurrentBufferDiff() | :q | endif | Gvdiff HEAD~1
]])

map('n', '<leader>gm', ':OpenDiff<CR>', options)
-- map('n', '<leader>gM', ':OpenDiffFull<CR>', options)
map('n', '<leader>gM', ':OpenDiffFromLastCommit<CR>', options)
-- map('n', '<leader>gm', ':Gvdiff origin/master <CR>', options)
map('n', '<leader>ga', ':G difftool --name-only master <CR>', options)
map('n', '<leader>gl', ':G difftool --name-only HEAD <CR>', options)
vim.cmd('command! DiffNext if IsCurrentBufferDiff() | :q | endif | :cn | :OpenDiff')
vim.cmd('command! DiffPrev if IsCurrentBufferDiff() | :q | endif | :cp | :OpenDiff')
map('n', '<leader>gn', ':DiffNext <CR>', options)
map('n', '<leader>gp', ':DiffPrev <CR>', options)

