"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              NVIM SETUP                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Activate syntax color
syntax on

" Disable error bell sound
set noerrorbells

" Activate smart indentation
set smartindent
set autoindent

" Blancks instead of tabulations
set expandtab
set smarttab
set tabstop=4
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4

" Always having a given number of line on both sides of the cursor
set scrolloff=5

" Always have windows status bar
set laststatus=2

set title

"Real-world encoding
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"More useful backspace behavior
set backspace=indent,eol,start

" Diplay all matching files when we hit tab
set wildmenu

" Search as you type
set incsearch

" highlight search match
set hlsearch

" Show commands
set showcmd


" Highlight the whole line
set cursorline

" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" " Ignore certain files and folders when globing
set wildignore+=.git\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd,*.d,*/node_modules/*
" set wildignorecase  " ignore file and dir name cases in cmd-completion


set number relativenumber  " Show line number and relative line number

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" " List all matches and complete till longest common string
" " set wildmode=list:longest

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Persistent undo even after you close a file and re-open it
set undofile

set virtualedit=block  " Virtual edit is useful for visual block edit

" set showmatch

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
set tildeop

" Fuzzy finder with find command
set path+=**

" " Enable true color support. Do not set this option if your terminal does not
" " support true colors! For a comprehensive list of terminals supporting true
" " colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
" set termguicolors

" diff options
set diffopt=
set diffopt+=vertical  " show diff in vertical position
set diffopt+=filler  " show filler for deleted lines
set diffopt+=closeoff  " turn off diff when one file window is closed
set diffopt+=context:3  " context for diff
set diffopt+=internal,indent-heuristic,algorithm:histogram
