local g = vim.g
local opt = vim.opt

vim.cmd('set list')
vim.cmd('set smartcase')
vim.cmd('set incsearch')
vim.cmd('syntax enable')
vim.cmd('runtime macros/matchit.vim')
vim.cmd('filetype plugin indent on')

-- Use space as leader
g.mapleader = ' '

-- Color scheme --
g.rose_pine_variant = 'dawn'
g.rose_pine_enable_italics = true
g.rose_pine_disable_background = true
vim.cmd('colorscheme rose-pine')

-- General Configuration --
opt.termguicolors = true
opt.mouse = 'a'                                 -- Enable mouse on all modes
opt.encoding = 'utf-8'                          -- Se default encoding to UTF-8
opt.compatible = false                          -- Don't try to be vi compatible
opt.autoread = true                             -- Auto reload files on external changes
opt.ruler = true                                -- Displays cursor position on the screen
opt.backup = false                              -- Do not create backup files
opt.writebackup = false                         -- No write backups too
opt.swapfile = false                            -- Swap files? No, thanks
opt.fileformats = {'unix', 'dos', 'mac'}	      -- File formats for happiness
opt.visualbell = true                           -- For more silent vim
opt.autoindent = true                           -- Saves a few keystrokes
opt.splitbelow = true                           -- Open splits to bottom
opt.splitright = true                           -- Open splits to right 
opt.relativenumber = true                       -- Set line number relative to current one
opt.ignorecase = true                           -- Ignore case when typing commands
opt.smarttab = true                             -- Do not ignore case with capitals

opt.listchars = { tab = '▸ ', trail = '·', nbsp = '·' } -- Display extra whitespace and tabs

-- Keep indentation consistent
local indent = 2

opt.expandtab = true
opt.tabstop = indent
opt.shiftwidth = indent
opt.softtabstop = indent

-- Highlight on yank
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')

opt.sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"


