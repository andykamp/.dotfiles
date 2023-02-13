-----------------------------------------------------------------------------
-- This file contains plugin configurations
-----------------------------------------------------------------------------
local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-----------------------------------------------------------------------------
-- vim-startify
-----------------------------------------------------------------------------
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_enable_special = 0
vim.g.startify_custom_header = {
    '   _  __     _         __  ___         __     ___ ',
    '  / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
    ' /    / |/ / /  ` \\  / /|_/ / _ `/ __/ _ \\  / __/ ',
    '/_/|_/|___/_/_/_/_/ /_/  /_/\\_,_/\\__/_//_/ /____/ ',
}
vim.g.startify_lists = {
    { type = 'files', header = { '   Files' } },
    --{ type= 'dir',       header= {'   Current Directory '}},
    { type = 'bookmarks', header = { '   Bookmarks' } },
}
vim.g.startify_bookmarks = {
    { d = '~/dotfiles' },
    { w = '~/documents/work' },
    { s = '~/documents/side-projects' },
    { r = '~/documents/random' }
}

-----------------------------------------------------------------------------
-- copilot
-----------------------------------------------------------------------------
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

-----------------------------------------------------------------------------
-- folds 
-- @todo: not really used...
-----------------------------------------------------------------------------
vim.cmd [[set foldmethod=expr]]
vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
vim.cmd [[set foldlevelstart=99]] --start file with all folds opened

