vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'rose-pine/neovim', as = 'rose-pine' }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'nvim-treesitter/playground'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'pwntester/octo.nvim',
    config=function()
      require'octo'.setup()
  end}

  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-nvim-lsp'
    }
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  -- Lua
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end
  }

  use {
    'andymass/vim-matchup',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end
  }

  use 'neovim/nvim-lspconfig'
  use 'lspcontainers/lspcontainers.nvim'

  use { 'vim-crystal/vim-crystal' }
  use { 'terrortylor/nvim-comment' }
  use { 'rmagatti/auto-session' }
  use { 'wakatime/vim-wakatime' }
  use { 'tpope/vim-rails' }
  use { 'tpope/vim-fugitive' }
  use { 'jiangmiao/auto-pairs' }
  use { 'tpope/vim-surround' }
  use { 'ggandor/lightspeed.nvim' }
  use { 'mattn/emmet-vim' }
  use { 'kana/vim-textobj-user' }
  use { 'nelstrom/vim-textobj-rubyblock' }
  use { 'amadeus/vim-mjml' }
  use { 'editorconfig/editorconfig-vim' }
  use { 'AndrewRadev/splitjoin.vim' }
  use { 'christoomey/vim-tmux-navigator' }
  use { 'RRethy/nvim-treesitter-endwise' }

  use { '~/code/nvim-rspec' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
