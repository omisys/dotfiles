call plug#begin('~/.vim/plugged')
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mfukar/robotframework-vim'
Plug 'shougo/deoplete-clangx'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'w0ng/vim-hybrid'
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-surround'
Plug 'bling/vim-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
colorscheme hybrid
set background=dark
set scrolloff=5
set sidescrolloff=5

au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

nnoremap <F2> :<C-u>NERDTreeToggle<CR>
nnoremap <C-p> :<C-u>Files<CR>
nnoremap <leader>b :<C-u>Buffers<CR>
nnoremap <F12> :<C-u>Rg <C-R><C-W><CR>
nnoremap <Esc> :<C-u>nohlsearch<CR>

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Neosnippet stuff
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

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

" SuperTab like snippets behavior.
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
