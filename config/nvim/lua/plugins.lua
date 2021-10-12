vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

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
      'ray-x/cmp-treesitter'
    }
  }


  use {
    'nvim-neorg/neorg',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use { 'Pocco81/TrueZen.nvim' }
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
  use { 'andymass/vim-matchup' }
  use { 'editorconfig/editorconfig-vim' }
end)

