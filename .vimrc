" ~/.vimrc
"
" https://github.com/zma/vim-config
"

set nocompatible
filetype off

" Set up vim-plugin first

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" show buffers on top
Plug 'fholgado/minibufexpl.vim'

" for Markdown
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" All of your Plugs must be added before the following line
call plug#end()            " required

filetype plugin indent on    " required

filetype on
filetype plugin on

syntax on

" GUI only configuration
if has("gui_running")
  let g:os = substitute(system('uname'), '\n', '', '')
  if g:os == "Darwin"
    set guifont=Menlo\ Regular:h15
  else
    " Linux by default
    set guifont=Monospace\ Regular\ 13
  endif
  :colorscheme evening
  set lines=200
  set columns=160
endif

" vim autocomplete
set complete=.,w,b,u,t,i
set completeopt=menu,preview

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" vim command autocomplete
set wildmenu

" show line number
set number

" " backup
" " keep a backup file
" set backup
" " create the vimbackup dir if it does not exist
" let t:check_vimbackup=system("bash -c \"if [ ! -d ~/.vimbackup ]; then mkdir ~/.vimbackup; fi\"")
" " keep all backup files in one central dir
" set backupdir=~/.vimbackup
"  if backupcopy is no, vim will change symbolic link file to normal file -
"  avoid this
set backupcopy=yes

" Default Tab setting, space is preferred
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" set textwidth=72
" set linebreak
set wrap

" do incremental searching
set incsearch
" high light the search content
set hlsearch
" search color
highlight search ctermbg=12

" warning/error menu color
highlight Pmenu ctermbg=231

" case insensitive yet smart search
:set ignorecase
:set smartcase

" keep N lines of command line history
set history=5120

" display incomplete commands
" set showcmd

" backspace problem fix
set backspace=indent,eol,start

" good for Chinese charactor
set fileencodings=utf-8,gbk,ucs-bom,latin1

" move cursor by mouse click
" set mouse=a

" disable mouse
set mouse=

" set autoread

" show line number
set number

" status bar
set laststatus=2
set statusline=%<%t\ %=%c,%l/%L\ %P\ %F\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y

" indent settings
" turn this on to make indent work
filetype indent on

" by default, turn it off
" and leave turning indent on in each language's config in FT_*()
autocmd BufRead,BufNewFile * filetype indent off

" allow windows to be open in the background
set hidden

" highlight trailing spaces
match Todo /\s\+$/

" automatically strip trailing white spaces
fun! <SID>StripTrailingWhitespaces()
  if &modifiable
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endif
endfun

" autocmd FileType c,cpp,go,java,php,ruby,python,vim,cfg,sh autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" ========= Key Shortcuts =========
nmap S :w<CR>
nmap Q :q<CR>
" nmap <C-e> :bdelete<CR>
nmap B :bd<CR>

" cursor moving between windows
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>
nnoremap <C-j> :wincmd j<CR>

" imaps.vim from vim-latest remaps C-j; a hack to avoid it
autocmd BufEnter * nnoremap <C-j> :wincmd j<CR>

" since we remapped <C-j>, disable place holder function of imap
let g:Imap_UsePlaceHolders = 0

nnoremap <C-k> :wincmd k<CR>

" leader key
let mapleader=","

" cursor moving between tabs
" reuse C-p and C-n since moving up/down is usually k/j
" nmap <C-p> :tabprevious<CR>
" nmap <C-n> :tabnext<CR>

" cursor moving between buffers
nmap <C-p> :bprevious<CR>
nmap <C-n> :bnext<CR>

" use C-6
" nmap <C-m> :b#<CR>

