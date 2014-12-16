set number
set tabstop=2
set autoindent
set smarttab
set expandtab
set shiftwidth=2
set nocompatible
set hlsearch
set incsearch
set cursorline
set foldmethod=manual
set tags=tags
set laststatus=2
set nobackup
set noswapfile
set backspace=indent,eol,start

"colorscheme molokai
"colorscheme jellybeans
colorscheme hybrid
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night-Bright
"set background=dark

"save undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"set cusor on last saved line
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\""

syntax off
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

runtime macros/matchit.vim

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle "Townk/vim-autoclose"
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-scripts/matchparenpp'
NeoBundle 'thinca/vim-qfreplace'

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

NeoBundle 'tpope/vim-fugitive'
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gpo :Gpush origin<CR>

NeoBundle 'int3/vim-extradite'
nnoremap <silent> ,gl :Extradite<CR>

NeoBundle 'gregsexton/gitv'
nmap <leader>gv :Gitv<cr>

NeoBundle 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

NeoBundle 'Shougo/vimproc.vim' , {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak'},
\}
NeoBundle 'Shougo/vimshell.vim'
nnoremap <silent> ,sh :VimShell<CR>

NeoBundle 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

nnoremap <silent> ,bp obinding.pry<ESC>

NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'outputter': 'browser'
      \ }

NeoBundle 'bling/vim-airline'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

""for php
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

NeoBundle 'jeetsukumaran/vim-buffergator'

NeoBundle "majutsushi/tagbar"
nmap <silent> ,t :TagbarToggle<CR>

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

map <silent> <F2> :SrcExpl <CR>
let g:SrcExpl_jumpKey = "<ENTER>"
let g:SrcExpl_gobackKey = "<SPACE>"

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS


let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 240
let g:indentLine_char = '¦'

NeoBundle 'h1mesuke/vim-alignta'
set ambiwidth=double
xnoremap <silent> A  :Alignta =>\=<CR>
xnoremap <silent> a: :Alignta  01 :<CR>
xmap <silent><expr> as mode() !=# 'v' ? ':Alignta \S\+'."\<CR>" : 'as'
xnoremap al :Alignta<Space>


NeoBundle 'tomtom/tcomment_vim'

NeoBundle 't9md/vim-quickhl'
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" text object
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'rhysd/vim-textobj-ruby'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'deris/vim-textobj-enclosedsyntax'
NeoBundle 'thinca/vim-textobj-function-javascript'
NeoBundle 'osyo-manga/vim-textobj-multitextobj'

map _  <Plug>(operator-replace)

omap ab <Plug>(textobj-multiblock-a)
omap ib <Plug>(textobj-multiblock-i)
xmap ab <Plug>(textobj-multiblock-a)
xmap ib <Plug>(textobj-multiblock-i)

let g:textobj_multitextobj_textobjects_i = [
\   "\<Plug>(textobj-enclosedsyntax-i)",
\   "\<Plug>(textobj-multiblock-i)",
\   "\<Plug>(textobj-function-i)",
\]

let g:textobj_multitextobj_textobjects_a = [
\   "\<Plug>(textobj-enclosedsyntax-a)",
\   "\<Plug>(textobj-multiblock-a)",
\   "\<Plug>(textobj-function-a)",
\]

omap amt <Plug>(textobj-multitextobj-a)
omap imt <Plug>(textobj-multitextobj-i)
vmap amt <Plug>(textobj-multitextobj-a)

"for ruby
NeoBundle "vim-scripts/ruby-matchit"
NeoBundle "tpope/vim-endwise"
NeoBundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>

NeoBundle 'tpope/vim-rails'

""for javascript
NeoBundle 'jelera/vim-javascript-syntax'

NeoBundle 'myhere/vim-nodejs-complete'
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

NeoBundle 'jiangmiao/simple-javascript-indenter'
let g:SimpleJsIndenter_BriefMode = 2

"for coffee
NeoBundle 'kchmck/vim-coffee-script'
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee

NeoBundle 'rking/ag.vim'

set encoding=utf-8
filetype plugin indent on     " required!
filetype indent on
filetype on
syntax on
