let mapleader = ' '

" Save the current file
nnoremap <leader>w :w<CR>

" Close the current file
nnoremap <leader>q :q<CR>

" Buffer Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer switching
nnoremap ˙ :bp<CR>
nnoremap ¬ :bn<CR>
nnoremap <leader>; :bd<CR> " delete buffer

" don't copy the contents of an overwritten selection.
vnoremap p "_dP

" <shift>y should behave the same way as <shift>d and <shift>c
nnoremap <silent> Y y$

nnoremap <silent> <leader>t :Vexplore .<CR>
nnoremap <silent> <leader>T :Vexplore<CR>

" Launch FZF
nnoremap <silent> <leader>a :FZF<CR>

" Launch FZF Buffers
nnoremap <silent> <leader>b :Buffers<CR>

" Search files that have been modified
nnoremap <silent> <leader>g :GFiles?<CR>

" Search all files with Ag
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>

" Git Grep and open drawer
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <leader>f :Find
nnoremap <leader>F :Find <C-R><C-W>

" command! -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!
" nnoremap <leader>f :Ggr
" nnoremap <leader>F :Ggr "<C-R><C-W>"

" Source vimrc
nnoremap <silent><leader>s :source ~/.vimrc<CR>

" Reload the current file
nnoremap <silent><leader>r :e%<CR>

" Handy ways to insert debuggers
nnoremap <leader>d odebugger;<esc>
nnoremap <leader>D Odebugger;<esc>
nnoremap <leader>p obinding.pry<esc>
nnoremap <leader>P Obinding.pry<esc>
