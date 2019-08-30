let mapleader = ' '

nnoremap <silent> gt :call ToggleTodo()<CR>
nnoremap <silent> gT o- [ ]<Space>
inoremap <C-t> - [ ]<Space>

" Clears the search highlight
nnoremap <silent> ,c :nohlsearch<CR>

nnoremap g4 $
nnoremap g5 %
nnoremap g6 ^

nnoremap <silent> g8 :norm! *N<CR>
nnoremap n nzz
nnoremap N Nzz

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap gb :ls<CR>:b<Space>

vnoremap <C-g> "*y
vnoremap 4 $ "

" Open a PR for the current line
" https://github.com/benwainwright/dotfiles/blob/4cd643437180f72e1edcb566a3b5b3d9565e0fac/config/vim/vimrc.dotfile#L119-L133
nnoremap <Leader>pr :call OpenLinePr()<cr>

" Go to next linting error
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>

" Buffers
" ==============================================================================
" I use mostly vertical splits, so the most important thing for me is to be able
" to move horizontally between splits. I mapped ctrl-j and ctrl-k to cycle
" through buffers since I'm not navigating vertically between splits.

" Buffer switching
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" close buffer
nnoremap <leader>; :bd<CR>

" Launch FZF Buffers
nnoremap <silent> <leader>b :Buffers<CR>


" File Navigation
" ==============================================================================

" Ripgrep and open the drawer
nnoremap <leader>f :Find<space>
nnoremap <leader>F :Find <C-R><C-W>

" Launch FZF
nnoremap <silent> <leader>a :Files<CR>

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
