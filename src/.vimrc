set nocompatible
syntax enable

let mapleader=' '

" Source vimrc
nnoremap <silent> <leader>s :source ~/.vimrc<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap gb :ls<CR>:b<Space>

""" Send register to Clipper clipboard
""" https://github.com/wincent/clipper
nnoremap <silent> <leader>Y :call system('nc -N localhost 8377', @0)<CR>
""" Send register to local clipboard
""" ~/.local/bin/ctcopy
nnoremap <silent> <leader>y :call system('ctcopy', getreg('"'))<CR>
""" Set register from local clipboard
""" ~/.local/bin/ctpaste
nnoremap <silent> <leader>p :call setreg('"', system('ctpaste'))<CR>


""" Formatting
""" ============================================================================

set autoindent

" Tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" prevent auto-wrap based on textwidth
set formatoptions-=t

" Text Column
set textwidth=80
" Make the column line visible
set colorcolumn=+1

highlight Comment cterm=italic

" Vim Application Settings
"
" ==============================================================================

" reload files when changed on disk, i.e. via `git checkout`
set autoread

" Undo File
if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Swap File
" keep swaps outside of git and other dirs
if isdirectory($HOME . '/.vim/swaps') == 0
  :silent !mkdir -p ~/.vim/swaps > /dev/null 2>&1
endif
set directory=~/.vim/swaps//


""" Plugin Manager
""" ============================================================================

""" Install Plug and plugins if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

  """ Appearance
  """ ==========================================================================

  " Dracula: It's a color scheme?
  Plug 'dracula/vim', { 'as': 'dracula' }

  " COMMENTARY: Toggle comments with movements like gc2j
  Plug 'tpope/vim-commentary'

  Plug 'christoomey/vim-tmux-navigator'
 
  """ Automatically install missing plugins on startup
  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall
  endif

call plug#end()

let g:dracula_colorterm = 0
colorscheme dracula
