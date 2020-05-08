" ~/.vimrc
" Eric Ma, https://www.ericzma.com

" Note: Set up Vundle first
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" show list of tags
Plugin 'taglist.vim'

" auto tags refresh/generation
Plugin 'craigemery/vim-autotag'

" a file tree explorer
Plugin 'preservim/nerdtree'

" show git status in nerdtree
" Has confliction with syntastic. May reenable after it is fixed https://github.com/Xuyuanp/nerdtree-git-plugin/pull/131
" Plugin 'Xuyuanp/nerdtree-git-plugin'

" show buffers on top
Plugin 'minibufexpl.vim'

" avoid disabling Syntastic by tabnine/ycm
let g:ycm_show_diagnostics_ui = 0

" AI based code autocompletion
Plugin 'zxqfl/tabnine-vim'

" automatic syntastic checking
Plugin 'vim-syntastic/syntastic'

" for ocaml
Plugin 'omlet.vim'

" for C++
Plugin 'Cpp11-Syntax-Support'

" for PHP
Plugin '2072/PHP-Indenting-for-VIm'

" for Go
Plugin 'fatih/vim-go'

" for JS
Plugin 'pangloss/vim-javascript'

" php-cs-fixer
let g:php_cs_fixer_path = "~/.vim/tools/php-cs-fixer/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "symfony"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_config_file = '.php_cs'       " configuration file
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

Bundle 'stephpy/vim-php-cs-fixer'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

filetype on
filetype plugin on

syntax on

" vim autocomplete
set complete=.,w,b,u,t,i
set completeopt=menu,preview

" vim command autocomplete
set wildmenu

" show line number
set number

" backup
" keep a backup file
set backup
" create the vimbackup dir if it does not exist
let t:check_vimbackup=system("bash -c \"if [ ! -d ~/.vimbackup ]; then mkdir ~/.vimbackup; fi\"")
" keep all backup files in one central dir
set backupdir=~/.vimbackup
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
set mouse=a

" set autoread

" show line number
set number

" status bar
set laststatus=2
set statusline=%<%t\ %([%{Tlist_Get_Tagname_By_Line()}]%)%=%c,%l/%L\ %P\ %F\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y

" indent settings
" turn this on to make indent work
filetype indent on

" by default, turn it off
" and leave turning indent on in each language's config in FT_*()
autocmd BufRead,BufNewFile * filetype indent off

" taglist: auto open
let Tlist_Auto_Open = 1
" let Tlist_Show_Menu = 1

" auto close Tlist window if it is the only window
let Tlist_Exit_OnlyWindow = 1

" where to find the tags file
set tags=tags;/


" setlocal spell spelllang=en

" allow windows to be open in the background
set hidden

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" highlight SyntasticError term=reverse ctermbg=88

" NERDTree on the right
let NERDTreeWinPos="right"

" Open NERDTree by default
" autocmd VimEnter * NERDTree
" after opening the NERDTree, move the cursor to the main window
" autocmd VimEnter * wincmd p

" show hidden files
let NERDTreeShowHidden=1

" close vim if nerdtree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

autocmd FileType c,cpp,go,java,php,ruby,python,vim,cfg,sh autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" ========= Key Shortcuts =========
nmap W :w<CR>
nmap Q :q<CR>

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
" these 2 shortcuts used for syntastic
" buffers
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>

nmap <C-e> :bdelete<CR>
" use C-6
" nmap <C-m> :b#<CR>

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

" F2 for NERDTree
map <F2> :execute 'NERDTreeToggle'<CR>
" F2 for openning current file's directory
" map <F2> :e %:p:h<CR>

" F3 for taglist
map <F3> :TlistToggle <CR>

" F4 for spell check with aspell
map <F4> :w!<CR>:!aspell check %<CR>:e! %<CR>

" make
map <F7> :make! <CR> :cwindow <CR>
" display the output and wait for <CR>
map <C-F7> :make <CR> :cwindow <CR>

" gen tags in vim
" map <F8>   :!find . -maxdepth 1 -regex '.*\.\(py\<bar>c\<bar>h\<bar>cc\<bar>hh\<bar>cpp\<bar>hpp\<bar>ml\<bar>mli\<bar>java\<bar>go\)' <bar> /usr/bin/ctags --c++-kinds=+p --fields=+iaS --extra=+q -L-<CR>
" map <C-F8> :!find .             -regex '.*\.\(py\<bar>c\<bar>h\<bar>cc\<bar>hh\<bar>cpp\<bar>hpp\<bar>ml\<bar>mli\<bar>java\<bar>go\)' <bar> /usr/bin/ctags --c++-kinds=+p --fields=+iaS --extra=+q -L-<CR>

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
autocmd BufEnter *.bib setf bib
autocmd BufEnter *.php setf php
autocmd BufEnter *.ml setf ocaml
autocmd BufEnter *.mli setf ocaml
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
autocmd FileType bib call FT_bib()
autocmd FileType ocaml call FT_ocaml()
" autocmd FileType scala call FT_scala()
autocmd FileType sh call FT_sh()
autocmd FileType python call FT_python()
autocmd FileType javascript call FT_javascript()
autocmd FileType java call FT_java()
autocmd FileType go call FT_go()

