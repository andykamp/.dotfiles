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
    use 'projekt0n/github-nvim-theme'
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
    use {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    }

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
    
    -- ai motherfucker :P 
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

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
-- import other vim files
-----------------------------------------------------------------------------
-- TODO add lsp and linter stuff ???
-- TODO add colorscheme file
-- TODO add snippet stuff?
--
require('lsp')
require('maps')
require('settings')
require('plugins')
require('vimwiki')
