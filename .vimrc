:set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" --- vundle -----------------------------------------------------------------
filetype off

:set rtp+=$HOME\.vim\bundle\vundle
:call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"Bundle 'mileszs/ack.vim'
"Bundle 'Raimondi/delimitMate'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Lokaltog/vim-powerline'
Bundle 'eugeneching/consolas-powerline-vim'
Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-commentary'
"Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
"Bundle 'nvie/vim-flake8'
"Bundle 'matze/dwm.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'fidian/hexmode'
" vim-scripts repos
Bundle 'a.vim'
Bundle 'scratch.vim'
Bundle 'sqlserver.vim'
Bundle 'wikipedia.vim'
Bundle 'TFS'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!

" --- leader -----------------------------------------------------------------

let mapleader = ","

nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
map <Leader>gq :CtrlP c:\stprojects\qos<CR>
map <Leader>gt :CtrlP c:\workspaces\TCCBased\TCC\Release\RelTMM10.1.0<CR>
map <Leader>vi :tabe ~/.vimrc<CR>

" --- powerline --------------------------------------------------------------
let g:Powerline_symbols = 'fancy'

:set viminfo+=n$USERPROFILE\\Documents\\.viminfo
:set backupdir=$TEMP
:set directory=$TEMP

if has("gui")
  :map <silent> <C-O> :browse confirm e<CR>
endif

:set guioptions-=T "remove toolbar

:nmap ,t :!cd %:p:h && "c:\Program Files\ctags58\ctags.exe" *
map <F1> <Esc>
imap <F1> <Esc>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

set laststatus=2  " Always show status line.
:set wrap
:set tabstop=8
:set softtabstop=2
:set shiftwidth=2
:set expandtab
:set hlsearch
:set incsearch
:set foldmethod=syntax
:set foldlevel=99
:set foldminlines=3
:set guifont=Consolas\ for\ Powerline\ FixedD:h10
" :set guifont=Consolas:h10:cANSI 
:set ignorecase
:set grepprg=grep\ -ns
:set number
:set numberwidth=6
:set columns=86
:set lines=40
if &diff
  let &columns = 172 + 2*&foldcolumn + 1
endif
:set browsedir=buffer
" setting enc to utf-8 caused errors creating the swap file
" :set enc=utf-8
:syntax on
:set background=dark
:colorscheme solarized
:set wildmenu

" :setlocal spell spelllang=en_gb

:set tags=./tags,tags,c:\ws\MonitorMaster\core\Main\src\acticore\tags

let g:alternateExtensions_h = "inl,idh,cpp,c"
let g:alternateExtensions_hpp = "inl,idh,cpp,c"
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_inl = "idh,cpp,c"
let g:alternateExtensions_idh = "cpp,c"

" see syntax\c.vim for further options
let c_space_errors = 1

let g:sql_type_default = 'sqlserver'

filetype plugin on
set ofu=syntaxcomplete#Complete

let g:ctrlp_by_filename = 1
let g:ctrlp_max_depth = 400
let g:ctrlp_max_files = 50000
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*\\gen\\*,*\\bin\\*,*\\obj\\*,*\\thirdparty\\*,*\\testing\\*,*\\_ReSharper*\\*,*\\TestResults\\*,*\\doc\\*

set encoding=utf-8

:autocmd BufEnter * silent! lcd %:p:h

:cd c:\stprojects\qos
