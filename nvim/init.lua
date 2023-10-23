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

    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines (gcc to comment a line)
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use 'tpope/vim-surround' -- enables the s and S command

    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }


    use "folke/todo-comments.nvim"

    use 'xiyaowong/nvim-transparent'
    use 'projekt0n/github-nvim-theme'
    use 'joshdick/onedark.vim'
    use 'sonph/onehalf'
    use 'arcticicestudio/nord-vim'
    use 'sainnhe/edge'
    use { 'rose-pine/neovim', as = 'rose-pine' } -- config = "vim.cmd('colorscheme rose-pine')"}

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
    use 'akinsho/toggleterm.nvim' -- @todo: remove
    use 'chentoast/marks.nvim'
    use 'mbbill/undotree'

    -- visual helpers
    use 'norcalli/nvim-colorizer.lua' -- add colors to hex
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

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

    use { -- @todo: remove
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Markdown and documentation
    use 'mattn/calendar-vim' -- calander for wim diary
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'vimwiki/vimwiki' -- used for markdown notes

end)


vim.cmd [[set termguicolors]]
vim.cmd [[colorscheme edge]]

require('config.nvim-autopairs')
require('config.lsp')
require('maps')
require('settings')
require("config.copilot")
require("config.transparant")
require("config.colorizer")
require("config.gitsigns")
require("config.fugitive")
require("config.indent-blankline")
require("config.goyo")
require("config.telescope")
require("config.harpoon")
require("config.neo-tree")
require("config.marks")
require("config.toggleterm")
require("config.todo-comments")
require('config.vimwiki')
require('config.lualine_custom')
