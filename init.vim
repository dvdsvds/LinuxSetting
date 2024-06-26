call plug#begin('~/.vim/plugged') 

let mapleader = " " 
let maplocalleader = " "

"=Coc==========================================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <expr> coc#pum#visible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> coc#pum#visible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <leader>a  <Plug>(coc-codeaction-selected)
"==============================================================

"=Tagbar=======================================================
Plug 'preservim/tagbar'
nnoremap <leader>w :TagbarToggle<CR>
"==============================================================

"=Nerd=========================================================
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
nnoremap <leader>e :NERDTreeToggle<CR>
"==============================================================

"=treesitter===================================================
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"==============================================================

"=Airline======================================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
"==============================================================

"=colorscheme==================================================
Plug 'nanotech/jellybeans.vim'
Plug 'tomasiser/vim-code-dark'
"==============================================================

Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs' 

call plug#end()

let mapleader = ";" 
nnoremap <leader>n :rightbelow vnew $MYVIMRC<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

map <F6> :! gcc % -o %<<CR>
map <F7> :! g++ % -o %<<CR>
map <F8> :! ./%<<CR>

set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set ai
set si
set cindent 
set copyindent
set encoding=UTF-8
set autowriteall
colorscheme jellybeans
