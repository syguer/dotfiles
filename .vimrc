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
colorscheme molokai
" set background=dark

"save undo
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

"set cusor on last saved line
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\""

syntax off
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle "tpope/vim-endwise"
NeoBundle "Townk/vim-autoclose"
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'digitaltoad/vim-jade'

NeoBundle 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

NeoBundle 'AndrewRadev/switch.vim'
nnoremap - :Switch<cr>

NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'outputter' : 'browser'
      \ }

""for php
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

NeoBundle 'scrooloose/nerdtree.git'
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']

NeoBundle "vim-scripts/taglist.vim"
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags" 
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
map <silent> <C-t> :TlistToggle<CR>  

map <silent> <F2> :SrcExpl <CR>
let g:SrcExpl_jumpKey = "<ENTER>" 
let g:SrcExpl_gobackKey = "<SPACE>"

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_at_startup = 1 
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
      "return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
      return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

NeoBundle "nathanaelkane/vim-indent-guides"
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgray ctermbg=darkgrey
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
"set ts=2 sw=2 et
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

NeoBundle 'myhere/vim-nodejs-complete'

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
    let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1

filetype plugin indent on     " required!
filetype indent on
syntax on
