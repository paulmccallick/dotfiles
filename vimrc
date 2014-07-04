set nocompatible      " We're running Vim, not Vi!
" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'mileszs/ack.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kana/vim-textobj-user'
Bundle 'textobj-rubyblock'
Bundle 'skalnik/vim-vroom'
Bundle 'benmills/vimux'



filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
set number

"do what it takes to select ruby blocks
runtime macros/matchit.vim
filetype indent plugin on

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*
"let g:vroom_use_dispatch = 1
let g:vroom_use_vimux = 1
"Who doesn't like autoindent?
" #set autoindent

" Who wants an 8 character tab?  Not me!
set autoindent 
set expandtab
set shiftwidth=2
set softtabstop=2

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch
set makeprg=NO_COLOR=true\ rake

syntax on
colorscheme dark-ruby

