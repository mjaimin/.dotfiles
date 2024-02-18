nmap <F5> : call MyNumberSystem()<CR>
nmap <F6> :set hlsearch!<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>

let F2PressCounter = 1
function! MyNumberSystem()
    echo g:F2PressCounter
    if g:F2PressCounter == 1
        set relativenumber
    endif

    if g:F2PressCounter == 2
        set norelativenumber
        set nonu
    endif

    if g:F2PressCounter == 3
        set nu
    endif

    let g:F2PressCounter += 1

    if g:F2PressCounter == 4
        let g:F2PressCounter = 1
    endif
endfunction
