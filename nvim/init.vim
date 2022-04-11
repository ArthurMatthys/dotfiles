
" filetype plugin indent on

let g:config_files = [
      \ 'globals.vim',
      \ 'options.vim',
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ 'themes.vim'
      \ ]

for s:fname in g:config_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor

" " Fold method
" set foldmethod=indent   
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2

" nnoremap <C-_> :NERDTreeToggle<CR>

" set shell=fish
" incremental substitution (neovim)
" if has('nvim')
"   set inccommand=split
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                PLUGINS                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" " Airline theme
" let g:airline_theme='base16_gruvbox_dark_hard'

"augroup packer_user_config
"  autocmd!
"  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
"augroup end

" lua require('plugins')

