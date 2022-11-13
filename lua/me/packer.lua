-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Color scheme
  use 'folke/tokyonight.nvim'
  
  -- Fuzzy Finder
  -- use '/usr/bin/fzf'
  use 'junegunn/fzf.vim'

  -- File exporer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- LSP - Language Servers
  use { "williamboman/mason.nvim" } -- to install LSP servers
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  -- Code completion
  --   use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  --   use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use 'saadparwaiz1/cmp_luasnip'

  -- comments
  use({"https://github.com/tpope/vim-commentary"})

  -- Telescope
  use 'sharkdp/fd'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- DAP - Debug Adaptor Protocol
  use 'mfussenegger/nvim-dap'

  -- Markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  require("nvim-tree").setup()
end)

