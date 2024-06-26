"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CommandlineComplete.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  cmap <c-p> <Plug>CmdlineCompleteBackward
  cmap <c-n> <Plug>CmdlineCompleteForward

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=42
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
""" SnipMate settings
"=====================================================
let g:snippets_dir='~/.vim/vim-snippets/snippets'

" ----- BufferList
command! Bls call BufferList()
command! BufferList call BufferList()
"  " ----- BufferList
"
map <S-Insert> <MiddleMouse>

nnoremap gf <C-W>gf

"noremap <leader>gf :e <cfile><cr>

