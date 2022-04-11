" Save key strokes (now we do not need to press shift to enter command mode).
" Vim-sneak has also mapped `;`, so using the below mapping will break the map
" used by vim-sneak
nnoremap ; :
xnoremap ; :

" Quicker way to open command window
nnoremap q; q:

" Insert a blank line below or above current line (do not move the cursor),
" see https://stackoverflow.com/a/16136133/6064933
" nnoremap <expr> <Space>o printf('m`%so<ESC>``', v:count1)
" nnoremap <expr> <Space>O printf('m`%sO<ESC>``', v:count1)

" Do not include white space characters when using $ in visual mode,
" see https://vi.stackexchange.com/q/12607/15292
xnoremap $ g_

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Continuous visual shifting (does not exit Visual mode), `gv` means
" to reselect previous visual area, see https://superuser.com/q/310417/736190
xnoremap < <gv
xnoremap > >gv


" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
xnoremap c "_c

" Move current line up and down
nnoremap <silent> <A-k> <Cmd>call utils#SwitchLine(line('.'), 'up')<CR>
nnoremap <silent> <A-j> <Cmd>call utils#SwitchLine(line('.'), 'down')<CR>

" Move current visual-line selection up and down
xnoremap <silent> <A-k> :<C-U>call utils#MoveSelection('up')<CR>
xnoremap <silent> <A-j> :<C-U>call utils#MoveSelection('down')<CR>

" Keep cursor position after yanking
nnoremap y myy
xnoremap y myy

augroup restore_after_yank
  autocmd!
  autocmd TextYankPost *  call s:restore_cursor()
augroup END

function! s:restore_cursor() abort
  silent! normal `y
  silent! delmarks y
endfunction

nnoremap <silent> <leader>h :HopWord<CR>
nnoremap <silent> <leader>t :Telescope<CR>

" Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
" nnoremap <expr> <leader>v printf('`[%s`]', getregtype()[0])

" Paste non-linewise text above or below current cursor,
" see https://stackoverflow.com/a/1346777/6064933
" nnoremap <leader>p m`o<ESC>p``
" nnoremap <leader>P m`O<ESC>p``

" Shortcut for faster save and quit
nnoremap <silent> <leader>w :<C-U>update<CR>

" Saves the file if modified and quit
nnoremap <silent> <leader>q :<C-U>x<CR>
" Quit all opened buffers
nnoremap <silent> <leader>Q :<C-U>qa!<CR>

nnoremap <silent> <leader>0 :NERDTreeToggle<CR>
