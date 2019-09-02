set nocompatible
syntax enable

let mapleader=' '

set autoread 					" reload files when changed on disk
set lazyredraw        " only draw to the screen when necessary
set ttyfast           " send more characters to the screen at once

set autoindent
set paste 						" respect indentation of pastes
set hidden            " change buffer without saving

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set scrolloff=20

set textwidth=80
set colorcolumn=+1
set signcolumn=yes
set formatoptions-=t 	" prevent auto-wrap based on textwidth

set wildmenu
set wildmode=longest:full

" Search with smart case immediately
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildignore=*/node_modules/*,*/tmp/*

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

" Install Plug and plugins if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'                 " Git status in the signcolumn
Plug 'christoomey/vim-tmux-navigator'					" Seamless tmux/vim movement
Plug 'dracula/vim', { 'as': 'dracula' }				" Colorscheme
Plug 'duggiefresh/vim-easydir'                " Create dir when saving new file
Plug 'glts/vim-textobj-comment'               " Define comment targets
Plug 'kana/vim-textobj-user'                  " Dependency of rubyblock
Plug 'mattn/webapi-vim'                       " Dependency of gist-vim
Plug 'mattn/gist-vim'                         " Manage gists
Plug 'mbbill/undotree'                        " Undo history visualizer
Plug 'nelstrom/vim-textobj-rubyblock'         " Define ruby targets
Plug 'tommcdo/vim-lion'                       " Align around a character
Plug 'tpope/vim-commentary'										" Comment movements
Plug 'tpope/vim-eunuch'                       " Helpful unix cli helpers
Plug 'tpope/vim-fugitive'                     " Git integration
Plug 'tpope/vim-obsession'                    " Auto-persist vim sessions
Plug 'tpope/vim-repeat'                       " Plugins are repeatable with .
Plug 'tpope/vim-rhubarb'                      " GitHub integration
Plug 'tpope/vim-surround'                     " Movements based on pairs
Plug 'tpope/vim-unimpaired'                   " New line, url decoding, etc.
Plug 'w0rp/ale'                               " Linter/fixer
Plug 'wellle/targets.vim'                     " More surround targets

" Syntax highlighting
Plug 'vim-ruby/vim-ruby'
Plug 'onemanstartup/vim-slim'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'                    " Dependent on pangloss
Plug 'mxw/vim-jsx'                            " Dependent on pangloss

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
	autocmd VimEnter * PlugInstall
endif
call plug#end()

let g:dracula_colorterm = 0 " Prevents the background from getting dark in tmux
colorscheme dracula

" Sets Dracula comments to italic
highlight Comment term=bold cterm=italic ctermfg=4 guifg=Blue

nnoremap <silent> <leader>s :source ~/.vimrc<CR>
nnoremap <silent> <leader>r :e %<CR>
nnoremap <silent> ,c :nohlsearch<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> <leader>; :bd<CR>
nnoremap gb :ls<CR>:b<Space>

nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>

nnoremap <silent> <leader>t :Vexplore .<CR>

" Send register to Clipper clipboard
" https://github.com/wincent/clipper
nnoremap <silent> <leader>Y :call system('nc -N localhost 8377', @0)<CR>
" Send register to local clipboard
" ~/.local/bin/ctcopy
nnoremap <silent> <leader>y :call system('ctcopy', getreg('"'))<CR>
" Set register from local clipboard
" ~/.local/bin/ctpaste
nnoremap <silent> <leader>p :call setreg('"', system('ctpaste'))<CR>

let g:gitgutter_realtime = 0            " Turn off realtime updates
let g:gitgutter_eager = 0               " Turn off buffer loading updates
let g:gitgutter_sign_added = '•'
let g:gitgutter_sign_modified = '•'
let g:gitgutter_sign_removed = '•'

let g:ale_lint_on_text_changed = 'never'  " Turn off linting while editing
let g:ale_lint_on_save = 1                " Default: lint only when saving
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_javascript_eslint_executable = 'npx eslint'
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'ruby': ['rubocop'],
\ 'javascript': ['eslint']
\}
let g:ale_fix_on_save = 1
let g:ale_fix_on_save_ignore = {
\ 'ruby': ['rubocop'],
\ 'javascript': ['eslint']
\}

let g:gist_post_private = 1

" Turn netrw into NerdTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

filetype indent plugin on
