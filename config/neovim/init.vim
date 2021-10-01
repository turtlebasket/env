" Win behavior
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Window height
" set lines=32 columns=110

" Preferences
set encoding=utf-8
set autochdir
set shiftwidth=4
set tabstop=4
set linebreak
set breakindent
set autoindent
set wrap
set nobinary
set relativenumber
syntax on

" Aliases
cnoreabbrev ge browse confirm e
cnoreabbrev ! aliasrun

" Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'tomlion/vim-solidity'
Plug 'zah/nim.vim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'NLKNguyen/papercolortheme'
call plug#end()

" Theming
set t_Co=256
set background=dark
colorscheme	PaperColor
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Navigation & Shortcuts
" inoremap <C-c> "+y
" inoremap <C-v> <C-o>:"+p<CR>

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt-
