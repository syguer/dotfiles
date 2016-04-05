"init all settings
set all&
" init autocmd
autocmd!

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
set scrolloff=5
set iskeyword+=-

"colorscheme molokai
" colorscheme jellybeans
colorscheme hybrid
" colorscheme PaperColor
"colorscheme Tomorrow-Night
"colorscheme Tomorrow-Night-Eighties
"colorscheme Tomorrow-Night-Bright
" set background=dark

" augroup source-vimrc
"   autocmd!
"   autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
"   autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
" augroup END

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
endif

call neobundle#begin(expand('~/.vim/bundle/'))
runtime macros/matchit.vim

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-surround'
" NeoBundle "Townk/vim-autoclose"
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'vim-scripts/matchparenpp'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'ujihisa/neco-look'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'kana/vim-tabpagecd'
" NeoBundle 'mhinz/vim-startify'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle "garbas/vim-snipmate"
NeoBundle 'KabbAmine/vCoolor.vim'
NeoBundle 'slim-template/vim-slim'

NeoBundle 'ap/vim-css-color'

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-e> <End>
cnoremap <C-a> <Home>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap Q :ccl<CR>
nnoremap <C-h> :noh<CR>
nnoremap <C-=> vii=<CR>
nnoremap <C-n> obinding.pry<ESC>
nnoremap <C-\><C-\> ^i\| <ESC>

nnoremap <Leader>; A;<ESC>
nnoremap <Leader>, A,<ESC>

nnoremap <Space>[ ^<ESC>
nnoremap <Space>] $<ESC>
nnoremap <Space>c :echo @%<CR>

noremap @t :call InsertTodo()<CR>
noremap @f :call InsertFixme()<CR>
noremap @s :call InsertUseStrict()<CR>

NeoBundle 'scrooloose/syntastic'
let g:syntastic_scss_checkers = []

" CtrlP
NeoBundle "ctrlpvim/ctrlp.vim"
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_clear_cache_on_exit = 0

NeoBundle 'nixprime/cpsm'
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_user_command = 'files -a %s'

" NeoBundle "vim-scripts/vim-auto-save"
" let g:auto_save = 1
" let g:auto_save_in_insert_mode = 0
" let g:auto_save_no_updatetime = 1

function! InsertTodo()
  let l:module_name = '# TODO: '
  execute ":normal i" . l:module_name
endfunction

function! InsertFixme()
  let l:module_name = '# FIXME: '
  execute ":normal i" . l:module_name
endfunction

function! InsertUseStrict()
  let l:str = "'use strict';"
  execute ":normal ggO" . l:str
endfunction

NeoBundle 'thinca/vim-qfreplace'
nnoremap <Leader>Q :Qfreplace<ESC>

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tsukkee/unite-tag'
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f   :<C-u>Unite file<CR>
nnoremap <silent> [unite]u   :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]y   :<C-u>Unite history/yank<CR>
nnoremap <silent> [unite]s   :<C-u>Unite source<CR>
nnoremap <silent> [unite]t   :<C-u>Unite tag<CR>
let g:unite_source_history_yank_enable = 1

NeoBundle 'rking/ag.vim'
let g:ag_prg="ag --column"

NeoBundle 'tpope/vim-fugitive'
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gpo :Gpush origin<CR>
nnoremap <silent> ,gco :Git checkout

NeoBundle 'int3/vim-extradite'
nnoremap <silent> ,gl :Extradite<CR>

NeoBundle 'gregsexton/gitv'
nmap <leader>gv :Gitv<cr>

NeoBundle 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)

NeoBundle 'Shougo/vimproc.vim' , {
      \ 'build' : {
      \     'linux' : 'make'},
\}
NeoBundle 'Shougo/vimshell.vim'
nnoremap <silent> ,sh :VimShell<CR>

NeoBundle 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

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
" autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

NeoBundle 'jeetsukumaran/vim-buffergator'
let g:buffergator_viewport_split_policy = "B"

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
let g:acp_enableAtStartup = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#disable_auto_complete = 0
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#manual_completion_start_length = 2
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#max_list = 10
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-n> neocomplete#start_manual_complete()

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

NeoBundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 240
let g:indentLine_char = '¦'
" let g:indentLine_faster = 1

NeoBundle 'h1mesuke/vim-alignta'
set ambiwidth=double
xnoremap <silent> A  :Alignta =>\=<CR>
xnoremap <silent> a: :Alignta  01 :<CR>
xmap <silent><expr> as mode() !=# 'v' ? ':Alignta \S\+'."\<CR>" : 'as'
xnoremap al :Alignta<Space>

NeoBundle 'junegunn/vim-easy-align'
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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
" NeoBundle 'kana/vim-textobj-function'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'deris/vim-textobj-enclosedsyntax'
" NeoBundle 'thinca/vim-textobj-function-javascript'
NeoBundle 'osyo-manga/vim-textobj-multitextobj'
NeoBundle 'lucapette/vim-textobj-underscore'
NeoBundle 'thinca/vim-textobj-between'
" map _  <Plug>(operator-replace)

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


omap iF <Plug>(textobj-function-i)
omap aF <Plug>(textobj-function-a)
vmap iF <Plug>(textobj-function-i)
vmap aF <Plug>(textobj-function-a)

NeoBundle 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0


" ref
NeoBundle "thinca/vim-ref"
NeoBundle "yuku-t/vim-ref-ri"

NeoBundle 'soramugi/auto-ctags.vim'
let g:auto_ctags = 1

"for ruby
NeoBundle "vim-scripts/ruby-matchit"
NeoBundle "tpope/vim-endwise"
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'ecomba/vim-ruby-refactoring'
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

"for golang
NeoBundle 'vim-jp/vim-go-extra'
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
au FileType go setlocal sw=4 ts=4 sts=4 noet

call neobundle#end()
set encoding=utf-8
filetype plugin indent on     " required!
filetype indent on
filetype on
syntax on
