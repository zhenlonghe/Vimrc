set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set ruler                             " show the cursor position all the time
set autoread                          " auto read when file is changed from outside
set wrap
set linebreak
set nolist
set hidden
set linespace=0
set nocursorline
set nofoldenable
set number
set numberwidth=4
set title
set showmode
set nobomb                            " no BOM(Byte Order Mark)
set nostartofline
set laststatus=2
set clipboard+=unnamed
set splitright                        " always open vertical split window in the right side
set splitbelow                        " always open horizontal split window below
set scrolloff=5                       " start scrolling when n lines away from margins
set switchbuf=useopen
"set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set key=			                        " disable encryption
set synmaxcol=128
set viminfo=			                    " disable .viminfo file
set ttyfast                           " send more chars while redrawing

"se imd
"au InsertEnter * se noimd
"au InsertLeave * se imd
"au FocusGained * se imd
"set noimdisable
"set iminsert=0
"set imsearch=0

filetype on                           " enable filetype detection
filetype indent on                    " enable filetype-specific indenting
filetype plugin on                    " enable filetype-specific plugins

syntax on                             " syntax highlight
set hlsearch                          " search highlighting
set incsearch                         " incremental search
syntax enable
set t_Co=256
try
  if (!isMac)
    let g:solarized_termcolors=256
    let g:solarized_termtrans
    colorscheme solarized_dark
  else
    colorscheme molokai
  endif
catch
endtry

set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <tab> with spaces
set softtabstop=4
set shiftwidth=2
set tabstop=2
set shortmess=i                       " remove splash wording

set mouse=a
" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.ds_store
set wildignore+=log/**
set wildignore+=tmp/**

" cursorline switched while focus is switched to another split window
"autocmd winenter * setlocal cursorline
autocmd winleave * setlocal nocursorline



" ======================================
"  custom key and plugin configurations
" ======================================
" remove tailing whitespace
" autocmd bufwritepre * :%s/\s\+$//e
"autocmd bufwritepre * :%s/\s\+$//e



"map <leader><leader> <leader>cc                " comment
map <leader>f :nohlsearch<cr>

" 用c-j,k在buffer之间切换
nn <c-j> :bn<cr>
nn <c-k> :bp<cr>
 
"bash(emacs)风格键盘绑定
imap <c-e> <end>
imap <c-a> <home>

"next and prev tab
noremap <f7> gt
noremap <f8> gt

" identation
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" remap vim 0
map 0 ^

" return current opened file's dirctory
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" quick open vimrc in a new tab
nmap <leader>v :tabe $MYVIMRC<cr>
map <leader>0 :topleft 100 :split $HOME/.vim/readme.md<cr>
map <leader>w :w<cr>
nmap <leader>ee :tabe $HOME/.vim/plugin/settings/Settings.vim<cr>
vmap <leader>xx "+y
nmap <leader>vv "+p

"time & date map
map <leader>da "=strftime("%y/%m/%d")<cr>p"
map <leader>ti "=strftime("%h:%m:%s")<cr>p"
