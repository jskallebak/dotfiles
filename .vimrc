call plug#begin('~/.vim/plugged')

" Plugins
 
" Nerd commenter
Plug 'scrooloose/nerdcommenter'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Eunuch
Plug 'tpope/vim-eunuch'

" Surround
Plug 'tpope/vim-surround'

" NERDTree
Plug 'scrooloose/nerdtree'

" Ale
Plug 'w0rp/ale'

" Gitgutter
Plug 'airblade/vim-gitgutter'

" Molokai
Plug 'tomasr/molokai'

" Airline 
Plug 'bling/vim-airline'
" Plug 'lokaltog/vim-powerline'

" SimplyFold
Plug 'tmhedberg/SimpylFold'

" IndentPython
Plug 'vim-scripts/indentpython.vim'

" Youcompleteme
Plug 'valloric/youcompleteme'

" Syntax checking" 
Plug 'vim-syntastic/syntastic'

" PEP8 checking
Plug 'nvie/vim-flake8'

" CtrlP
Plug 'kien/ctrlp.vim'

" Ack
Plug 'mileszs/ack.vim'

" EasyMotion
Plug 'easymotion/vim-easymotion'

call plug#end()

:let mapleader = ","

let g:powerline_pycmd = 'py3'
set laststatus=2

let g:rehash256 = 1
colorscheme molokai

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


highlight BadWhitespace ctermbg=red guibg=red


" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Encoding
set encoding=utf-8

" ycm settings
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax
let python_highlight_all=1
syntax on

" NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" toggle hybrid line numbers
set number! relativenumber!  
highlight Pmenu ctermfg=4* ctermbg=0 guifg=#ffffff guibg=#000000
hi Pmenu           guifg=#66D9EF guibg=#000000
hi PmenuSel                      guibg=#808080
hi PmenuSbar                     guibg=#080808
hi PmenuThumb guifg=#66D9EF

let g:ackprg = 'ag --nogroup --nocolor --column'
map <Leader>a :Ack<Space>

    set rtp+=/usr/local/opt/fzf

    let g:fzf_tags_command = 'ctags --extra=+f -R'
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
nmap <Leader>t :Files<CR>
nmap <Leader>b :Buffers<CR>

set ttimeoutlen=50

nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>


" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

set incsearch
set hlsearch
nmap <Leader>q :noh<CR>

filetype plugin on

" Nerd commenter settings
let g:NERDDefaultAlign = 'left'
