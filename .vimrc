" ================= Plugins ========================================================================
  call plug#begin('~/.local/share/nvim/plugged')                               " start vim-plug list
  "---------------- Navigation ---------------------------------------------------------------------
  Plug 'scrooloose/nerdtree'                                                             " file menu
  Plug 'junegunn/fzf.vim'                                                        " fuzzy file finder
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'tpope/vim-surround'                                                " change surrounding text
  Plug 'jeffkreeftmeijer/vim-numbertoggle'                 " auto toggling between line number modes
  Plug 'christoomey/vim-tmux-navigator'                             " easy navigation b/w vim & tmux
  Plug 'ervandew/supertab'                                                        " tab autocomplete
  Plug 'wesQ3/vim-windowswap'                                                  " swap windows around
  "---------------- Colors -------------------------------------------------------------------------
  Plug 'morhetz/gruvbox'                                         " Retro groove color scheme for Vim
  Plug 'itchyny/lightline.vim'                                               " minimalist status bar
  Plug 'ryanoasis/vim-devicons'                                                              " icons
  "---------------- Syntax -------------------------------------------------------------------------
  Plug 'w0rp/ale'                                      " syntax checking and live RuboCop violations
  Plug 'maximbaz/lightline-ale'                                        " ALE indicator for lightline
  Plug 'godlygeek/tabular'                                                         " for indentation
  Plug 'Yggdroot/indentLine'                                                " adds indentation lines
  Plug 'sheerun/vim-polyglot'                                                       " all the syntax
  Plug 'posva/vim-vue'                                                               " vue js syntax
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }                                     " go syntax
  Plug 'alvan/vim-closetag'                                                         " tag completion
  Plug 'tpope/vim-commentary'                                                  " Easily use comments
  Plug 'derekprior/vim-trimmer'                                            " trim whitespace on save
  Plug 'noprompt/vim-yardoc'                                                         " yardoc syntax
  "---------------- Git ----------------------------------------------------------------------------
  Plug 'airblade/vim-gitgutter'                                                 " git diff in gutter
  Plug 'tpope/vim-fugitive'                                                        " vim git wrapper
  "---------------- Ruby/Rails ---------------------------------------------------------------------
  Plug 'tpope/vim-endwise'                                               " auto end addition in ruby
  Plug 'vim-ruby/vim-ruby'                                                    " ruby syntax & indent
  Plug 'janko-m/vim-test'                                                         " vim rspec runner
  Plug 't9md/vim-ruby-xmpfilter'                                            " inline ruby completion
  Plug 'tpope/vim-rails'                                                         " rails power tools
  Plug 'tpope/vim-dispatch'                                               " run rspec specs from vim
  "---------------- Misc ---------------------------------------------------------------------------
  Plug '907th/vim-auto-save'                                     " save everytime buffer is modified
  call plug#end()                                                                " end vim-plug list
