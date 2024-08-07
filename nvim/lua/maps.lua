-----------------------------------------------------------------------------
-- This file contains all keymappings for general vim and for pluginsh
-----------------------------------------------------------------------------

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

--tab
map('n', 'gn', ':tabedit TAB<CR>', { noremap = true, silent = true })
map('n', 'gN', ':tabclose<CR>', { noremap = true, silent = true })

--Remap space as leader key
map('n', '<Space>', '', {})
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap (with this wrapped lines are treated as individual lines)
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- replace s with search /
map('n', 'S', '/', options)

-- jk is escape
map('i', 'jk', '<esc>', options)

-- movement
map('n', 'J', '5j', options)
map('n', 'K', '5k', options)
map('v', 'J', '5j', options)
map('v', 'K', '5k', options)

-- stop higlighting searches
map('n', '<leader>,', ':nohlsearch<CR>', options)

-- close loclist/quiclist
vim.api.nvim_set_keymap('n', '<leader>.', [[<Cmd>lua ToggleQuickfix()<CR>]], { noremap = true, silent = true })

function ToggleQuickfix()
    local windows = vim.fn.getwininfo()
    local isQuickfixOpen = false

    for _, window in pairs(windows) do
        if window.quickfix == 1 then
            isQuickfixOpen = true
            break
        end
    end

    if isQuickfixOpen then
        vim.cmd('cclose')
    else
        vim.cmd('copen')
    end
end

map('n', '(', ':cn<CR>', options)
map('n', ')', ':cp<CR>', options)
-- always open quiclist at very bottom
vim.cmd [[
  augroup MyAutoCommands
    autocmd!
    autocmd FileType qf wincmd J
  augroup END
]]


-- keep cursor on bottom when yanking
map('v', 'y', 'ygv<esc>', options)

-- manouver tabs and split fast
map('n', '<C-h>', '<C-W>h', options)
map('n', '<C-j>', '<C-W>j', options)
map('n', '<C-k>', '<C-W>k', options)
map('n', '<C-l>', '<C-w>l', options)

--  replace word under cursor with yanked word without replacing buffer
map('n', '<leader>p', "\"_diwP", options)
map('n', 'riw', "\"_diwP", options)

--  terminal mappings
map('t', '<C-x>', '<C-\\><C-n>', options)
map('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', options)
map('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', options)
map('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', options)
map('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', options)
map('t', '<C-o>', '<C-\\><C-n><C-o>', options)

-- marks
map('n', "æ", "'", options)

-- renmaing file
-- map('n', '<leader>rn', ':IncRename ', options) -- did not work properly
map('n', '<leader>rn', ':%s/<C-r><C-w>//g<Left><Left>', options)

-- center cursor
-- vim.api.nvim_set_keymap('n', '<C-U>', '<C-U>zz', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<C-D>', '<C-D>zz', {noremap = true, silent = true})
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- center on search
vim.keymap.set("n", "n", "nzzzv", { desc = "center on search" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "center on search" })


-- resize split
map('n', '<leader>>', ':vert resize +10<CR>', options)
map('n', '<leader><', ':vert resize -10<CR>', options)
map('n', '<leader>+', ':resize +10<CR>', options)
map('n', '<leader>-', ':resize -10<CR>', options)

-----------------------------------------------------
-- Helper mappings to train on not using hjkl
-----------------------------------------------------
-- Define a variable to track the status
local hjkl_enabled = true

-- Function to enable/disable hjkl and HJKL
_G.toggle_hjkl = function()
    if hjkl_enabled then
        -- disable hjkl and HJKL
        -- vim.api.nvim_set_keymap('n', 'h', '<Nop>', {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap('n', 'j', '<Nop>', {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap('n', 'k', '<Nop>', {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap('n', 'l', '<Nop>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', 'H', '<Nop>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'J', '<Nop>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'K', '<Nop>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'L', '<Nop>', { noremap = true, silent = true })
    else
        -- re-enable hjkl and HJKL
        -- vim.api.nvim_set_keymap('n', 'h', 'h', {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap('n', 'j', 'j', {noremap = true, silent = true})
        -- vim.api.nvim_set_keymap('n', 'k', 'k', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', 'l', 'l', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'H', '5h', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'J', '5j', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'K', '5k', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'L', '5l', { noremap = true, silent = true })
    end

    -- Toggle the status
    hjkl_enabled = not hjkl_enabled
end

_G.toggle_hjkl_full = function()
    if hjkl_enabled then
        -- disable hjkl and HJKL
        vim.api.nvim_set_keymap('n', 'h', [[v:count ? 'h' : '<Nop>']], { expr = true, noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'j', [[v:count ? 'j' : '<Nop>']], { expr = true, noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'k', [[v:count ? 'k' : '<Nop>']], { expr = true, noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'l', [[v:count ? 'l' : '<Nop>']], { expr = true, noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'H', '<Nop>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'J', '<Nop>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'K', '<Nop>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'L', '<Nop>', { noremap = true, silent = true })
    else
        -- re-enable hjkl and HJKL
        vim.api.nvim_set_keymap('n', 'h', 'h', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'j', 'j', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'k', 'k', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'l', 'l', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'H', '5h', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'J', '5j', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'K', '5k', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'L', '5l', { noremap = true, silent = true })
    end

    -- Toggle the status
    hjkl_enabled = not hjkl_enabled
end

-- Map <Space>d to toggle the hjkl and HJKL
vim.api.nvim_set_keymap('n', '<leader>d', '<Cmd>lua _G.toggle_hjkl()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>D', '<Cmd>lua _G.toggle_hjkl_full()<CR>', { noremap = true, silent = true })

-- move out/in of scope with [% and ]% or [m and ]M
--  can i use lang  instad of
-- vim.api.nvim_set_keymap('n', '<leader>o', '[m', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>i', ']M', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<leader>o', '[m', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<leader>i', ']M', { noremap = true, silent = true })

-- Prevent x and c from filling up register
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "c", '"_c')
-- Prevent empty-line dd from filling up register
vim.keymap.set("n", "dd", function()
    if vim.fn.getline(".") == "" then
        return '"_dd'
    end
    return "dd"
end, { expr = true })

-- Copy file info

vim.keymap.set("n", "<leader>fy", [[:lua vim.fn.setreg('+', vim.fn.expand('%'))<CR>]], {
    noremap = true,
    silent = true,
    desc = "Copy current filepath relative",
})

vim.keymap.set("n", "<leader>fY", [[:lua vim.fn.setreg('+', vim.fn.expand('%:p'))<CR>]], {
    noremap = true,
    silent = true,
    desc = "Copy current filepath full",
})

vim.keymap.set("n", "<leader>fn", [[:lua vim.fn.setreg('+', vim.fn.expand('%:t'))<CR>]], {
    noremap = true,
    silent = true,
    desc = "Copy current file name",
})

-- OLD get relative path
map('n', '<leader>br', ':let @+ = expand("%") <CR>', options)
-- get full path
map('n', '<leader>ba', ':let @+ = expand("%:p") <CR>', options)
-- get just filename
map('n', '<leader>bn', ':let @+ = expand("%:t") <CR>', options)

vim.keymap.set("n", "zu", "zMzO", {
    desc = "fold all except cursor",
    silent = true,
    noremap = true,
})

vim.keymap.set("n", "<leader>o", "<CMD>vs<bar>:b#<CR>", { desc = "reopen last split" })
