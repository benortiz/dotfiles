" Appearance
" ==============================================================================

" Show hybrid numbering
set number relativenumber
" Highlight line with cursor
set cursorline
" Please no balloon
set noballooneval

" Only show the cursorline on the active buffer
augroup ActiveCursorLine
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

" Run RVM automatically to set the correct Ruby context in MacVim
autocmd DirChanged * Rvm
