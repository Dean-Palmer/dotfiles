" Plugins will be downloaded under the specified directory.
set rtp+=~/.fzf
"Map ctrl-t to command :FZF
nnoremap <C-t> :FZF<CR>
syntax on
nnoremap <C-l> :set norelativenumber <bar> :set nonumber<CR>
nnoremap <C-k> :set number <bar> :set relativenumber <CR>
nnoremap <C-j> :set norelativenumber <bar>:set number <CR>
nnoremap <C-s> :w <bar> :windo e!<CR>
nnoremap <C-u> :set tw=10000 <CR>
set noautoread
map <F7> :w !xclip<CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o<CR>
set nohlsearch
set laststatus=2
set noshowmode
set tw=10000
"sets lightline's theme
let g:lightline = {
	\ 'colorscheme': 'jellybeans',
	\ }

"list of and installs plugins, use :PlugInstall to install the plugin
call plug#begin('~/.vim/plugged')
"Finds the file type and using the hotkeys will use the correct comment to comment code
Plug 'tpope/vim-commentary'
"Displays a nice status line
Plug 'itchyny/lightline.vim/'
"orgmode is based on a emac settings used for note taking and todo lists.
Plug 'jceb/vim-orgmode'
"Adds dates orgmode depends on it
Plug 'tpope/vim-speeddating'
"Provieds tags for the current file. orgmode extra
Plug 'majutsushi/tagbar'

Plug 'chrisbra/NrrwRgn'
Plug 'tpope/vim-pathogen'
Plug 'mattn/calendar-vim'
Plug 'inkarkat/vim-SyntaxRange'

"Add syntax hightlight fro i3 config
Plug 'mboughaba/i3config.vim'
call plug#end()
