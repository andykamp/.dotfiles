vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-K>', '<Plug>(copilot-next)', { noremap = false })
vim.api.nvim_set_keymap('i', '<C-L>', '<Plug>(copilot-previous)', { noremap = false })
vim.api.nvim_set_keymap('i', '<C-S>', '<Plug>(copilot-suggest)', { noremap = false })
vim.cmd [[highlight CopilotSuggestion guifg=#555555 ctermfg=8]] -- default copilot highlighting
-- can be used to disable copilot for certain filetypes
-- vim.g.copilot_filetypes = {
--     ["*"] = false,
--     ["javascript"] = true,
--     ["typescript"] = true,
--     ["lua"] = false,
--     ["rust"] = true,
--     ["c"] = true,
--     ["c#"] = true,
--     ["c++"] = true,
--     ["go"] = true,
--     ["python"] = true,
--   }

