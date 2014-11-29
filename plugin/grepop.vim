" Add the following lines to your vimrc with whatever mappings you like
" nnoremap <leader>g :set operatorfunc=GrepOperator<CR>g@
" vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
function! GrepOperator(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
endfunction
