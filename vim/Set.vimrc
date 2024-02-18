set sw=4
set guitablabel=%t
set ls=2
set clipboard+=autoselect
set clipboard=unnamed                       " use system clipboard
set clipboard=unnamedplus
set guioptions+=a
"set diffexpr=MyDiff()
set makeprg=g++\ % " use make | copen

set undodir=~/.vim/undodir
set undofile
set notermguicolors
"set relativenumber

set guicursor=
set noerrorbells

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set encoding=utf-8

"Going over all of this would take too much time
"This basically set everything in utf-8 in every circumtances

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Convert to UNIX fileformat (avoid CRLF)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set fileformat=unix
"Set every files as Unix (LF) as Windows might set CRLF wich is not working
"for unix

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Ignore 'useless' extensions for wildmenu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif



" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256  " set 256 colors


" Always show statusline
set laststatus=2
set cursorline

" ================ Indentation ======================
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set smartindent

" 1 tab == 4 spaces
set softtabstop=4

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showmatch
set t_vb=none
set mouse-=a
set noeb vb t_vb=

"set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Convert text to UTF-8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

scriptencoding utf-8
setglobal termencoding=utf-8 fileencodings=utf-8


" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden
" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" Display tabs and trailing spaces visually
set listchars=nbsp:¬,eol:$,tab:>-,extends:»,precedes:«,trail:•

"set nowrap       "Don't wrap lines
"set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"
" ================ Scrolling ========================

set scrolloff=10                            " let 10 lines before/after cursor during scroll
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" Turn off vi compatibility
set nocompatible

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...
set ttyfast                                 " terminal acceleration

"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen

set showbreak=⤿
