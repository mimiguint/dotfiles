" xdg environment
"
if empty($XDG_CACHE_HOME)
  let $XDG_CACHE_HOME = expand("$HOME/.cache")
endif


" encoding
"
if has('win32')
  set encoding=cp932
  set fileencoding=cp932
  set fileencodings=cp932,utf-8,iso-2022-jp,euc-jp
  set fileformats=dos,unix,mac
else
  set encoding=utf-8
  set fileencoding=utf-8
  set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932
  set fileformats=unix,dos,mac
endif


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
set clipboard=unnamed,unnamedplus

" tab width
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" directory (backups, swaps, undo, ...)
function! s:make_cache_dir()
  for l:dir in ['backups', 'swaps', 'undo']
    let l:cache_dir = expand("$XDG_CACHE_HOME/vim/" . l:dir)
    if !isdirectory(l:cache_dir)
      call mkdir(l:cache_dir, 'p')
    endif
  endfor
endfunction
autocmd VimEnter * call s:make_cache_dir()

set backupdir=$XDG_CACHE_HOME/vim/backups
set directory=$XDG_CACHE_HOME/vim/swaps
set undodir=$XDG_CACHE_HOME/vim/undo

" leader key
let g:mapleader=','

" auto comment
augroup auto_comment_off_group
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
set nowrap
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

" delete
nnoremap x "_x
nnoremap X "_X
vnoremap x "_x
vnoremap X "_X
nnoremap s "_s
nnoremap S "_S
vnoremap s "_s
vnoremap S "_S

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


" vim-plug
"
if has('win32')
  let s:vim_dir = expand("$HOME/vimfiles")
else
  let s:vim_dir = expand("$HOME/.vim")
endif

call plug#begin(expand(s:vim_dir . '/plugged'))
Plug 'gosukiwi/vim-atom-dark'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-endwise'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Lokaltog/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
call plug#end()


" vim-plug: vim-atom-dark
"
if filereadable(expand(s:vim_dir . '/plugged/vim-atom-dark/colors/atom-dark-256.vim'))
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


" vim-plug: vim-indent-guides
"
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :highlight IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :highlight IndentGuidesEven ctermbg=235


" vim-plug: vim-easymotion
"
let g:EasyMotion_keys = 'hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
let g:EasyMotion_use_upper = 1
