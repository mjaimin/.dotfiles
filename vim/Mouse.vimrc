"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:MouseOn()
  set showmatch
  set t_vb=none
  set mouse=a
  set noeb vb t_vb=
endfunction

function! s:MouseOff()
  set showmatch
  set t_vb=none
  set mouse-=a
  set noeb vb t_vb=
endfunction


command! MouseOn  call <sid>MouseOn()
command! MouseOff call <sid>MouseOff()
