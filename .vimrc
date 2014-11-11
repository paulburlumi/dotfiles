:set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" --- vundle -----------------------------------------------------------------
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif

filetype off

:set rtp+=$HOME/.vim/bundle/vundle
:call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

"Bundle 'mileszs/ack.vim'
"Bundle 'Raimondi/delimitMate'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-commentary'
"Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
"Bundle 'nvie/vim-flake8'
"Bundle 'matze/dwm.vim'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'rbgrouleff/bclose.vim'
Bundle 'fidian/hexmode'
" vim-scripts repos
Bundle 'a.vim'
Bundle 'scratch.vim'
Bundle 'sqlserver.vim'
Bundle 'wikipedia.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'

if has("win32")
Bundle 'liangfeng/consolas-font-for-airline'
Bundle 'TFS'
endif

filetype plugin indent on     " required!

" --- leader -----------------------------------------------------------------

nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
if has("win32")
map <Leader>gq :CtrlP c:\workspaces\MonitorMaster\qos\Main<CR>
map <Leader>gt :CtrlP c:\workspaces\TCCBased\TCC\Release\RelTMM10.2.0<CR>
endif
map <Leader>vi :tabe ~/.vimrc<CR>

" --- airline ----------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#fnamemod = ':t'

if has("win32")
:set backupdir=$TEMP
:set directory=$TEMP
endif

if has("gui_running")
  if has("gui_win32")
    :map <silent> <C-O> :browse confirm e<CR>
  endif
endif

:set guioptions-=T "remove toolbar

if has("win32")
:nmap ,t :!cd %:p:h && "c:\Program Files\ctags58\ctags.exe" *
endif
map <F1> <Esc>
imap <F1> <Esc>
nnoremap <silent> <C-l> :nohl<CR><C-l>
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" Switch to alternate file
:map <C-Tab> :bnext<cr>
:map <C-S-Tab> :bprevious<cr>

:set laststatus=2  " Always show status line.
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
:set backspace=indent,eol,start
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Powerline\ Consolas:h10
"    set guifont=Consolas:h10:cANSI 
  endif
endif
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

if has("win32")
:set tags=./tags,tags,c:\ws\MonitorMaster\core\Main\src\acticore\tags
endif

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
if has("win32")
set wildignore+=*\\gen\\*,*\\bin\\*,*\\obj\\*,*\\thirdparty\\*,*\\testing\\*,*\\_ReSharper*\\*,*\\TestResults\\*,*\\doc\\*
endif

set encoding=utf-8

:autocmd BufEnter * silent! lcd %:p:h

if has("win32")
:cd c:/workspaces/MonitorMaster/qos/Main
endif
