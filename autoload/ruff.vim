
let w:tmp_file_name = system('mktemp --suffix=.astyle /tmp/astyleXXXXXXXX')
let w:tmp_file_name = w:tmp_file_name[0:-2]

function! ruff#RuffCheckEntry()
" get current ruff command file with full path
let check_command = g:ruff_command . ' check ' . expand('%:p')
let output = system(check_command)
let outputlist = split(output, '\n')

if (bufexists(w:tmp_file_name))
  let astyle_ruff_win = bufwinnr(w:tmp_file_name)
  if (astyle_ruff_win == -1)
    execute "sbuffer " . bufnr(w:tmp_file_name)
  else
    " 切换回检测 window 并清除原先的内容
    execute astyle_ruff_win . 'wincmd w | %d'
  endif
else
  execute "new " . w:tmp_file_name  | set nobuflisted"
  execute "%d"
endif

call append(0, outputlist)
execute "w"
endfunction

function! ruff#RuffTmpCleanEntry()
  " glob 函数匹配只能使用简单的 * ? []
    let l:tempfiles = glob('/tmp/astyle????????.astyle', 0, 1)
    echo l:tempfiles
    for l:file in l:tempfiles
        echo l:file
        if filereadable(l:file)
            call delete(l:file)
        endif
    endfor
endfunction

function! ruff#RuffTmpCleanThisEntry()
  if filereadable(w:tmp_file_name)
    call delete(w:tmp_file_name)
  else
    echo w:tmp_file_name
    echo "why couldn't delete this"
  endif
endfunction

