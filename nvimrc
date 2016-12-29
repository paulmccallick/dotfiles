call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'textobj-rubyblock'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'bling/vim-airline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'itchyny/landscape.vim'
Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'othree/xml.vim'
Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'


" javascript
Plug 'ternjs/tern_for_vim'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'othree/javascript-libraries-syntax.vim'

" Java and friends
Plug 'tfnico/vim-gradle'
call plug#end()

set termguicolors

" neomake highlighting
let g:neomake_error_sign = {'text': 'E>', 'texthl': 'Error'}
let g:neomake_warning_sign = {
      \   'text': 'W>',
      \   'texthl': 'Search',
      \ }
let g:neomake_message_sign = {
      \   'text': '➤',
      \   'texthl': 'DiffAdd',
      \ }
let g:neomake_informational_sign = {
      \   'text': 'I>',
      \   'texthl': 'Question',
      \ }

autocmd BufWritePost,BufEnter * Neomake

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 50
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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
autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>
set number

runtime macros/matchit.vim



" Who wants an 8 character tab?  Not me!
set softtabstop=2
set shiftwidth=2

" Cool tab completion stuff
" set wildmode=list:longest,full

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Incremental searching is sexy
" set incsearch

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

"==============Ack======================
let g:ackhighlight = 1

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
