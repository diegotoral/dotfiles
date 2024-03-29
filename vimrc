runtime macros/matchit.vim

" == GENERAL CONFIGURATION ==
syntax on                                     " Syntax highlight for a better life
set nocompatible                              " Don't try to be vi compatible
set autoread                                  " Auto reload the file on external changes
set encoding=utf-8                            " Set default encoding to UTF-8
set nobackup                                  " No backup files please
set nowritebackup                             " No write backup files too
set noswapfile                                " Swap files? No, thanks
set fileformats=unix,dos,mac                  " File formats for happiness
set visualbell                                " For a more silent vim
set mouse=a                                   " Enable mouse on all modes
set ruler                                     " Displays cursor position on the screen
set autoindent                                " Saves a few keystrokes
set splitbelow                                " Open splits to bottom
set splitright                                " Open splits to right
" set cursorline                              " Highlights current cursor line (slow)
set relativenumber                            " Set line numbers relative to current one
set smarttab

let mapleader = ' '                           " Use space as leader

set list listchars=tab:»·,trail:·,nbsp:·      " Display extra whitespace and tabs

" Better Ruby completition with omnicomplete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" == MACVIM CONFIGURATION ==
set guioptions=                               " Disable all scrollbars

" == KEY BINDINGS ==
" Quick window movement
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" == PLUGINS ==
filetype off                                  " Force plugins to load correctly
call plug#begin()

Plug 'rose-pine/neovim'
Plug 'christoomey/vim-tmux-navigator'

Plug 'wakatime/vim-wakatime'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Raimondi/delimitMate'
Plug 'Raimondi/vim_search_objects'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-obsession'

Plug 'vim-ruby/vim-ruby'

Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'jparise/vim-graphql'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'kana/vim-textobj-user'
Plug 'mattn/emmet-vim'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'posva/vim-vue'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'dkprice/vim-easygrep'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plug 'dracula/vim'                          " The best color scheme ever
Plug 'arcticicestudio/nord-vim'

" -- END PLUGINS --
call plug#end()

" Use deoplete
let g:deoplete#enable_at_startup = 1

" Autocomplete on Tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ~~ utisnips ~~
let g:UltiSnipsExpandTrigger="<C-l>"

" ~~ vim-vue ~~
" Workaround for highlight randomly stop working
autocmd FileType vue syntax sync fromstart

" ~~ Vim Airline ~~
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" == NerdTree configuration ==
let NERDTreeMinimalUI = 1                     " Disable help text
let NERDTreeDirArrows = 1                     " Display arrows for directories
" nmap <leader>ne :NERDTreeToggle<cr>
map <silent> <C-n> :NERDTreeToggle<CR>

" == NERDTreeTabs ==
let g:nerdtree_tabs_open_on_console_startup = 1

" == NERDCommenter ==
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'

" == Ctrlp ==
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }

nnoremap <Leader>fu :CtrlPFunky<Cr>

" Use The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor        " Use Ag over Grep
  let g:ctrlp_use_caching = 0                 " ag is fast enough that CtrlP doesn't need to cache

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --ignore .git --hidden --filename-pattern "" %s'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ~~ EasyMotion ~~
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" Keybindings
nmap s <Plug>(easymotion-overwin-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ~~ Ale ~~
" let g:ale_ruby_rubocop_executable = 'rubocop'
let g:airline#extensions#ale#enabled = 1

" ~~ Dispatch ~~
" Remove iterm from dispatch
let g:dispatch_handlers =  ['tmux', 'screen', 'windows', 'x11', 'headless']

" == COLOR SCHEME ==
lua << EOF
  vim.cmd('colorscheme rose-pine')

  -- Set variant
  -- @usage 'base' | 'moon' | 'dawn' | 'rose-pine[-moon][-dawn]'
  vim.g.rose_pine_variant = 'dawn'

  -- Enable italics
  vim.g.rose_pine_enable_italics = true

  -- Use terminal background
  -- Note: Set to true to fix any funky background colors
  vim.g.rose_pine_disable_background = true

  -- Switch to specified variant
  require('rose-pine.functions').select_variant('dawn')
EOF

" colorscheme nord                                   " Use the best color scheme
set guifont=Fira\ Mono\ for\ Powerline:h11            " Use a better fontface
" set guifont=Source\ Code\ Pro\ for\ Powerline:h11     " Use a better fontface

" == UNCATEGORIZED OR UKNOWN CONFIGURATION ==
set completeopt+=menuone

""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
    syntax enable
endif

" Security
set modelines=0

" Use :help 'option' to see the documentation for the given option
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch

set laststatus=2
set showcmd
set wildmenu

set tabstop=2 shiftwidth=2 expandtab

set list

set number
set hlsearch
set ignorecase
set smartcase

set updatetime=250
highlight Normal ctermbg=None
