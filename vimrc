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
Bundle 'duskhacker/sweet-rspec-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'dougireton/vim-chef'
Bundle 'ck3g/vim-change-hash-syntax'
Bundle 'suan/vim-instant-markdown'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'itchyny/landscape.vim'
"the backslash key is WAY too far away
let mapleader=","

"NERDS!! NERDS!! NERDS!!!
map <Leader>n :NERDTreeToggle<CR>

"I hate the control key but i love multiple windows
nnoremap <silent> <LEADER>w :wincmd w<CR>


"check out the status line on that guy!
let g:bufferline_echo = 0
set laststatus=2
set noshowmode

"lets get serious abou ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
set makeprg=NO_COLOR=true\ rake

"unit testing in quickfix works
map <Leader>T :SweetVimRspecRunFile<CR>
map <Leader>t :SweetVimRspecRunFocused<CR>
let $SWEET_VIM_RSPEC_SHOW_PASSING="true"

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
set number
syntax on
runtime macros/matchit.vim
" Needed for Syntax Highlighting and stuff
set grepprg=grep\ -nH\ $*

"Who doesn't like autoindent?
set autoindent 
set expandtab

" Who wants an 8 character tab?  Not me!
set softtabstop=2
set shiftwidth=2

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

"pretty colors
set background=dark
colorscheme   landscape
highlight Cursor guibg=Red

"ctrlp needs some hints
set wildignore+=*/bin/**
