call plug#begin('~/.vim/plugged')
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'shougo/deoplete-clangx'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'mfukar/robotframework-vim'
Plug 'godlygeek/tabular'
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set cursorline
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set mouse=a
set expandtab
syntax on
set clipboard+=unnamedplus
set ignorecase
set smartcase
colorscheme hybrid
set background=dark
set scrolloff=10
set sidescrolloff=5

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <F10> :<C-u>Buffers<CR>
nnoremap <F12> :<C-u>Rg <C-R><C-W><CR>
nnoremap <Esc> :<C-u>nohlsearch<CR>
nnoremap <leader>f :<C-u>BLines<CR>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

let g:bufferline_echo = 0
let g:bufferline_solo_highlight = 1
" fzf stuff
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '10' }
let g:deoplete#enable_at_startup = 1

let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'error' ] ]
" SuperTab like snippets behavior.
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
