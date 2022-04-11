" Plugin specification and lua stuff
lua require('lua-init')


"" Use short names for common plugin manager commands to simplify typing.
"" To use these shortcuts: first activate command line with `:`, then input the
"" short alias, e.g., `pi`, then press <space>, the alias will be expanded to
"" the full command automatically.
"call utils#Cabbrev('pi', 'PackerInstall')
"call utils#Cabbrev('pud', 'PackerUpdate')
"call utils#Cabbrev('pc', 'PackerClean')
"call utils#Cabbrev('ps', 'PackerSync')

"" Trigger configuration. Do not use <tab> if you use YouCompleteMe
"let g:UltiSnipsExpandTrigger='<c-j>'

"" Do not look for SnipMate snippets
"let g:UltiSnipsEnableSnipMate = 0

"" Shortcut to jump forward and backward in tabstop positions
"let g:UltiSnipsJumpForwardTrigger='<c-j>'
"let g:UltiSnipsJumpBackwardTrigger='<c-k>'

"" Configuration for custom snippets directory, see
"" https://jdhao.github.io/2019/04/17/neovim_snippet_s1/ for details.
"let g:UltiSnipsSnippetDirectories=['UltiSnips', 'my_snippets']


"""""""""""""""""""""""""""""" vim-sandwich settings """""""""""""""""""""
" Map s to nop since s in used by vim-sandwich. Use cl instead of s.
nmap s <Nop>
omap s <Nop>


"""""""""""""""""""""""""""""" neoformat settings """""""""""""""""""""""
let g:neoformat_enabled_python = ['yapf']
let g:neoformat_cpp_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }
let g:neoformat_c_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

""""""""""""""""""""""""""vim-fugitive settings""""""""""""""""""""""""""""""
"nnoremap <silent> <leader>gs :Git<CR>
"nnoremap <silent> <leader>gw :Gwrite<CR>
"nnoremap <silent> <leader>gc :Git commit<CR>
"nnoremap <silent> <leader>gd :Gdiffsplit<CR>
"nnoremap <silent> <leader>gpl :Git pull<CR>
"" Note that to use bar literally, we need backslash it, see also `:h :bar`.
"nnoremap <silent> <leader>gpu :15split \| term git push<CR>
