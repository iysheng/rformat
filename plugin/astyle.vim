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

let g:ruff_command = 'ruff'
function! Find_ruff()
  if !executable(g:ruff_command)
    echohl Error | echomsg "command[" . g:ruff_command. "] not found"  | echohl None
    return 1
  endif
  return 0
endfunction

" let g:astyle_exist = Find_astyle()

function! AstyleDo()
  if &filetype != 'python'
    execute 'silent ! ' . g:astyle_command . ' --style=bsd %' | execute 'redraw!'
  else
    execute 'silent ! ' . g:ruff_command . ' format %' | execute 'redraw!'
"    echohl Error | echomsg "This python file use ruff format please."  | echohl None
  endif
endfunction

command! Astyle :call AstyleDo()
map <silent> <leader>f : Astyle<CR>

"
" ruff check python
"
function! RuffCheckDo()
" get current ruff command file with full path
let check_command = g:ruff_command . ' check ' . expand('%:p')
" echomsg check_command
let output = system(check_command)
" let output = system('ruff check a.py')
" echomsg output
let outputlist = split(output, '\n')
new

call append(line('$'), outputlist)
" call append(line('$'), output)

endfunction

command! RuffCheck :call RuffCheckDo()
map <silent> <leader>l : RuffCheck<CR>

" set autoread, 避免提示文件修改重新载入
set autoread
