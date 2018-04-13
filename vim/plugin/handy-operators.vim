" Ag {{{
noremap  <Leader>a :set operatorfunc=<SID>AgOperator<CR>g@
vnoremap <Leader>a :<C-u>call <SID>AgOperator(visualmode())<CR>

function! s:AgOperator(type)
    let word = <SID>GetWord(a:type)
    if word == ''
        return
    endif

    silent set hlsearch
    let @/= '\C' . word

    silent execute "Ag " . shellescape(word)
    redraw
endfunction
" }}}

" Spell lang cycle {{{
noremap <Leader>S :set spell!<CR>
noremap <silent><F11> :call CycleLang(1)<CR>
noremap <silent><F10> :call CycleLang(-1)<CR>
inoremap <silent><F11> <C-o>:call CycleLang(1)<CR>
inoremap <silent><F10> <C-o>:call CycleLang(-1)<CR>

fun! CycleLang(inc)
    let langs = ['en_us', 'pt_br']
    let i = index(langs, &spl)
    let &spl = langs[(i+a:inc)%len(langs)]

    set spell
    echo 'Using ' . &spl . ' as spellcheck language'
endfun
" }}}

" Common functions {{{
function! s:GetWord(type)
    let old_clipboard = @@

    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    let ret = @@
    let @@ = old_clipboard

    return ret
endfunction
" }}}
