" Plugins will be downloaded under the specified directory.
set rtp+=~/.fzf
"Map ctrl-t to command :FZF
nnoremap <C-t> :FZF<CR>
syntax on
nnoremap <C-c> :set norelativenumber <bar> :set nonumber<CR>
nnoremap <C-k> :set number <bar> :set relativenumber <CR>
nnoremap <C-j> :set norelativenumber <bar>:set number <CR>
nnoremap <C-s> :w <bar> :windo e!<CR>
nnoremap <C-u> :set tw=10000 <CR>
nnoremap <C-n> :bn <CR>
nnoremap <C-p> :bp <CR>
nnoremap <C-l> :ls <CR>
set noautoread
map <F7> :w !xclip<CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o<CR>
set nohlsearch
set laststatus=2
set noshowmode
set tw=10000
hi clear SpellBad 
set spell
highlight SpellBad cterm=underline

"tell vim to store .viminfo* files not in my home dir
set viminfo+=n~/.vim/viminfo/viminfo

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

"Add syntax hightlight for i3 config
Plug 'mboughaba/i3config.vim'
call plug#end()

" gpg 
" Transparent editing of gpg encrypted files.
augroup encrypted
au!
" First make sure nothing is written to ~/.viminfo while editing
" an encrypted file.
autocmd BufReadPre,FileReadPre      *.gpg set viminfo=
" We don't want a swap file, as it writes unencrypted data to disk
autocmd BufReadPre,FileReadPre      *.gpg set noswapfile
" Switch to binary mode to read the encrypted file
autocmd BufReadPre,FileReadPre      *.gpg set bin
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPre,FileReadPre      *.gpg let shsave=&sh
autocmd BufReadPre,FileReadPre      *.gpg let &sh='sh'
autocmd BufReadPre,FileReadPre      *.gpg let ch_save = &ch|set ch=2
autocmd BufReadPost,FileReadPost    *.gpg '[,']!gpg --decrypt --default-recipient-self 2> /dev/null
autocmd BufReadPost,FileReadPost    *.gpg let &sh=shsave
" Switch to normal mode for editing
autocmd BufReadPost,FileReadPost    *.gpg set nobin
autocmd BufReadPost,FileReadPost    *.gpg let &ch = ch_save|unlet ch_save
autocmd BufReadPost,FileReadPost    *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
" Convert all text to encrypted text before writing
autocmd BufWritePre,FileWritePre    *.gpg set bin
autocmd BufWritePre,FileWritePre    *.gpg let shsave=&sh
autocmd BufWritePre,FileWritePre    *.gpg let &sh='sh'
autocmd BufWritePre,FileWritePre    *.gpg '[,']!gpg --encrypt --default-recipient-self 2>/dev/null
autocmd BufWritePre,FileWritePre    *.gpg let &sh=shsave
" Undo the encryption so we are back in the normal text, directly
" after the file has been written.
autocmd BufWritePost,FileWritePost  *.gpg silent u
autocmd BufWritePost,FileWritePost  *.gpg set nobin
augroup END
