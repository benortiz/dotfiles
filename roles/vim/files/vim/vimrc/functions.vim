" Ripgrep and open the drawer
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

function! ToggleTodo()
  let line = getline('.')
  if line =~ "\-\\s\\[\\s\\]"
    execute "silent s/\\[\\s\\]/\\[x\\]/"
  else
    if line =~ "\-\\s\\[x\\]"
      execute "silent s/\\[x\\]/\\[ \\]/"
    endif
  endif
endfunction

function! OpenLinePr()
  let l:blame_cmd = 'git blame ' . expand('%') . ' -L ' . line('.') . ',' .  line('.')
  let l:hash_cmd = l:blame_cmd . " | awk '{print $1}'"
  let l:response = system(l:hash_cmd)
  if v:shell_error == 0
    let l:repo_url = system('hub browse -u | cut -d/ -f1-5 | tr -d "\n"')
    let l:pr_search_url = l:repo_url . "/pulls\\?q=" . l:response
    let l:command = 'silent !open ' . l:pr_search_url . " | :redraw!"
    execute l:command
  else
    echoerr l:response
  endif
endfunction
