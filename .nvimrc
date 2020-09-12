"-------------- Key-mapping(F2-F11 are free) ------------""
function! FormatCurrentFile()
    silent execute "!ormolu --mode inplace". " " . expand('%:p')
    :e
endfunction
au BufWrite *.hs call FormatCurrentFile()

"------------- vim-quickui settings  ------------------"
let s:update = "update | w |"

call quickui#menu#clear('P&roject')
call quickui#menu#install('P&roject', [
            \ [ '&build', s:update . 'call HTerminal(0.4, 300.0, "stack build \n")' ],
            \ [ '&run', s:update . 'call HTerminal(0.4, 300.0, "stack exec words \n")' ],
            \ [ '&clean', s:update . 'call HTerminal(0.4, 300.0, "stack clean \n")' ],
            \ [ '&test', s:update . 'call HTerminal(0.4, 300.0, "clear; stack test \n")' ],
            \ [ "--", '' ],
            \ ], 5000)
