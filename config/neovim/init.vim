" Win behavior
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Window height
" set lines=32 columns=110

" Preferences
set mouse=a
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

" Map leader key to spacebar (like Doom Emacs)
let mapleader = " "

" Vim Plug Plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'mangeshrex/everblush.vim'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'

Plug 'dhruvasagar/vim-table-mode'
call plug#end()

" Lua Plugins
" lua require('plugins')

" Theming
set termguicolors
set t_Co=256
set background=dark
colorscheme everblush
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Neovide theming
if exists("g:neovide")
	set guifont=CaskaydiaCove\ Nerd\ Font:h12.5
endif

" Navigation & Shortcuts

" Open file tree
nnoremap <Leader>op :CHADopen<CR>
nnoremap <C-t> :CHADopen<CR>
" Toggle terminal buffer
nnoremap <Leader>ot :ToggleTerm<CR>
nnoremap <C-`> :ToggleTerm<CR>
tnoremap <C-`> <C-\><C-n>:ToggleTerm<CR>
" Force kill current buffer
nnoremap <Leader>bk :bp<bar>sp<bar>bn<bar>bd!<CR>
nnoremap <C-k> :bp<bar>sp<bar>bn<bar>bd!<CR>
" Close the current window
nnoremap <Leader>wd :close<CR>
nnoremap <Leader>wk :close<CR>
nnoremap <C-x> :close<CR>
nnoremap <C-w>d :close<CR>
" Close the current tab
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>tk :tabclose<CR>
" map <Leader>bk :bd!<CR>

" Reload config
nnoremap <silent> <Leader>rr :source $MYVIMRC<cr>

" New buffer
nnoremap <Leader>bn :enew<CR>
nnoremap <Leader>bc :enew<CR>
nnoremap <C-b>n :enew<CR>

" Global file search 
" nnoremap <silent> <Leader><Leader> 

" Quit editor
nnoremap <silent> <Leader>qq :qa!<CR>

" Buffer switching
nnoremap <Leader>b1 :buffer 1<CR>
nnoremap <Leader>b2 :buffer 2<CR>
nnoremap <Leader>b3 :buffer 3<CR>
nnoremap <Leader>b4 :buffer 4<CR>
nnoremap <Leader>b5 :buffer 5<CR>
nnoremap <Leader>b6 :buffer 6<CR>
nnoremap <Leader>b7 :buffer 7<CR>
nnoremap <Leader>b8 :buffer 8<CR>
nnoremap <Leader>b9 :buffer 9<CR>
nnoremap <A-1> :buffer 1<CR>
nnoremap <A-2> :buffer 2<CR>
nnoremap <A-3> :buffer 3<CR>
nnoremap <A-4> :buffer 4<CR>
nnoremap <A-5> :buffer 5<CR>
nnoremap <A-6> :buffer 6<CR>
nnoremap <A-7> :buffer 7<CR>
nnoremap <A-8> :buffer 8<CR>
nnoremap <A-9> :buffer 9<CR>

nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

" Tab switching
nnoremap <Leader>t1 1gt<CR>
nnoremap <Leader>t2 2gt<CR>
nnoremap <Leader>t3 3gt<CR>
nnoremap <Leader>t4 4gt<CR>
nnoremap <Leader>t5 5gt<CR>
nnoremap <Leader>t6 6gt<CR>
nnoremap <Leader>t7 7gt<CR>
nnoremap <Leader>t8 8gt<CR>
nnoremap <Leader>t9 9gt<CR>

nnoremap <C-S-l> :tabnext<CR>
nnoremap <C-S-h> :tabprev<CR>

" Configure coc.nvim
" let g:coc_node_path = trim(system('which node'))
let g:coc_node_path='/opt/homebrew/bin/node'

" Telescope.nvim options
" :Telescope |<tab>
" :Telescope find_files

" Pandoc file commands
" function! PandocCompileMd()
" 	nnoremap <Leader>pp !pandoc compile <CR>
" endfunction

