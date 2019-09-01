set nocompatible
syntax enable

let mapleader=' '

" Source vimrc
nnoremap <silent> <leader>s :source ~/.vimrc<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

""" Send register to Clipper clipboard
""" https://github.com/wincent/clipper
nnoremap <silent> <leader>Y :call system('nc -N localhost 8377', @0)<CR>
""" Send register to local clipboard
""" ~/.local/bin/ctcopy
nnoremap <silent> <leader>y :call system('ctcopy', getreg('"'))<CR>
""" Set register from local clipboard
""" ~/.local/bin/ctpaste
nnoremap <silent> <leader>p :call setreg('"', system('ctpaste'))<CR>

highlight Comment cterm=italic
