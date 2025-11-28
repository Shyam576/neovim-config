-- bootstrap lazy.nvim then list plugins and configure
local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git','clone','--filter=blob:none','https://github.com/folke/lazy.nvim.git','--branch=stable',lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- colorscheme
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = function() vim.cmd('colorscheme gruvbox') end },

  -- file explorer & icons
  { 'nvim-tree/nvim-tree.lua', dependencies = {'nvim-tree/nvim-web-devicons'}, config = function() require('plugins.nvim-tree') end },

  -- telescope
  { 'nvim-telescope/telescope.nvim', dependencies = {'nvim-lua/plenary.nvim'}, config = function() require('plugins.telescope') end },

  -- treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = function() require('plugins.treesitter') end },

  -- LSP + completion
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim', config = true },
  { 'williamboman/mason-lspconfig.nvim', dependencies = {'williamboman/mason.nvim'} },
  { 'hrsh7th/nvim-cmp', dependencies = {'hrsh7th/cmp-nvim-lsp','L3MON4D3/LuaSnip'}, config = function() require('plugins.lsp.cmp') end },
  { 'hrsh7th/cmp-buffer' }, { 'hrsh7th/cmp-path' }, { 'saadparwaiz1/cmp_luasnip' },

  -- quality of life
  { 'numToStr/Comment.nvim', config = true },
  { 'windwp/nvim-autopairs', config = true },
  { 'kylechui/nvim-surround', config = true },
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', config = true },
  { 'stevearc/conform.nvim' },
  { 'akinsho/toggleterm.nvim', config = true },

  -- ui
  { 'nvim-lualine/lualine.nvim', config = function() require('plugins.ui') end },
  { 'akinsho/bufferline.nvim', version = '*', dependencies = {'nvim-tree/nvim-web-devicons'}, config = true },
  { 'folke/which-key.nvim', config = true },
  { 'rcarriga/nvim-notify', config = true },

  -- git
  { 'lewis6991/gitsigns.nvim', config = function() require('plugins.git') end },
  { 'tpope/vim-fugitive' },
  { 'famiu/bufdelete.nvim' },

  -- diagnostics / lsp ui
  { 'glepnir/lspsaga.nvim', branch = 'main', config = true },
  { 'folke/trouble.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}, config = true },

  -- sessions and persistence
  { 'folke/persistence.nvim' },
})

-- load lsp setup
require('plugins.lsp')
