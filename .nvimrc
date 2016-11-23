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
set ttimeout
set ttimeoutlen=100

colorscheme hybrid

"save undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"set cusor on last saved line
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\""

syntax off
filetype off

if &compatible
  set nocompatible
endif

set runtimepath^=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))
runtime macros/matchit.vim

augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" originalrepos on github
call dein#add('Shougo/neobundle.vim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-markdown')
call dein#add('tyru/open-browser.vim')
call dein#add('digitaltoad/vim-jade')
call dein#add('hail2u/vim-css3-syntax')
call dein#add('vim-scripts/matchparenpp')
call dein#add('tpope/vim-abolish')
call dein#add('ujihisa/neco-look')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-speeddating')
call dein#add('kana/vim-tabpagecd')
call dein#add('tomtom/tlib_vim')
call dein#add('MarcWeber/vim-addon-mw-utils')
call dein#add("garbas/vim-snipmate")
call dein#add('KabbAmine/vCoolor.vim')
call dein#add('slim-template/vim-slim')
call dein#add('tomtom/tcomment_vim')
call dein#add('ap/vim-css-color')

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

" CtrlP
call dein#add("ctrlpvim/ctrlp.vim")
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_extensions = ['mixed']
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_mruf_relative = 1

call dein#add('nixprime/cpsm')
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_user_command = 'files -a %s'

call dein#add('thinca/vim-qfreplace')
nnoremap <Leader>Q :Qfreplace<ESC>

call dein#add('rking/ag.vim')
let g:ag_prg="ag --column"

call dein#add('tpope/vim-fugitive')
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gd :Gdiff<CR>
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gpo :Gpush origin<CR>
nnoremap <silent> ,gco :Git checkout

call dein#add('airblade/vim-gitgutter')
let g:gitgutter_realtime = 0
nnoremap ,h :GitGutterLineHighlightsToggle<CR>

call dein#add('thinca/vim-quickrun')
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'outputter': 'browser'
      \ }

call dein#add('bling/vim-airline')
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

call dein#add('scrooloose/nerdtree.git')
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

call dein#add("majutsushi/tagbar")
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

call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1
" call dein#add('Shougo/neocomplete')
" let g:acp_enableAtStartup = 1
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#disable_auto_complete = 0
" let g:neocomplete#enable_fuzzy_completion = 0
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#manual_completion_start_length = 2
" let g:neocomplete#auto_completion_start_length = 2
" let g:neocomplete#sources#syntax#min_keyword_length = 2
" let g:neocomplete#max_list = 10
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction

" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><C-n> neocomplete#start_manual_complete()
"
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplete#close_popup()
" inoremap <expr><C-e>  neocomplete#cancel_popup()
"
" if !exists('g:neocomplete#text_mode_filetypes')
"   let g:neocomplete#text_mode_filetypes = {}
" endif
" let g:neocomplete#text_mode_filetypes = {
"   \ 'markdown': 1,
"   \ 'gitrebase': 1,
"   \ 'gitcommit': 1,
"   \ 'text': 1,
"   \ 'help': 1,
"   \ 'tex': 1,
"   \ 'ruby': 1,
"   \ 'javascript': 1,
"   \ 'coffeescript': 1,
"   \ 'css': 1,
"   \ 'sass': 1
" \ }

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#enable_snipmate_compatibility = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

call dein#add('Yggdroot/indentLine')
let g:indentLine_color_term = 240
let g:indentLine_char = '¦'
" let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude = ['slim', 'haml', 'html']

call dein#add('h1mesuke/vim-alignta')
set ambiwidth=double
xnoremap <silent> A  :Alignta =>\=<CR>
xnoremap <silent> a: :Alignta  01 :<CR>
xmap <silent><expr> as mode() !=# 'v' ? ':Alignta \S\+'."\<CR>" : 'as'
xnoremap al :Alignta<Space>

call dein#add('junegunn/vim-easy-align')
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

call dein#add('t9md/vim-quickhl')
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" text object
call dein#add('kana/vim-textobj-user')
call dein#add('sgur/vim-textobj-parameter')
call dein#add('rhysd/vim-textobj-ruby')
call dein#add('kana/vim-textobj-indent')
call dein#add('osyo-manga/vim-textobj-multiblock')
call dein#add('deris/vim-textobj-enclosedsyntax')
call dein#add('osyo-manga/vim-textobj-multitextobj')
call dein#add('lucapette/vim-textobj-underscore')
call dein#add('thinca/vim-textobj-between')
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

call dein#add('elzr/vim-json')
let g:vim_json_syntax_conceal = 0

" ref
call dein#add("thinca/vim-ref")
call dein#add("yuku-t/vim-ref-ri")

"for ruby
call dein#add("vim-scripts/ruby-matchit")
call dein#add("tpope/vim-endwise")
call dein#add('AndrewRadev/switch.vim')
" call dein#add('ecomba/vim-ruby-refactoring')
nnoremap - :Switch<cr>

call dein#add('tpope/vim-rails')

""for javascript
call dein#add('jelera/vim-javascript-syntax')

call dein#add('myhere/vim-nodejs-complete')
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

call dein#add('jiangmiao/simple-javascript-indenter')
let g:SimpleJsIndenter_BriefMode = 2

"for coffee
call dein#add('kchmck/vim-coffee-script')
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee

"for golang
call dein#add('vim-jp/vim-go-extra')
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
au FileType go setlocal sw=4 ts=4 sts=4 noet

""for php
" autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

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

call dein#end()

set encoding=utf-8
filetype plugin indent on
filetype indent on
filetype on
syntax on
