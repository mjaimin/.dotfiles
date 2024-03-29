set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'Vundlevim/Vundle.vim'

" Tagbar on the side for quick navigation of source code
Plugin 'majutsushi/tagbar'

Plugin 'mileszs/ack.vim'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'hari-rangarajan/cctree'

"Plugin 'valloric/youcompleteme'

Plugin 'rking/ag.vim'

Plugin 'joeytwiddle/sexy_scroller.vim'

Plugin 'mru.vim'

Plugin 'junegunn/gv.vim'


Plugin 'vim-scripts/taglist.vim'

Plugin 'exvim/ex-tagbar'

Plugin 'jlanzarotta/bufexplorer'


" Fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" git plugin
Plugin 'tpope/vim-fugitive'

Plugin 'airblade/vim-gitgutter'

" Better defaults
Plugin 'tpope/vim-sensible'

" track white spaces
Plugin 'ntpeters/vim-better-whitespace'

" syntax checking (lint)
"Plugin 'scrooloose/syntastic' " Error

Plugin 'godlygeek/tabular'

Plugin 'morhetz/gruvbox'

Plugin 'rafi/awesome-vim-colorschemes'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'countravioli/prettyxml.vim'

Plugin 'vim-scripts/bufferlist.vim'

Plugin 'j5shi/CommandlineComplete.vim'

"Plugin 'severin-lemaignan/vim-minimap' "This plugin does not work

"Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
Plugin 'ervandew/supertab'

Plugin 'AndrewRadev/quickpeek.vim'

Plugin 'tpope/vim-speeddating'

Plugin 'tpope/vim-repeat'

Plugin 'mbbill/undotree'

Plugin 'BurntSushi/ripgrep'

Plugin 'skywind3000/vim-preview'

Plugin 'junegunn/limelight.vim'

Plugin 'nelstrom/vim-visual-star-search'

Plugin 'bogado/file-line'

"-------------------=== Other ===-------------------------------
Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
Plugin 'fisadev/FixedTaskList.vim'          " Pending tasks list
Plugin 'rosenfeld/conque-term'              " Consoles as buffers
Plugin 'tpope/vim-surround'                 " Parentheses, brackets, quotes, XML tags, and more
Plugin 'flazz/vim-colorschemes'             " Colorschemes


Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'ryanoasis/vim-devicons'


Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

Plugin 'kshenoy/vim-signature'

Plugin 'frazrepo/vim-rainbow'

Plugin 'pboettch/vim-highlight-cursor-words'

" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

"------------------------ColorSchemes-----------------------
Plugin 'jacoborus/tender.vim'

call vundle#end()
filetype plugin indent on
