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
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                  " syntax highlighting
  Plug 'williamboman/mason.nvim'                                                  " nvim pkg manager
  Plug 'williamboman/mason-lspconfig.nvim'                 " closes gaps between mason and lspconfig
  Plug 'neovim/nvim-lspconfig'                                                    " language servers
  Plug 'keith/rspec.vim'                                                              " rspec syntax
  Plug 'godlygeek/tabular'                                                         " for indentation
  Plug 'Yggdroot/indentLine'                                                " adds indentation lines
  Plug 'alvan/vim-closetag'                                                         " tag completion
  Plug 'tpope/vim-commentary'                                                  " Easily use comments
  Plug 'derekprior/vim-trimmer'                                            " trim whitespace on save
  Plug 'noprompt/vim-yardoc'                                                         " yardoc syntax
  Plug 'yoheimuta/vim-protolint'                                                 " linter for protos
  "---------------- Git ----------------------------------------------------------------------------
  Plug 'airblade/vim-gitgutter'                                                 " git diff in gutter
  Plug 'tpope/vim-fugitive'                                                        " vim git wrapper
  "---------------- Ruby/Rails ---------------------------------------------------------------------
  Plug 'tpope/vim-endwise'                                               " auto end addition in ruby
  Plug 'vim-ruby/vim-ruby'                                                    " ruby syntax & indent
  "---------------- Misc ---------------------------------------------------------------------------
  Plug '907th/vim-auto-save'                                     " save everytime buffer is modified
  Plug 'vim-test/vim-test'                                          " wrapper for running test suite
  call plug#end()                                                                " end vim-plug list
" ================= Interface ======================================================================
  let mapleader=" "                                                         " change leader to space
  "---------------- Appearance ---------------------------------------------------------------------
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

  autocmd BufNewFile,BufRead *_foo.rb set syntax=rspec                                " rspec syntax
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
  "---------------- nvim-treesitter / nvim-lspconfig / mason.nvim / mason-lspconfig  ---------------
lua << EOF
  require("mason").setup()
  mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup({
    ensure_installed = {
      "buf-language-server",
      "buf",
      "dockerls",
      "gopls",
      "marksman",
      "rubocop",
      "solargraph",
      "vim-language-server",
    }
  })

  require'nvim-treesitter.configs'.setup {
    -- A list of parser names
    ensure_installed = {
      "ruby",
      "go",
      "gomod",
      "proto",
      "markdown",
      "gitignore",
      "dockerfile",
      "vim",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
EOF

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
  "---------------- netrw --------------------------------------------------------------------------
  let g:netrw_dirhistmax = 0                                                  " disable history file
