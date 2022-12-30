-----------------------------------------------------------------------------
-- Install packer
-- Packer is used for all installs. Use PackerClean and PackerInstall to remove/install packages
-----------------------------------------------------------------------------
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

-----------------------------------------------------------------------------
--  Plugins
-----------------------------------------------------------------------------

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager

    -- git related plugins
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github (:Gbrowse--> opens git)
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups

    -- handy dandy shorcut plugins
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines (gcc to comment a line)
    use 'tpope/vim-surround' -- enables the s and S command

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- TODO these suck. should replace
    -- use 'jiangmiao/auto-pairs' -- create pars of brackets etc TODO
    -- use 'alvan/vim-closetag'  -- close jsx/tsx tags TODO
    -- use 'ojroques/vim-oscyank' -- lets you copy to OS clipboard TODO

    -- colorschemas
    -- -- A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
    -- use({
    -- "folke/tokyonight.nvim",
    -- config = function()
    -- require("tokyonight").setup({
    -- style = "night",
    -- transparent = true,
    -- })
    -- vim.cmd([[colorscheme tokyonight]])
    -- end,
    -- })
    use 'xiyaowong/nvim-transparent'
    use 'joshdick/onedark.vim'
    use 'sonph/onehalf'
    use 'arcticicestudio/nord-vim'
    use 'sainnhe/edge'
    use { 'rose-pine/neovim', as = 'rose-pine' } -- config = "vim.cmd('colorscheme rose-pine')"}

    use 'mhinz/vim-startify'


    -- Helper tools for faster workflows
    -- use { 'preservim/nerdtree'} -- file explorer
    -- use 'Xuyuanp/nerdtree-git-plugin' -- add gir related icon in nerdtree to visualize untracked files etc

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                's1n7ax/nvim-window-picker',
                tag = "v1.*",
                config = function()
                    require 'window-picker'.setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" },
                            },
                        },
                        fg_color = '#ededed',
                        current_win_hl_color = '#ff00ff',
                        other_win_hl_color = '#ff00ff',
                    })
                end,
            }
        }
    }

    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } } -- Fancier statusline
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- UI to select things (files, grep results, open buffers...)
    use 'ThePrimeagen/harpoon' -- use for quick commands
    use 'easymotion/vim-easymotion' -- jump to any word you loook at by <leader><leader>w etc
    use 'junegunn/goyo.vim'
    use 'akinsho/toggleterm.nvim'
    use 'chentoast/marks.nvim'
    -- use { 'preservim/tagbar' }

    -- visual helpers
    use 'norcalli/nvim-colorizer.lua' -- add colors to hex
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    -- use 'lukas-reineke/headlines.nvim' -- background highlighting from headlines in markdown, vimwiki and orgmode

    -- Code formatting and language servers
    -- use 'dense-analysis/ale'  -- async linter
    -- use 'sbdchd/neoformat' -- formatter (prettier) TODO
    -- use { 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' }}

    -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management TODO
    use 'nvim-treesitter/nvim-treesitter' -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- ??? Additional textobjects for treesitter

    -- language server plugins
    use 'williamboman/nvim-lsp-installer' -- allows easy lsp installment via :LspInstall
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client. Needed to get quick configs for lsp
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp. Needed to add capabilities to lsp
    -- use 'hrsh7th/cmp-buffer'
    -- use 'hrsh7th/cmp-path'
    -- use 'hrsh7th/cmp-cmdline'

    -- Testing
    use 'vim-test/vim-test'

    -- Snippets (TODO map to something smooth)
    use 'SirVer/ultisnips' -- create own code snippets located at ./Ultisnips
    use({
        "hrsh7th/nvim-cmp",
        requires = { "quangnguyen30192/cmp-nvim-ultisnips",
            config = function()
                -- optional call to setup (see customization section)
                require("cmp_nvim_ultisnips").setup {}
            end,
            -- If you want to enable filetype detection based on treesitter:
            requires = { "nvim-treesitter/nvim-treesitter" },
        },
    })
    -- use 'honza/vim-snippets' -- set of pre-generated snippets for mulitple language
    -- use 'mlaursen/vim-react-snippets' -- spesific reat snippets
    use 'github/copilot.vim'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    } -- TODO
    use 'stevearc/aerial.nvim' -- TODO

    -- Time Tracking
    use 'wakatime/vim-wakatime'

    -- Markdown and documentation
    use 'mattn/calendar-vim' -- calander for wim diary
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'vimwiki/vimwiki' -- used for markdown notes
end)


local npairs = require('nvim-autopairs')
-- add option map_cr
npairs.setup({ map_cr = true, check_ts = true })
-----------------------------------------------------------------------------
--  linting
-----------------------------------------------------------------------------

-- local null_ls = require("null-ls")

-- local function has_eslint_configured(utils)
--   return utils.root_has_file("/.eslintrc.js") or  utils.root_has_file("/.eslintrc.json")
-- end

-- -- use local eslint if possible
-- local project_local_bin = "node_modules/.bin/eslint"

