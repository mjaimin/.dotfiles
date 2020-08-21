function! s:ExecuteInShell(command) " {{{
    let command = join(map(split(a:command), 'expand(v:val)'))
    let winnr = bufwinnr('^' . command . '$')
    silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
    setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap nonumber
    echo 'Execute ' . command . '...'
    silent! execute 'silent %!'. command
    silent! redraw
    silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
    silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>:AnsiEsc<CR>'
    silent! execute 'nnoremap <silent> <buffer> q :q<CR>'
    silent! execute 'AnsiEsc'
    echo 'Shell command ' . command . ' executed.'
endfunction " }}}
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)
nnoremap <leader>! :Shell

" }}}

fun! Runcmd(cmd)
    silent! exe "noautocmd botright pedit ".a:cmd
    noautocmd wincmd P
    set buftype=nofile
    exe "noautocmd r! ".a:cmd
    noautocmd wincmd p
endfun
com! -nargs=1 Runcmd :call Runcmd("<args>")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Trailing spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CleanExtraSpaces() "Function to clean unwanted spaces
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


autocmd BufWritePre * :call CleanExtraSpaces()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Resize Vertical / Horizontal Splits using Mouse
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ttymouse=xterm2
function! ResizeSplit()
  set mouse=n
  set ttymouse=xterm2
endfun


fun! GotoWithCommand()
        let l:file = expand('<cfile>')

        " Replace ~ with the home directory
        let l:file = substitute(l:file, '^\~', $HOME, '')

        " File doesn't exist; return
        if !filereadable(l:file)
                echohl ErrorMsg
                echomsg "E447: Can't find file \"" . l:file . '" in path'
                echohl None
        endif

        " Save cursor postion
        let l:save_cursor = getpos(".")

        " Make sure we go to the previous word (B on the first character of the
        " filename goes to the previous word, B anywhere else goes to the start of
        " the filename)
        call search('\(\s\|^\)', 'b')

        " Try to find argument to be executed; these start with a `+'
        let l:commands = ''
        while 1
                " Go one WORD backwards
                normal! B

                " Not a +; stop the loop
                if getline('.')[col('.') - 1] != '+'
                        break
                endif

                let l:commands .= ' ' . expand('<cWORD>')
        endwhile

        " Restore cursor postion
        call setpos('.', l:save_cursor)

        " Now, open the new file...
        execute ':edit ' . l:commands . ' ' . l:file
endfun

nnoremap <Leader>gf :call GotoWithCommand()<CR>
