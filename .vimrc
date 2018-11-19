" Plugins will be downloaded under the specified directory.
set rtp+=~/.fzf
"Map ctrl-t to command :FZF
nnoremap <C-t> :FZF<CR>
syntax on
nnoremap <C-l> :set norelativenumber <bar> :set nonumber<CR>
nnoremap <C-k> :set number <bar> :set relativenumber <CR>
nnoremap <C-j> :set norelativenumber <bar>:set number <CR>
nnoremap <C-s> :w <bar> :windo e!<CR>
set noautoread
map <F7> :w !xclip<CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o<CR>
set nohlsearch
