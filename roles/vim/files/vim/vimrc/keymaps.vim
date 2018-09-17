let mapleader = ' '

" Handy ways to insert debuggers
nnoremap <leader>d odebugger;<esc>
nnoremap <leader>D Odebugger;<esc>
nnoremap <leader>p obinding.pry<esc>
nnoremap <leader>P Obinding.pry<esc>

" Clears the search highlight
nnoremap <silent> ,c :nohlsearch<CR>

" Buffers
" ==============================================================================
" I use mostly vertical splits, so the most important thing for me is to be able
" to move horizontally between splits. I mapped ctrl-j and ctrl-k to cycle
" through buffers since I'm not navigating vertically between splits.

" Buffer Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Buffer switching
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

" close buffer
nnoremap <leader>; :bd<CR>

" Launch FZF Buffers
nnoremap <silent> <leader>b :Buffers<CR>


" File Navigation
" ==============================================================================

" Ripgrep and open the drawer
nnoremap <leader>f :Find
nnoremap <leader>F :Find <C-R><C-W>

" Launch FZF
nnoremap <silent> <leader>a :FZF<CR>

" Search files that have been modified
nnoremap <silent> <leader>g :GFiles?<CR>

nnoremap <silent> <leader>t :Vexplore .<CR>
nnoremap <silent> <leader>T :Vexplore<CR>


" Vim Editing
" ==============================================================================

" Save the current file
nnoremap <leader>w :w<CR>

" Close the current file
nnoremap <leader>q :q<CR>

" Source vimrc
nnoremap <silent><leader>s :source ~/.vimrc<CR>

" Reload the current file
nnoremap <silent><leader>r :e%<CR>


" Yank/Paste
" ==============================================================================

" don't copy the contents of an overwritten selection.
vnoremap p "_dP

" <shift>y should behave the same way as <shift>d and <shift>c
nnoremap <silent> Y y$

" List contents of all registers (that typically contain pasteable text).
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
