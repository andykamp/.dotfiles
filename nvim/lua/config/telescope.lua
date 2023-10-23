local map = vim.api.nvim_set_keymap

local actions = require "telescope.actions"
-- see https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua for all telescope actions

require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules", 'git', 'tags', 'dist/', 'build/' },
        mappings = {
            i = {
                -- ['<C-u>'] = actions.results_scrolling_up,
                -- ['<C-d>'] = actions.results_scrolling_down,
                ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-q"] = actions.send_to_qflist + actions.open_qflist
            },
            n = {
                ["J"] = actions.move_selection_next + actions.move_selection_next + actions.move_selection_next +
                    actions.move_selection_next + actions.move_selection_next,
                ["K"] = actions.move_selection_previous + actions.move_selection_previous +
                    actions.move_selection_previous + actions.move_selection_previous + actions.move_selection_previous,
                -- ['<C-u>'] = actions.results_scrolling_up,
                -- ['<C-d>'] = actions.results_scrolling_down,
                ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-q"] = actions.send_to_qflist + actions.open_qflist
            }
        },
    },
}



-- file movement
map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false, hidden=true})<CR>]], { noremap = true, silent = true })
map('n', '<leader>fF', [[:execute 'Telescope find_files default_text=' . expand('<cword>')<CR>]], { noremap = true, silent = true }) -- populates word under cursor
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fG', [[:execute 'Telescope live_grep default_text=' . expand('<cword>')<CR>]], { noremap = true, silent = true }) -- populates word under cursor
map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })

-- lsp
map('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], { noremap = true, silent = true })

-- github 
map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gt', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })

-- tags and misc
-- map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })

