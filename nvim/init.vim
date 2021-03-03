call plug#begin('~/.vim/plugged')

Plug 'mfukar/robotframework-vim'
Plug 'godlygeek/tabular'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-easy-align'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-bufferline'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'unkiwii/vim-nerdtree-sync'

call plug#end()

set title
set cursorline
set number
set relativenumber
set hidden
set tabstop=2
set shiftwidth=2
set mouse=a
set expandtab
syntax on
set clipboard+=unnamedplus
set ignorecase
set smartcase
set splitright
colorscheme gruvbox
set background=dark
set scrolloff=10
set sidescrolloff=5
            
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-t> :<C-u>Files<CR>
nnoremap <F9>  :<C-u>BLines<CR>
nnoremap <F10> :<C-u>Buffers<CR>
nnoremap <F12> :<C-u>RG <C-R><C-W><CR>
nnoremap <Esc> :<C-u>nohlsearch<CR>
nnoremap <leader>f :<C-u>RG<CR>
nnoremap <leader>r : NERDTreeFind<cr>
nnoremap <C-o> <C-o>zz
nnoremap <C-]> <C-]>zz

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

command Bd bp\|bd \#

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --type c --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

let g:bufferline_echo = 0
let g:bufferline_solo_highlight = 1
" fzf stuff
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '15' }

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=60

let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c'], ['z', 'error' ] ]

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

if exists("g:loaded_nerdtree_sync") || &cp
  finish
endif

let g:loaded_nerdtree_sync = 4  " plugin version
let s:keepcpo = &cpo
set cpo&vim

function! s:isNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

