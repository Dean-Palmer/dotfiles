" Plugins will be downloaded under the specified directory.
set rtp+=~/.fzf
"Map ctrl-t to command :FZF
nnoremap <C-t> :FZF<CR>
set number relativenumber
syntax on
nnoremap <C-s> :w <bar> :windo e!<CR>
set autoread