-----------------------------------------------------------------------------
-- virtual-colors aka hovered diagnostics
-----------------------------------------------------------------------------
vim.cmd [[highlight VirtualTextError guifg=#f97583]]
vim.cmd [[highlight VirtualTextWarning guifg=#ffea7f]]
-- vim.cmd [[highlight VirtualTextInfo guifg=#10B981]]
-- vim.cmd [[highlight VirtualTextHint guifg=#0db9d7]]

-----------------------------------------------------------------------------
-- Diagnostic icons for nerdtreee and gutter
-----------------------------------------------------------------------------
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
    { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
    { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
    { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
    { text = "", texthl = "DiagnosticSignHint" })

-----------------------------------------------------------------------------
-- transparant backgorund
-----------------------------------------------------------------------------
require("transparent").setup({
    enable = true, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups

        -- example of akinsho/nvim-bufferline.lua
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineBackground",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
    },
    exclude = {}, -- table: groups you don't want to clear
})
-----------------------------------------------------------------------------
-- lualine
-----------------------------------------------------------------------------
require('lualine').setup {
    options = {
        theme = "rose-pine",
        section_separators = '',
        component_separators = ''
    },
    sections = {
        lualine_a = { 'mode' },
        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'diff', 'diagnostic' },
        lualine_y = {},
        lualine_z = {},


        -- lualine_b = { 'branch', 'diff', 'diagnostics' },
        -- lualine_b = { { 'filename', path = 1 } },
        -- lualine_x = { 'filetype' },
        -- lualine_y = { 'progress' },
        -- lualine_z = { 'location' }
    },
    -- sections = {
    --     lualine_a = { 'mode', {'branch'},{'filename', path=2},  },
    --     lualine_b = {},
    --     lualine_c = {{'diagnostics', always_visible = true, symbols = { error = 'E', warn = 'W', info = 'I', hint='H', } } },
    --     lualine_x = {},
    --     lualine_y = {},
    --     lualine_z = {},
    -- }
}
-----------------------------------------------------------------------------
-- nvim-colorizer
-----------------------------------------------------------------------------
require 'colorizer'.setup()

-----------------------------------------------------------------------------
-- vim-test
-----------------------------------------------------------------------------
map('n', '<leader>tn', ':TestNearest<CR>', options)
map('n', '<leader>tf', ':TestFile<CR>', options)
map('n', '<leader>ta', ':TestSuite<CR>', options)
map('n', '<leader>tl', ':TestLast<CR>', options)
map('n', '<leader>tv', ':TestVisit<CR>', options)


-----------------------------------------------------------------------------
-- gutentags
-- @todo: remove as it has never been used...
-----------------------------------------------------------------------------
-- vim.g.gutentags_ctags_auto_set_tags = 0
-- vim.g.gutentags_file_list_command = "git ls-files"


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
    -- signs = {
    --   add = { text = "▎" },
    --   change = { text = "▎" },
    --   delete = { text = "▎" },
    --   topdelete = { text = "契" },
    --   changedelete = { text = "▎" },
    -- },
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
l.auto_diary_index = 1 -- autogenerate vimwiki diary
vim.g.vimwiki_list = { l }
vim.g.vimwiki_listsyms = '✗○◐●✓'
map('n', '<leader>wq', ':VimwikiToggleListItem<CR>', options)
map('n', '<leader>wc', ':CalendarVR<CR>', options)

-----------------------------------------------------------------------------
-- goyo
-----------------------------------------------------------------------------
vim.g.goyo_width = '100%'
vim.g.goyo_height = 100
vim.g.goyo_linenr = 1
map('n', '<leader>gy', ':Goyo <CR>', options)

-----------------------------------------------------------------------------
-- Ultisnips
-----------------------------------------------------------------------------
-- @todo: add shortcut to toggle
-- @todo: a little painful to use tab completion inside a snippet 
vim.g.UltiSnipsSnippetDirectories = { '~/.config/nvim/UltiSnips' }
vim.g.UltiSnipsExpandTrigger = "<Tab>"
vim.g.UltiSnipsEditSplit = "vertical" -- If you want :UltiSnipsEdit to split your window.
map('n', '<leader>uu', ':UltiSnipsEdit<CR>', options)
map('n', '<leader>ual', ':UltiSnipsEdit all<CR>', options)
map('n', '<leader>ujs', ':UltiSnipsEdit javascript<CR>', options)
map('n', '<leader>uts', ':UltiSnipsEdit typescript<CR>', options)
map('n', '<leader>ujx', ':UltiSnipsEdit javascriptreact<CR>', options)
map('n', '<leader>utx', ':UltiSnipsEdit typescriptreact<CR>', options)
map('n', '<leader>umd', ':UltiSnipsEdit md<CR>', options)


-----------------------------------------------------------------------------
-- neoformat
-----------------------------------------------------------------------------

---- map('n', '<leader>p', ':Neoformat prettier<CR>', options)
---- use a project-local version of Prettier
--vim.g.neoformat_try_node_exe = 1
---- Enable alignment
--vim.g.neoformat_basic_format_align = 1
---- Enable tab to spaces conversion
--vim.g.neoformat_basic_format_retab = 1
---- Enable trimmming of trailing whitespace
--vim.g.neoformat_basic_format_trim = 1

----run Prettier on save
---- vim.cmd([[
----     autocmd BufWritePre *.js Neoformat
---- ]])

-----------------------------------------------------------------------------
-- ale (NOT USED)
-----------------------------------------------------------------------------
-- local l = {}
-- l.javascript = {'eslint', 'prettier'}
-- l.javascriptreact = {'eslint', 'prettier'}
-- l.typescript = {'eslint', 'prettier'}
-- l.typescriptreact = {'eslint', 'prettier'}
-- l.css = {'prettier'}
-- l.svelte = {'prettier'}

-- vim.g.ale_fixers = l
-- -- vim.g.ale_sign_error = '❌'
-- -- vim.g.ale_sign_warning = '⚠️'
-- vim.g.ale_fix_on_save = 1
-- local aliases = {}
-- aliases.jsx =  'javascript'
-- aliases.jsx =  'javascript'
-- vim.g.ale_linter_aliases = aliases



-----------------------------------------------------------------------------
-- Telescope
-----------------------------------------------------------------------------
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

--Add leader shortcuts

map('n', '<leader>fF', [[:execute 'Telescope find_files default_text=' . expand('<cword>')<CR>]],
    { noremap = true, silent = true }) -- populates word under cursor
map('n', '<leader>fG', [[:execute 'Telescope live_grep default_text=' . expand('<cword>')<CR>]],
    { noremap = true, silent = true }) -- populates word under cursor

map('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false, hidden=true})<CR>]],
    { noremap = true, silent = true })
map('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

map('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })

-- vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
-- map('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fg', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })

map('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
    { noremap = true, silent = true })
-- map('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })


map('n', '<leader>fr', [[<cmd>lua require('telescope.builtin').lsp_references()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fd', [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]], { noremap = true, silent = true })
map('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
    { noremap = true, silent = true })

map('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_stash()<CR>]], { noremap = true, silent = true })
map('n', '<leader>gt', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })


-----------------------------------------------------------------------------
-- harpoon
-----------------------------------------------------------------------------
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

-----------------------------------------------------------------------------
--- neotree
-----------------------------------------------------------------------------
-- vim.api.nvim_set_hl(0, 'NeoTreeWinSeparator', { fg="#DE3163", bg="#DE3163" })
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = "NONE" })
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = "NONE" })
vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = "NONE" })
vim.api.nvim_set_hl(0, 'NeoTreeFileIcon', { fg = "#5DBBC1" })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = "#5DBBC1" })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = "#5DBBC1" })
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = "#D38AEA" })

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.g.neo_tree_remove_legacy_commands = 1
map('n', '<leader>nn', ':Neotree toggle <CR>', options)
map('n', '<leader>rr', ':Neotree reveal <CR>', options)
-- map('n', '/', ':Neotree toggle current reveal_force_cwd <CR>', options)
-- map('n', 'gd', ':Neotree float reveal_file=<cfile> reveal_force_cwd <CR>', options)
-- map('n', '<leader>b', ':Neotree toggle show buffers right <CR>', options)
-- map('n', '<leader>s', ':Neotree float git_status <CR>', options)

require("neo-tree").setup({
    close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- use a custom function for sorting files and directories in the tree
    -- sort_function = function (a,b)
    --       if a.type == b.type then
    --           return a.path > b.path
    --       else
    --           return a.type > b.type
    --       end
    --   end , -- this sorts files and directories descendantly
    default_component_configs = {
        container = {
            enable_character_fade = true
        },
        indent = {
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            -- indent guides
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            -- expander config, needed for nesting files
            with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
        },
        modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
        },
        git_status = {
            symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "d", -- "✖", -- this can only be used in the git_status source
                renamed   = "r", --"", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "U", --"",
                staged    = "S", --"",
                conflict  = "",
            }
        },
    },
    window = {
        position = "left",
        width = 50,
        mapping_options = {
            noremap = true,
            nowait = true,
        },
        mappings = {
            ["<space>"] = {
                "toggle_node",
                nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "revert_preview",
            ["P"] = { "toggle_preview", config = { use_float = true } },
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = {
                "add",
                -- some commands may take optional config options, see `:h neo-tree-mappings` for details
                config = {
                    show_path = "none" -- "none", "relative", "absolute"
                }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            -- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            ["c"] = {
                "copy",
                config = {
                    show_path = "relative" -- "none", "relative", "absolute"
                }
            },
            -- ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["m"] = {
                "move",
                config = {
                    show_path = "relative" -- "none", "relative", "absolute"
                }
            },
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
        }
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible = false, -- when true, they will just be displayed differently than normal items
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_hidden = false, -- only works on Windows for hidden files/directories
            hide_by_name = {
                --"node_modules"
            },
            hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
            },
            always_show = { -- remains visible even if other settings would normally hide it
                --".gitignored",
            },
            never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                ".DS_Store",
                "thumbs.db"
            },
            never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
            },
        },
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = false, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
        window = {
            mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
            }
        }
    },
    buffers = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
            mappings = {
                ["bd"] = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
            }
        },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"]  = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            }
        }
    }
})

