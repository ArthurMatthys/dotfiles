" More accurate syntax highlighting? (see `:h syn-sync`)
augroup accurate_syn_highlight
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END


" Return to last cursor position when opening a file
augroup resume_cursor_position
  autocmd!
  autocmd BufReadPost * call s:resume_cursor_position()
augroup END


" Only resume last cursor position when there is no go-to-line command (something like '+23').
function s:resume_cursor_position() abort
  if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    let l:args = v:argv  " command line arguments
    for l:cur_arg in l:args
      " Check if a go-to-line command is given.
      let idx = match(l:cur_arg, '\v^\+(\d){1,}$')
      if idx != -1
        return
      endif
    endfor

    execute "normal! g`\"zvzz"
  endif
endfunction


augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END


function! s:custom_highlight() abort
  " For yank highlight
  highlight YankColor guibg=#01d2021 gui=nocombine

  " For cursor colors
  highlight Cursor cterm=bold gui=bold guibg=#00c918 guifg=black
  highlight Cursor2 guifg=red guibg=red

  " For floating windows border highlight
  highlight FloatBorder guifg=LightGreen guibg=NONE

  " highlight for matching parentheses
  highlight MatchParen cterm=bold,underline gui=bold,underline
endfunction


" highlight yanked region, see `:h lua-highlight`
augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{timeout=300, on_visual=false}
augroup END


" Quit Nvim if we have only one window, and its filetype match our pattern.
function! s:quit_current_win() abort
  let quit_filetypes = ['qf', 'vista']
  let buftype = getbufvar(bufnr(), '&filetype')
  if winnr('$') == 1 && index(quit_filetypes, buftype) != -1
    quit
  endif
endfunction


" Auto-generate packer_compiled.lua file
augroup packer_auto_compile
  autocmd!
  autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
augroup END


" Autoformat on save
augroup fmt
    autocmd!
    autocmd BufWritePre * silent! undojoin | Neoformat
augroup END