function FT_sh()
  set autoindent
  set colorcolumn=80
  filetype indent on
  filetype plugin indent on
endfunction

function FT_python()
  set colorcolumn=80
  set autoindent
  filetype indent on
  filetype plugin indent on

  " tab width
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
endfunction

function FT_mail()
  set textwidth=100000000000
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

  " ============= vim-latex ==================
  " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
  filetype plugin on

  " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
  " can be called correctly.
  set shellslash

  " IMPORTANT: grep will sometimes skip displaying the file name if you
  " search in a singe file. This will confuse Latex-Suite. Set your grep
  " program to always generate a file-name.
  set grepprg=grep\ -nH\ $*

  " OPTIONAL: This enables automatic indentation as you type.
  filetype indent on

  " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
  " to
  " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
  " The following changes the default filetype back to 'tex':
  let g:tex_flavor='latex'
  " ============= end vim-latex ==============
endfunction

function FT_txt()
  " set textwidth=68
  " reformat for 80 char lines
  " normal gggqGgg
  " set spell spelllang=en
  set nospell
  " setlocal fileencoding=iso8859-1,utf-8
  set fileencodings=iso8859-1,utf-8
endfunction

function FT_bib()
  set nospell
  set fileencodings=iso8859-1,utf-8
endfunction

function FT_php()
  set textwidth=100000000000
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

" From https://github.com/vim-scripts/google.vim/blob/master/indent/google.vim
function! GoogleCppIndent()
  let l:cline_num = line('.')

  let l:orig_indent = cindent(l:cline_num)

  if l:orig_indent == 0 | return 0 | endif

  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  if l:pline =~# '^\s*template' | return l:pline_indent | endif

  " TODO: I don't know to correct it:
  " namespace test {
  " void
  " ....<-- invalid cindent pos
  "
  " void test() {
  " }
  "
  " void
  " <-- cindent pos
  if l:orig_indent != &shiftwidth | return l:orig_indent | endif

  let l:in_comment = 0
  let l:pline_num = prevnonblank(l:cline_num - 1)
  while l:pline_num > -1
    let l:pline = getline(l:pline_num)
    let l:pline_indent = indent(l:pline_num)

    if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
      let l:in_comment = 1
    elseif l:in_comment == 1
      if l:pline =~ '/\*\(.\{-}\*/\)\@!'
        let l:in_comment = 0
      endif
    elseif l:pline_indent == 0
      if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
        if l:pline =~# '^\s*namespace.*'
          return 0
        else
          return l:orig_indent
        endif
      elseif l:pline =~# '\\$'
        return l:orig_indent
      endif
    else
      return l:orig_indent
    endif

    let l:pline_num = prevnonblank(l:pline_num - 1)
  endwhile

  return l:orig_indent
endfunction

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
  " also handle lambda correctly
  setlocal cino=g-1,j1,(0,ws,Ws,N-s
  call GoogleCppIndent()
  " no namespace indent
  " set cino=N-s
  " do namespace indent
  set cino=N+s
endfunction

" syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"
" ------------- End C++ ----------------------------

" ------------------ OCaml --------------------

" ocp-indent with ocp-indent-vim
let s:opamshare=system("opam config var share | tr -d '\n'")
execute "autocmd FileType ocaml source ".s:opamshare."/vim/syntax/ocp-indent.vim"

let s:opamshare=system("opam config var share | tr -d '\n'")
" merlin
execute "set rtp+=".s:opamshare."/ocamlmerlin/vim"
execute "set rtp+=".s:opamshare."/ocamlmerlin/vimbufsync"

" merlin with syntastic
let g:syntastic_ocaml_checkers=['merlin']

" syntastic
let g:syntastic_ocaml_use_ocamlc = 1
let g:syntastic_ocaml_use_janestreet_core = 1
let s:opamlib=system("opam config var lib | tr -d '\n'")
execute "let g:syntastic_ocaml_janestreet_core_dir = \"".s:opamlib."/core/\""
let g:syntastic_ocaml_camlp4r = 1
let g:syntastic_ocaml_use_ocamlbuild = 1

function FT_ocaml()
  " set textwidth=80
  set colorcolumn=80
  set autoindent
  " must before plugin indent on
  filetype indent on
  filetype plugin indent on

  " merlin with core
  " execute ":Use core"
endfunction

" ------------------ End OCaml --------------------

" ------------------ Scala --------------------

" disable syntastic for scala---it is too slow
" use sbt instead
let g:syntastic_scala_checkers=['']

" function FT_scala()
"     set colorcolumn=80
"     set autoindent
"     filetype indent on
"     filetype plugin indent on
" endfunction

" ------------------ End Scala --------------------

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
  set colorcolumn=80
  set autoindent
  filetype indent on
  filetype plugin indent on
endfunction

" ------------------ local config -----------------
if filereadable($HOME."/.vimrc_local")
  source ${HOME}/.vimrc_local
endif

