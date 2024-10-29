""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Astyle settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! Astyle()
execute 'silent ! astyle --style=bsd % &> /dev/null' | execute 'redraw!'
endfunction

map <silent> <leader>f : call Astyle()<CR>