" cursor moving back
:nnoremap <C-T> <C-O>
:nnoremap <C-[> <C-O>

nmap gn :lprevious<CR>
nmap gp :lnext<CR>

" most of time use Ctrl-[

" use gh to clearn highlight
nmap gh :noh<CR>

" scala
" nmap cp :cp<CR>
" nmap cn :cn<CR>

" F2 in insert mode for paste toggle
set pastetoggle=<F2>

" F4 for spell check with aspell
map <F4> :w!<CR>:!aspell check %<CR>:e! %<CR>

" spell check highlight background
hi clear SpellBad
hi SpellBad cterm=underline
" Set style for gVim
hi SpellBad gui=undercurl

" make
map <F7> :make! <CR> :cwindow <CR>
" display the output and wait for <CR>
map <C-F7> :make <CR> :cwindow <CR>

" number toggle
map <F9> :let &number=1-&number <CR>

" remove trailing spaces
map <F6> :%s/\s\+$//e<CR>

" set tab width
function SetTab2()
  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  echo "Set tab to 2 spaces"
endfunction

function SetTab3()
  set shiftwidth=3
  set tabstop=3
  set softtabstop=3
  echo "Set tab to 3 spaces"
endfunction

function SetTab4()
  set shiftwidth=4
  set tabstop=4
  set softtabstop=4
  echo "Set tab to 4 spaces"
endfunction

map t4 :call SetTab4() <CR>
map t3 :call SetTab3() <CR>
map t2 :call SetTab2() <CR>

" ========= End Key Shortcuts =========

" ======== language specific settings ===========

autocmd BufEnter *.cpp setf cpp
autocmd BufEnter *.c++ setf cpp
autocmd BufEnter *.cc setf cpp
autocmd BufEnter *.hpp setf cpp
" autocmd BufEnter *.h setf cpp
autocmd BufEnter *.c setf c
autocmd BufEnter *.tex setf tex
autocmd BufEnter *.txt setf txt
autocmd BufEnter *.md setf markdown
autocmd BufEnter *.bib setf bib
autocmd BufEnter *.php setf php
" autocmd BufEnter *.ml setf ocaml
" autocmd BufEnter *.mli setf ocaml
autocmd BufEnter *.scala setf scala
autocmd BufEnter *.bash setf sh
autocmd BufEnter *.sh setf sh
autocmd BufEnter *.py setf python
autocmd BufEnter *.js setf javascript
autocmd BufEnter *.go setf go

autocmd FileType mail call FT_mail()
autocmd FileType cpp call FT_cpp()
autocmd FileType c call FT_c()
autocmd FileType php call FT_php()
autocmd FileType tex call FT_tex()
autocmd FileType txt call FT_txt()
autocmd FileType markdown call FT_markdown()
autocmd FileType bib call FT_bib()
" autocmd FileType ocaml call FT_ocaml()
" autocmd FileType scala call FT_scala()
autocmd FileType sh call FT_sh()
autocmd FileType python call FT_python()
autocmd FileType javascript call FT_javascript()
autocmd FileType java call FT_java()
autocmd FileType go call FT_go()

function FT_sh()
  set autoindent
  " set colorcolumn=80
  set nospell
  filetype indent on
  filetype plugin indent on
endfunction

function FT_python()
  " set colorcolumn=80
  set autoindent
  filetype indent on
  filetype plugin indent on

  " tab width
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
  set expandtab
endfunction

function FT_mail()
  set textwidth=1000000000
  " reformat for 72 char lines
  " normal gggqGgg
  " settings
  set spell spelllang=en
  set fileencodings=iso8859-1,utf-8
  " abbreviations
  " iabbr <buffer> gd Good Day!
endfunction

function FT_tex()
  " set textwidth=72
  " reformat for 72 char lines
  " normal gggqGgg
  set spell spelllang=en
  set fileencodings=iso8859-1,utf-8
  " setlocal fileencoding=iso8859-1,utf-8
endfunction

function FT_markdown()
  set spell spelllang=en
  set fileencodings=iso8859-1,utf-8
endfunction

function FT_txt()
  " set textwidth=68
  " reformat for 80 char lines
  " normal gggqGgg
  set spell spelllang=en
  " setlocal fileencoding=iso8859-1,utf-8
  set fileencodings=iso8859-1,utf-8
endfunction

function FT_bib()
  set nospell
  set fileencodings=iso8859-1,utf-8
endfunction

function FT_php()
  set textwidth=1000000000
  " set textwidth=72
  set noautoindent
  set nocindent
  set nospell
endfunction

" ------------- C ----------------------------
function FT_c()
  " disable auto comment for C
  setlocal comments-=:// comments+=f://
  " the textwidth is used for formatting the comments
  set textwidth=80
  " set colorcolumn=80
  set autoindent
  set cindent
  set nospell
endfunction
" ------------- End C ----------------------------

" ------------- C++ ----------------------------

function FT_cpp()
  " disable auto comment for cpp
  setlocal comments-=:// comments+=f://
  setlocal textwidth=80
  " setlocal colorcolumn=80

  setlocal tabstop=3
  setlocal shiftwidth=3
  setlocal softtabstop=3

  setlocal autoindent
  setlocal cindent
  setlocal nospell
  " also handle lambda correctly, with namespace indent
  setlocal cino+=g-1,j1,(0,ws,Ws,N+s,t0,g0,+0
endfunction

" ------------- End C++ ----------------------------

function FT_java()
  set autoindent
  filetype indent on
  set cindent
  filetype plugin indent on
endfunction

function FT_go()
  set autoindent
  filetype indent on
  set cindent
  filetype plugin indent on
  " use tab instead of spaces
  set noexpandtab
endfunction

function FT_javascript()
  " set textwidth=80
  " set colorcolumn=80
  set autoindent
  filetype indent on
  filetype plugin indent on
endfunction

" ------------------ local config -----------------
if filereadable($HOME."/.vimrc_local")
  source ${HOME}/.vimrc_local
endif

