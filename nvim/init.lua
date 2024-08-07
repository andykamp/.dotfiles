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
  -- @todo:added for folds
  -- use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

  -- use {
  --   "folke/which-key.nvim",
  --   config = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 0
  --     require("which-key").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- }
  use 'tpope/vim-sleuth'
  use 'wbthomason/packer.nvim' -- Package manager
  use 'nvim-tree/nvim-web-devicons'

  -- git related plugins
  use 'tpope/vim-fugitive'                                                  -- Git commands in nvim
  use 'tpope/vim-rhubarb'                                                   -- Fugitive-companion to interact with github (:Gbrowse--> opens git)
  use "sindrets/diffview.nvim"
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } } -- Add git related info in the signs columns and popups

  use 'tpope/vim-commentary'                                                -- "gc" to comment visual regions/lines (gcc to comment a line)
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use 'tpope/vim-surround' -- enables the s and S command

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'rrethy/vim-illuminate',
    event = { 'CursorMoved', 'InsertLeave' },
    config = function()
      local i = require('illuminate')
      i.configure({
        filetypes_denylist = {
          'neo-tree',
          'telescope',
          'nvim-tree',
        },
      })
      -- vim.keymap.set('n', '<a-n>', i.goto_next_reference, { desc = 'move to next reference' })
      -- vim.keymap.set('n', '<a-N>', i.goto_prev_reference, { desc = 'move to previous reference' })
    end,
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use({
    "stevearc/conform.nvim",
  })

  use "folke/todo-comments.nvim"
  use("petertriho/nvim-scrollbar")

  use { "catppuccin/nvim", as = "catppuccin" }
  use 'xiyaowong/nvim-transparent'
  use 'projekt0n/github-nvim-theme'
  use 'joshdick/onedark.vim'
  use 'sonph/onehalf'
  use 'arcticicestudio/nord-vim'
  use 'andykamp/edge.nvim'                     -- own fork of edge theme
  use { 'rose-pine/neovim', as = 'rose-pine' } -- config = "vim.cmd('colorscheme rose-pine')"}

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
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

  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } } -- Fancier statusline
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }               -- UI to select things (files, grep results, open buffers...)
  use 'ThePrimeagen/harpoon'                                                                    -- use for quick commands
  -- use 'easymotion/vim-easymotion' -- jump to any word you loook at by <leader><leader>w etc
  use("phaazon/hop.nvim")
  use("folke/flash.nvim")

  use 'junegunn/goyo.vim'
  use 'chentoast/marks.nvim'
  use 'mbbill/undotree'

  -- visual helpers
  use 'norcalli/nvim-colorizer.lua'         -- add colors to hex
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'junegunn/limelight.vim'

  use 'nvim-treesitter/nvim-treesitter'             -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter-textobjects' -- ??? Additional textobjects for treesitter
  use 'windwp/nvim-ts-autotag'
  -- use 'andymass/vim-matchup'

  -- language server plugins
  use 'williamboman/nvim-lsp-installer' -- allows easy lsp installment via :LspInstall
  use 'neovim/nvim-lspconfig'           -- Collection of configurations for built-in LSP client. Needed to get quick configs for lsp
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP source for nvim-cmp. Needed to add capabilities to lsp
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  use {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  }
  -- use({
  --     'nvimdev/lspsaga.nvim',
  --     after = 'nvim-lspconfig',
  -- })
  use({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
      require('lspsaga').setup({})
    end,
  })


  -- -- yarn type-check for typescript that puts it directly in your quickfix list
  -- use 'dmmulroy/tsc.nvim'

  -- use 'AndrewRadev/splitjoin.vim'
  use 'echasnovski/mini.splitjoin'

  -- Snippets (TODO map to something smooth)
  use 'SirVer/ultisnips' -- create own code snippets located at ./Ultisnips
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "quangnguyen30192/cmp-nvim-ultisnips",
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
    requires = "nvim-tree/nvim-web-devicons"
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
vim.gedge_better_performance = 1
vim.cmd [[colorscheme edge]]

require('config.nvim-autopairs')
require('config.lsp')
require('maps')
require('settings')
require('nvim-web-devicons')
require("config.copilot")
require("config.diffview")
require("config.scrollbar")
require("config.transparant")
require("config.trouble")
require("config.hop")
require("config.flash")
require("config.colorizer")
require("config.gitsigns")
require("config.indent-blankline")
require("config.goyo")
require("config.telescope")
require("config.harpoon")
require("config.neo-tree")
require("config.marks")
require("config.todo-comments")
require('config.vimwiki')
require('config.lualine_custom')
require('config.splitjoin')
require('config.quickfix')
require('config.conform')
require('config.lspsaga')
require('config.catppuccin')
require('config.limelight')
require('config.nvim-ts-autotag')
-- require('config.tsc')
