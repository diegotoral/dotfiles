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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" == PLUGINS ==
filetype off                                  " Force plugins to load correctly
set rtp+=~/.vim/bundle/Vundle.vim             " set the runtime path to include Vundle and initialize
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                 " Let Vundle manage Vundle

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Raimondi/delimitMate'
Plugin 'Raimondi/vim_search_objects'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-dispatch'

Plugin 'vim-ruby/vim-ruby'

Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jparise/vim-graphql'
Plugin 'kien/ctrlp.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'mattn/emmet-vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'posva/vim-vue'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'valloric/youcompleteme'
Plugin 'sheerun/vim-polyglot'
Plugin 'w0rp/ale'
Plugin 'dkprice/vim-easygrep'

Plugin 'dracula/vim'                          " The best color scheme ever

" -- END PLUGINS --
call vundle#end()

" ~~ vim-vue ~~
" Workaround for highlight randomly stop working
autocmd FileType vue syntax sync fromstart

" ~~ Vim Airline ~~
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

" == NerdTree configuration ==
let NERDTreeMinimalUI = 1                     " Disable help text
let NERDTreeDirArrows = 1                     " Display arrows for directories

" == NERDTreeTabs ==
let g:nerdtree_tabs_open_on_console_startup = 1

" == NERDCommenter ==
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" == Ctrlp ==
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$|bower_components|node_modules',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }

" Use The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor        " Use Ag over Grep
  let g:ctrlp_use_caching = 0                 " ag is fast enough that CtrlP doesn't need to cache

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag --literal --files-with-matches --nocolor --hidden --filename-pattern "" %s'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" ~~ EasyMotion ~~
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" Keybindings
nmap s <Plug>(easymotion-overwin-f)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ~~ Dispatch ~~
" Remove iterm from dispatch
let g:dispatch_handlers =  ['tmux', 'screen', 'windows', 'x11', 'headless']

" == COLOR SCHEME ==
colorscheme dracula                                   " Use the best color scheme
set guifont=Source\ Code\ Pro\ for\ Powerline:h11     " Use a better fontface

" Quick fix for highligh issues of es6 code
" source: https://github.com/dracula/vim/issues/23#issuecomment-360582872
hi link jsModuleKeyword Identifier
hi link jsVariableDef   Identifier
hi link jsFuncArgs      Identifier
hi link jsFuncCall      Function
hi link jsObjectProp    Identifier
hi link jsObjectKey     Label
hi link jsObjectValue   Normal

function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

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
