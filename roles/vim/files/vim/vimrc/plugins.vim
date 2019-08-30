" Plugin Manager
" ==============================================================================

" Install Plug and plugins if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

  " Automatically install missing plugins on startup
  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall | q
  endif


  " Appearance
  " ============================================================================

  " ONEDARK: Color scheme from Atom
  Plug 'joshdick/onedark.vim'

  " AIRLINE: Statusbar
  Plug 'vim-airline/vim-airline'
  " {{{
    " Disable whitespace warnings in the statusbar
    let g:airline#extensions#whitespace#enabled = 0
    " Show lint status in the statusbar
    let g:airline#extensions#ale#enabled = 1
    " Show buffers in a line across the top
    let g:airline#extensions#tabline#enabled = 1
    " Do not show modified line counts from git
    let g:airline#extensions#hunks#enabled = 0
    let g:airline_section_x = '' " (tagbar, filetype, virtualenv)
    let g:airline_section_z = '' " (percentage, line number, column number)
    let g:airline_section_y = '' " (fileencoding, fileformat)
  " }}}

  " INDENT LINE: Show levels of indentation
  Plug 'Yggdroot/indentLine'
  " {{{
    " Compare to nathanaelkane/vim-indent-guides
    let g:indentLine_setColor = 0           " Turn off indentLine default color
  " }}}


  " Manual Formatting
  " ============================================================================

  " UNIMPAIRED: Input new line, go to next error, etc.
  Plug 'tpope/vim-unimpaired'               "

  " COMMENTARY: Toggle comments with movements like gc2j
  Plug 'tpope/vim-commentary'

  " SURROUND: For switching quote types and other surrounding things
  Plug 'tpope/vim-surround'

  " SPLITJOIN: Transform between single/multi-line code
  Plug 'AndrewRadev/splitjoin.vim'

  " ABOLISH: Working with variants of a word
  Plug 'tpope/vim-abolish'


  " Auto Formatting
  " ============================================================================

  " BETTER WHITESPACE: Show/trim trailing whitespace
  Plug 'ntpeters/vim-better-whitespace'
  " {{{
    let g:strip_whitelines_at_eof=1
    let g:strip_whitespace_on_save = 1
  " }}}

  " ENDWISE: Add ends to blocks in ruby
  Plug 'tpope/vim-endwise'

  " AUTOPAIRS: Close quotes and backets automatically
  Plug 'jiangmiao/auto-pairs'


  " File Nav
  " ============================================================================

  " FZF: Install FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " FZF VIM: fzf-vim integration
  Plug 'junegunn/fzf.vim'
  " {{{
    " Take up less space
    let g:fzf_layout = { 'down': '~20%' }
    " Pay attention to gitignore, but include hidden files
    let $FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!.git/*"'
    let g:fzf_colors =
          \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
  " }}}


  " Git
  " ============================================================================

  " GITGUTTER: Show git status in current file
  Plug 'airblade/vim-gitgutter'
  " {{{
    let g:gitgutter_realtime = 0            " Turn off realtime updates
    let g:gitgutter_eager = 0               " Turn off buffer loading updates
    let g:gitgutter_sign_added = '•'
    let g:gitgutter_sign_modified = '•'
    let g:gitgutter_sign_removed = '•'
  " }}}
  set signcolumn=yes

  " FUGITIVE: Git integration like git grep and showing the current branch
  Plug 'tpope/vim-fugitive'

  " RHUBARB: Github integration with Fugitive
  Plug 'tpope/vim-rhubarb'


  " Syntax
  " ============================================================================

  Plug 'vim-ruby/vim-ruby'                    " Ruby syntax and indentation
  Plug 'onemanstartup/vim-slim'               " Slim syntax (forked)
  Plug 'pangloss/vim-javascript'              " Javascript highlighting
  Plug 'jparise/vim-graphql'                  " GraphQL highlighting, dependent on pangloss
  Plug 'mxw/vim-jsx'                          " JSX Highlighting, dependent on pangloss
  Plug 'elmcast/elm-vim'                      " Elm syntax and more
  " {{{
    let g:elm_setup_keybindings = 0
  " }}}

  " ALE: General purpose linter
  Plug 'w0rp/ale'
  " {{{
    let g:ale_sign_column_always = 1          " Keep the gutter open so it isn't jumping around
    let g:ale_lint_on_text_changed = 'never'  " Turn off linting while editing
    let g:ale_lint_on_save = 1                " Default: lint only when saving
    let g:ale_set_balloons = 0
    let g:ale_ruby_rubocop_executable = 'bundle'
    let g:ale_javascript_eslint_executable = 'npx eslint'
    let g:ale_javascript_eslint_options = '-c ~/workspace/style/.eslintrc'
    " let g:ale_fix_on_save = 1
    let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['eslint']}
  " }}}

  " RENAME: Rename the current file
  Plug 'danro/rename.vim'


  " Enhancements
  " ============================================================================

  " MUNDO: Visualize the undo tree
  Plug 'simnalamburt/vim-mundo'

  " GIST: Manipulate gists
  Plug 'mattn/webapi-vim'
  Plug 'mattn/gist-vim'
  " {{{
    let g:gist_post_private = 1
  " }}}

  Plug 'christoomey/vim-tmux-navigator'

  Plug 'Alok/notational-fzf-vim'
  " {{{
    let g:nv_search_paths = ['~/Dropbox/notebooks']
    let g:nv_ignore_pattern = ['*.plist', 'RecentItems.txt']
    let g:nv_create_note_key = 'ctrl-w'
    let g:nv_create_note_window = 'edit'
    let g:nv_use_short_pathnames = 1
  " }}}

  " OBSESSION: Persist session
  Plug 'tpope/vim-obsession'

  " Text Navigation
  " ============================================================================

  " SNEAK: Search with two characters
  Plug 'justinmk/vim-sneak'

  " TARGETS: More text targets, like di' which deletes everything inside quotes
  Plug 'wellle/targets.vim'

  " TEXTOBJ USER: Req for rubyblock, allows you to define your own targets
  Plug 'kana/vim-textobj-user'

  " RUBY TEXTOBJ: Select ruby blocks and manipulate them
  Plug 'nelstrom/vim-textobj-rubyblock'

  " Required for text objects, enables %
  packadd! matchit

  " Plugins
  " ============================================================================

  " REPEAT: Repeat plugin commands
  Plug 'tpope/vim-repeat'

call plug#end()
