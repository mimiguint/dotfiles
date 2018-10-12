" vim-plug
"
call plug#begin('~/.vim/plugged')
Plug 'gosukiwi/vim-atom-dark'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-endwise'
Plug 'Yggdroot/indentLine'
Plug 'Lokaltog/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
call plug#end()


" encoding
"
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
set fileformats=unix,dos,mac


" default option
"
set complete+=k
set autoindent
set wildmenu
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set ttyfast
set hidden
set autoread

" tab width
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" directory (backups, swaps, undo, ...)
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swaps
set undodir=$HOME/.vim/undo

" leader key
let g:mapleader=','

" auto comment
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
augroup END

" plugin
filetype plugin indent on


" visual
"
syntax on
set t_Co=256
set ruler
set number
"""set nowrap
set ambiwidth=double
set showcmd
set showmatch
set list
set listchars=tab:>_,trail:_,extends:\
set laststatus=2


" mapping
"
nnoremap j gj
nnoremap k gk

" split window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tab window
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent><S-t> :tabnew<CR>

" encoding
nnoremap <Leader>eu :set fenc=utf-8<CR>
nnoremap <Leader>ee :set fenc=euc-jp<CR>
nnoremap <Leader>es :set fenc=cp932<CR>

nnoremap <Leader>eru :e ++enc=utf-8 %<CR>
nnoremap <Leader>ere :e ++enc=euc-jp %<CR>
nnoremap <Leader>ers :e ++enc=cp932 %<CR>
nnoremap <Leader>err :e %<CR>

" remove highlight
nnoremap <silent><ESC><ESC> :nohlsearch<CR>


" vim-plug: vim-atom-dark
"
if filereadable(expand("~/.vim/plugged/vim-atom-dark/colors/atom-dark-256.vim"))
  colorscheme atom-dark-256
endif


" vim-plug: nerdree
"
let g:NERDTreeShowHidden = 1

nnoremap <silent><C-n> :NERDTreeToggle<CR>


" vim-plug: neocomplete
"
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
"""let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:neocomplete#sources#dictionary#dictionaries = {
  \ 'default' : ''
    \ }
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <silent><CR> <C-r>=<SID>my_cr_function()<CR>

function! s:my_cr_function()
"""  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"""let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"""let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" vim-plug: neosnippet
"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" vim-plug: indentLine
"
let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '|'
let g:indentLine_faster = 1


" vim-plug: vim-easymotion
"
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_use_upper = 1
