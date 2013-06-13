set fileencoding=utf-8
set number
set autoindent
set shiftwidth=4
set nowritebackup
set expandtab
set tabstop=4
syntax on

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite'
NeoBundle 'Shougo/neobundle'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'jiangmiao/simple-javascript-indenter'
NeoBundle 'jelera/vim-javascript-syntax'
filetype plugin on
filetype indent on