" ================= Interface ======================================================================
  let mapleader=" "                                                         " change leader to space
  "---------------- Appearance ---------------------------------------------------------------------
  syntax enable                                                        " turn on syntax highlighting
  filetype plugin indent on        " filetype detection, syntax plugin detection, auto indent syntax
  match ErrorMsg '\s\+$'                                             " highlight trailing whitespace

  set number                                                                        " all the colors
  set showmode                                                   " show current mode down the bottom
  set showcmd                                                 " show incomplete cmds down the bottom
  set wildmenu                                  							" visual autocomplete for command menu
  set synmaxcol=128                          " no syntax highlighting for lines longer than 128 cols
  set laststatus=2                              																	 " show status bar
  set visualbell                                																				 " no sounds
  set gcr=a:blinkon0                                                          " disable cursor blink
  set number relativenumber                         " enable auto toggling between line number modes
  "---------------- Interaction --------------------------------------------------------------------
  set timeoutlen=1000 ttimeoutlen=0         " remove delay from escape key when entering normal mode
  set history=1000                                                  " store lots of :cmdline history
  set mouse=a                                                        " mouse scrolling in vim splits
  set lazyredraw                                                                " speed up scrolling
  set regexpengine=1
  set clipboard+=unnamedplus                                         " use system clipboard for copy

  map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>  " automate clipboard copy/paste indentation
  map <Leader>bi :!bundle install<cr>                                        " bundle install in vim
  "---------------- Wrapping -----------------------------------------------------------------------
  au FileType gitcommit set tw=72                       " auto wrap at 72 cols during commit message
  "---------------- Indentation --------------------------------------------------------------------
  set tabstop=2                                " number of visual spaces per tab when vim reads file
  set softtabstop=2                                           " number of spaces in tab when editing
  set expandtab                                                                    " tabs are spaces
  set autoindent                            " copy indent from current line when starting a new line
  set smartindent                             " intelligent indentation after parentheses-like chars
  set smarttab                                " <Tab> in front of a line inserts 'shiftwidth' blanks
  set shiftwidth=2                                                       " use 2 blanks for smarttab
  set modelines=1                                 " only use setting at bottom of page for this file

  map <Leader>i mmgg=G`m                                          " indent entire file with leader-i
  "---------------- Searching ----------------------------------------------------------------------
  set rtp+=/usr/local/opt/fzf                                            " command line fuzzy finder
  set incsearch                                                   " search as characters are entered

  nnoremap \\ :noh<return>                             " Clear highlighting on escape in normal mode
  "---------------- Colors -------------------------------------------------------------------------
  colorscheme gruvbox                                                                 " retro colors
  set background=dark                                                                    " dark mode
" ================= Utilities ======================================================================
  set noswapfile                                                      " no swapfile for a new buffer
  set nobackup                                                                    " turn off backups
  set nowritebackup                                                  " no backup files while editing

  nmap <leader>bp orequire 'pry'; binding.pry<esc>^                           " insert ruby debugger
  nmap <leader>db odebugger;<esc>^                                              " insert js debugger
" ================= Keys ===========================================================================
  set backspace=indent,eol,start                                    " allow backspace in insert mode

  nnoremap <C-J> <C-W><C-J>                                         " easy navigation between splits
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
" ================= Plugin Settings ================================================================
  "---------------- Lightline ----------------------------------------------------------------------
  let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \              [ 'filetype', 'fileencoding'] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok'
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left'
  \ }
  \}

  let g:lightline#ale#indicator_checking = "\uf110"                " indicator icons
  let g:lightline#ale#indicator_warnings = "\uf071  "              " whitespace intentional
  let g:lightline#ale#indicator_errors = "\uf05e    "              " whitespace intentional
  let g:lightline#ale#indicator_ok = "\uf00c"

  set noshowmode                                                   " mode is shown in statusline now
  "--------------- Ale -----------------------------------------------------------------------------
  let g:ale_fixers = {
  \   'go': ['gofmt'],
  \   'javascript': ['eslint', 'prettier'],
  \   'ruby': ['rubocop'],
  \   'vue': ['prettier'],
  \   'yaml': ['prettier'],
  \   'proto': ['ale#fixers#protolint#Fix'],
  \}

  let g:ale_linters = {
  \   'go': ['golint'],
  \   'javascript': ['eslint', 'prettier'],
  \   'erb': ['erb'],
  \   'ruby': ['rubocop', 'sorbet', 'brakeman', 'rails_best_practices'],
  \   'proto': ['protolint']
  \}

  let g:ale_lint_on_text_changed = 'never'

  " let g:ale_proto_protolint_config = '/path/to/config/.protolint.yaml'

  " Bind F8 to fixing problems with ALE
  nmap <Leader>\ <Plug>(ale_fix)
  "---------------- vim-gitgutter ------------------------------------------------------------------
  set updatetime=100
  "---------------- vue-language-server ------------------------------------------------------------
  let g:LanguageClient_serverCommands = { 'vue': ['vls'] }
  "---------------- NERDTree -----------------------------------------------------------------------
  nnoremap <silent> <Leader>v :NERDTreeToggle<CR>                        " Toggle NERDTree (Space-v)
  nmap <silent> <Leader>f :NERDTreeFind<CR>                          " Toggle NERDTreeFind (Space-f)

  let NERDTreeAutoDeleteBuffer = 1                              " auto delete buffer of file deleted
  let NERDTreeMinimalUI = 1                                                             " minimal ui
  let NERDTreeDirArrows = 1
  let NERDTreeShowHidden=1                                                       " Show hidden files
  let NERDTreeQuitOnOpen = 1                                     " quit NERDTree when opening a file
  let NERDTreeIgnore = ['\.DS_Store']                                           " ignore index files
  "---------------- vim-test -----------------------------------------------------------------------
  " space-r runs current spec file
  map <Leader>r :TestFile<CR>
  "space-s runs nearest spec
  map <Leader>s :TestNearest<CR>
  " space-a runs all specs
  map <Leader>a :TestSuite<CR>

  let test#strategy = "neovim"                             " execute test commands in a split window
  "---------------- fzf.vim ----------------------------------------------------------------------
  " remap fuzzy finder to ctrl-t
  nnoremap <silent> ,t :Files<CR>

  let g:ctrlp_open_multiple_files = '1jr'                 " open files extra files in hidden buffers

  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor                                          " Use ag over grep
  endif
  "---------------- vim-surround -------------------------------------------------------------------
  set filetype=eruby                                                               " define filetype

  let b:surround_{char2nr('=')} = "<%= \r %>"                       " `ctrl-s =` to insert print erb
  let b:surround_{char2nr('-')} = "<% \r %>"                              " `ctrl-s -` to insert erb
  "---------------- closetag -----------------------------------------------------------------------
  let g:closetag_filenames = "*.html.erb,*.html"                  " tag completion for erb files too
  "---------------- vim-auto-save ------------------------------------------------------------------
  let g:auto_save = 1                                               " enable AutoSave on Vim startup
  "---------------- indentLine ---------------------------------------------------------------------
  let g:indentLine_color_term = 239                                  " indentation lines more subtle
