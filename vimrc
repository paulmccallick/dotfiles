set nocompatible      " We're running Vim, not Vi!
" Required Vundle setup
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-endwise'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kana/vim-textobj-user'
Bundle 'textobj-rubyblock'
Bundle 'skalnik/vim-vroom'
Bundle 'paulmccallick/sweet-rspec-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdtree'
Bundle 'dougireton/vim-chef'
Bundle 'ck3g/vim-change-hash-syntax'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'itchyny/landscape.vim'
Bundle 'majutsushi/tagbar'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'PProvost/vim-ps1'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-sexp-mappings-for-regular-people'
Bundle 'guns/vim-sexp'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'guns/vim-clojure-static'
Bundle 'guns/vim-clojure-highlight'
Bundle 'luochen1990/rainbow'
Bundle 'OmniSharp/omnisharp-vim'
Bundle 'othree/xml.vim'
Bundle 'suan/vim-instant-markdown'

"the backslash key is WAY too far away
let mapleader=","

" rainbow power
let g:rainbow_active = 1

"NERDS!! NERDS!! NERDS!!!
map <Leader>n :NERDTreeToggle<CR>

map Y y$

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
let t:SweetVimRspecVersion = 3
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
set number
syntax on
runtime macros/matchit.vim

" Searching and replace for the thing under the cursor
:vnoremap <Leader>s "hy:%s/<C-r>h//gc<left><left><left> 

" Highlighting
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
highlight MatchParen ctermbg=yellow guibg=lightblue



"ctrlp needs some hints
set wildignore+=*/bin/**

"===============YouCompleteMe=================
"gather hints from strings
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
let g:ycm_collect_identifiers_from_tags_files = 1
let g:EclimCompletionMethod = 'omnifunc'

"==============Mack===========================
"
function! Mack(cmd, args)
  mark Q
  Ack
  call ack#Ack(a:cmd, a:args)
endfunction
command! -nargs=* Mack           :call Mack('grep<bang>', <q-args>)

"
"==============Ack======================
let g:ackhighlight = 1

"
"===========Ultisnips==================
"let g:UltiSnipsExpandTrigger = '<CR>'

"=========== XML INDENT ==============
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
