call plug#begin('~/.vim/plugged') 

"=coc==========================================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
"==============================================================

"=tagbar=======================================================
Plug 'preservim/tagbar'
nnoremap <silent><F3> :TagbarToggle<CR>
"==============================================================

"=NERD=========================================================
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
nnoremap <silent><F2> :NERDTreeToggle<CR>
nnoremap <Leader>c<space> <plug>NERDComComment
"==============================================================

"=airline======================================================
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
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
Plug 'joshdick/onedark.vim'
"==============================================================

Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs' 

call plug#end()

let mapleader=','
nnoremap <Leader>rc :rightbelow vnew $MYVIMRC<CR>
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
set autoindent
set copyindent
set encoding=UTF-8
set autowriteall
colorscheme onedark
