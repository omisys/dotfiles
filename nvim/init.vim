call plug#begin('~/.vim/plugged')

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/deoplete-clangx'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0ng/vim-hybrid'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-surround'
call plug#end()

set cursorline
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set clipboard+=unnamedplus
set ignorecase
set smartcase
set background=dark
colorscheme hybrid
set scrolloff=5
set sidescrolloff=5
nnoremap <F2> :<C-u>NERDTreeToggle<CR>