-- null_ls.setup({
--   sources = {
--     null_ls.builtins.code_actions.eslint.with({
--         condition = has_eslint_configured,
--         command = has_eslint_configured and project_local_bin or "eslint"
--         }),
--     null_ls.builtins.diagnostics.eslint.with({
--         condition = has_eslint_configured,
--         command = has_eslint_configured and project_local_bin or "eslint"
--         }),
--     null_ls.builtins.formatting.eslint.with({
--         condition = has_eslint_configured,
--         command = has_eslint_configured and project_local_bin or "eslint"
--         }),
--   }
-- })

-----------------------------------------------------------------------------
-- autocammand setting .mdx to markdown
-----------------------------------------------------------------------------
vim.cmd [[
    autocmd BufNewFile,BufRead *.mdx :set filetype=vimwiki
]]

-----------------------------------------------------------------------------
--Set colorscheme (order is important here)
-----------------------------------------------------------------------------

-- vim.o.termguicolors = false
--vim.g.onedark_terminal_italics = 2
vim.cmd [[set termguicolors]]
-- vim.cmd [[set background=dark]]
-- vim.cmd [[colorscheme onedark]]
-- vim.g.edge_style = 'aura'
-- vim.g.edge_better_performanc = 1
vim.cmd [[colorscheme edge]]

-----------------------------------------------------------------------------
-- Highlight on yank
-----------------------------------------------------------------------------
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-----------------------------------------------------------------------------
-- Treesitter configuration with extended treesitter-text-objects
-----------------------------------------------------------------------------

-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true, -- false will disable the whole extension
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
    },
}

-----------------------------------------------------------------------------
-- LSP settings
-----------------------------------------------------------------------------

local lspconfig = require 'lspconfig'

-- on_attach for all servers
local on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    -- require("aerial").on_attach(_, bufnr)
    --go-to definition etc
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- goes to where it is defined
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gv', ':vs<CR> <cmd>lua vim.lsp.buf.definition()<CR>', opts) -- goes to where it is defined
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts) -- quiclist of all references
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

    -- formatting on buffer AND an visual selection
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l', '<cmd>lua vim.lsp.buf.format({ filter = function(client) return client.name == "null-ls" end, bufnr = bufnr})<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>l', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>l', '<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

    -- rename
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts) -- renames inside the current buffer

    -- info
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts) -- gives a list of action the IDE can do for you
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
        [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts) -- list all variables in float

    -- diagnostics
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '-', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '_', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>-', '<cmd>TroubleToggle<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>-', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts) -- shows the error message in a float

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buftype_definition()<CR>', opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]] -- TODO do i need ?
end

-- make sure refertences do not open quicjlist
vim.lsp.handlers['textdocument/references'] = function(_, result)
    vim.g.lsp_last_word = vim.fn.expand('<cword>')
    if not result then return end
    if #result == 0 then
        vim.cmd [[ echo "getting references..."]]
        return
    end
    vim.cmd [[ echo ""]]
    local util = require('vim.lsp.util')
    -- util.set_qflist(util.locations_to_items(result))
    -- require('plugins.fzf').quickfix(vim.fn.expand('<cword>'));
    -- api.nvim_command("copen")
    -- api.nvim_command("wincmd p")
end


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'tailwindcss' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

-- tsserver spesific setup
lspconfig.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { vim.env.HOME .. "/.local/share/nvim/lsp_servers/tsserver/node_modules/.bin/typescript-language-server",
        "--stdio" },
}

-- tailwind spesific setup
lspconfig.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { vim.env.HOME ..
        "/.local/share/nvim/lsp_servers/tailwindcss_npm/node_modules/.bin/tailwindcss-language-server", "--stdio" },
}

-- lua spesific setyp
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
table.insert(runtime_path, '/tmp/nvim/?.lua')
table.insert(runtime_path, '/tmp/nvim/lua/?.lua')

lspconfig.sumneko_lua.setup {
    cmd = { vim.env.HOME .. "/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

-- svelte spesific setup
lspconfig.svelte.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "svelte" },
    settings = {
        plugin = {
            html = { completions = { enable = true, emmet = false } },
            svelte = { completions = { enable = true, emmet = false } },
            css = { completions = { enable = true, emmet = true } },
        },
    },
})

-- grapql spesific setup
lspconfig.graphql.setup {}


-- TODO move to plugins
-------------------------------------------------------------------------------
---- ultisnip setup
-------------------------------------------------------------------------------
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = "ultisnips" },
        -- more sources
    },
    -- recommended configuration for <Tab> people:
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(
            function(fallback)
                cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
            function(fallback)
                cmp_ultisnips_mappings.jump_backwards(fallback)
            end,
            { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
    },
}

-----------------------------------------------------------------------------
-- import other vim files
-----------------------------------------------------------------------------
-- TODO add lsp and linter stuff ???
-- TODO add colorscheme file
-- TODO add snippet stuff?
--
require('maps')
require('settings')
require('plugins')