-----------------------------------------------------------------------------
--- marks
-----------------------------------------------------------------------------
require 'marks'.setup {
    -- whether to map keybinds or not. default true
    default_mappings = true,
    -- which builtin marks to show. default {}
    builtin_marks = {}, --{ ".", "<", ">", "^" },
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
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
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
    mappings = {
        set_next = 'm:',
        toggle = "m.",
        next = "m,",
        prev = "m;",
    }
}

map('n', 'mæ', ':delmarks!<cr>', options) -- delete all lowercase marks in buffer

-----------------------------------------------------------------------------
--- aerial
-- @todo: Remove this as i never use it
-----------------------------------------------------------------------------
require('aerial').setup({
    attach_mode = "global",
    -- backends = { "lsp", "treesitter", "markdown" },
    layout = {
        min_width = 28,
    }
    ,
    show_guides = true,
    -- filter_kind = false,
    guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
    },
    on_attach = function(bufnr)
        -- Toggle the aerial window with <leader>a
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
        -- Jump forwards/backwards with '{' and '}'
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '(', '<cmd>AerialPrev<CR>', {})
        vim.api.nvim_buf_set_keymap(bufnr, 'n', ')', '<cmd>AerialNext<CR>', {})
        -- Jump up the tree with '[[' or ']]'
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
        -- vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
    end
})

-----------------------------------------------------------------------------
--- toggleterm
-----------------------------------------------------------------------------
require('toggleterm').setup({
    size = 20,
    -- open_mapping = [[<C-t>]],
    hide_numbers = true,
    -- shade_filetypes = {},
    -- shade_terminals = true,
    -- shading_factor = '1',
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
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

map('n', '<leader>tt', ':ToggleTerm<CR>', options)

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
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


-- chatGTP
require('chatgpt').setup({
    -- welcome_message = WELCOME_MESSAGE, -- set to "" if you don't like the fancy godot robot
    loading_text = "loading",
    question_sign = "", -- you can use emoji if you want e.g. 🙂
    answer_sign = "ﮧ", -- 🤖
    max_line_length = 120,
    yank_register = "+",
    chat_layout = {
        relative = "editor",
        position = "50%",
        size = {
            height = "80%",
            width = "80%",
        },
    },
    settings_window = {
        border = {
            style = "rounded",
            text = {
                top = " Settings ",
            },
        },
    },
    chat_window = {
        filetype = "chatgpt",
        border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
                top = " ChatGPT ",
            },
        },
    },
    chat_input = {
        prompt = "  ",
        border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
                top_align = "center",
                top = " Prompt ",
            },
        },
    },
    openai_params = {
        model = "text-davinci-003",
        frequency_penalty = 0,
        presence_penalty = 0,
        max_tokens = 300,
        temperature = 0,
        top_p = 1,
        n = 1,
    },
    openai_edit_params = {
        model = "code-davinci-edit-001",
        temperature = 0,
        top_p = 1,
        n = 1,
    },
    keymaps = {
        close = "<Esc>",
        yank_last = "<C-y>",
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
        toggle_settings = "<C-o>",
        new_session = "<C-n>",
        cycle_windows = "<Tab>",
    }
})
