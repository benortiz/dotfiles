" Appearance
" ==============================================================================

colorscheme onedark

" Invert Search and IncSearch from OneDark
" yellow        = { "gui": "#E5C07B", "cterm": "180" }
" black         = { "gui": "#282C34", "cterm": "235" }
" comment_grey  = { "gui": "#5C6370", "cterm": "59"  }

" fg black, bg yellow
highlight IncSearch guifg=#282C34 guibg=#E5C07B ctermfg=235 ctermbg=180

" fg yellow, bg comment_grey
highlight Search    guifg=#E5C07B guibg=#5C6370 ctermfg=180 ctermbg=59

" Performance boost from reducing draw calls
" especially in the terminal
set lazyredraw

" Tells vim that we're on a fast terminal, so give it more characters to render
" at once. This should improve rendering performance.
set ttyfast

" Show absolute numbering
set number
" Hide cursor hightlight line
set nocursorline

" Text Column
set textwidth=80
" Make the column line visible
set colorcolumn=+1


" File Nav
" ==============================================================================

" Autocomplete
" Use tab completion for files
set wildmode=longest:list,full
" visual autocomplete for command menu
set wildmenu

" Turn netrw into NerdTree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


" Formatting
" ==============================================================================

set autoindent

" Tab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" prevent auto-wrap based on textwidth
set formatoptions-=t


" Text Navigation
" ==============================================================================

" Search
set ignorecase
" case-sensitive if your search includes a capital letter
set smartcase
" starts searching as you type
set incsearch
" highlights search matches
set hlsearch
" ignore files from search
set wildignore=*/node_modules/*,*/tmp/*

" Backspace
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Offset the edge of the buffer from the cursor
set scrolloff=20


" Vim Application Settings
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
set directory=~/.vim/swaps//
