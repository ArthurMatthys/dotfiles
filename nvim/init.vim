"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              NVIM SETUP                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Activate indentation
set smartindent

" Non-expanded, 4-wide tabulations
set tabstop=4
set shiftwidth=4

" Convert tab to space
set expandtab

"Disable vi-compatibility
set nocompatible

"Real-world encoding
set encoding=utf-8

"Interpret modelines in files
set modelines=1

"Do not abandon buffers
set hidden

"Don't bother throttling tty
set ttyfast

"More useful backspace behavior
set backspace=indent,eol,start

" highlight the matching character
set showmatch

" Better search
set ignorecase

" Smartcase is:
" if only lowercase = case insensitive
" if with uppercase = case sensitive
set smartcase

" Search as you type
set incsearch

" highlight search match
set hlsearch

" Use statusbar on all windows
set laststatus=2

" Vplit on right of current buffer
set splitright

" Vplit below current buffer
set splitbelow

" Turn hybrid line numbers on
set number relativenumber

" Fuzzy finder with find command
set path+=**

" Diplay all matching files when we hit tab
set wildmenu

" Exclude filetype from wildmenu
set wildignore+=.git\*,*.pyc,*.pyo,*.so,*.o,*.dll,*.lib,*.pyd,*.d

" Activate syntax color
syntax on

" Disable error bell sound
set noerrorbells

set termguicolors

" Color 81th charactere on a line
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Fold method
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

nnoremap <C-_> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                PLUGINS                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gruvbox theme
set background=dark " or light if you want light mode
colorscheme gruvbox8_hard

" Airline theme
let g:airline_theme='base16_gruvbox_dark_hard'

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

lua require('plugins')

augroup fmt
  autocmd!
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END
