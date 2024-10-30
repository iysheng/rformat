""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Astyle settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:astyle_command = 'astyle'

function! Find_astyle()
  if !executable(g:astyle_command)
    echohl Error | echomsg "command[" . g:astyle_command. "] not found"  | echohl None
    return 1
  endif
  return 0
endfunction

let g:astyle_exist = Find_astyle()

function! AstyleDo()
execute 'silent ! ' . g:astyle_command . ' --style=bsd %' | execute 'redraw!'
endfunction

command! Astyle :call AstyleDo()
map <silent> <leader>f : Astyle<CR>
