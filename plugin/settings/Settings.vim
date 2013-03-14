"---------------------------------------------------------------------------
"    Description:  zhenlong's vimrc
"    Author:       zhenlonghe@gmail.com
"    License:      GPL v2.0
"    Version:      2.1
"---------------------------------------------------------------------------

" ======================================
"   general settings
" ======================================

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
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set key=			                        " disable encryption
set synmaxcol=128
set viminfo=			                    " disable .viminfo file
set ttyfast                           " send more chars while redrawing

filetype indent on                    " enable filetype-specific indenting
filetype plugin on                    " enable filetype-specific plugins

syntax on                             " syntax highlight
set hlsearch                          " search highlighting
set incsearch                         " incremental search
syntax enable
set t_Co=256
try
  if (isMac)
    colorscheme molokai
  else
    colorscheme molokai
    "if has('syntax')
      "let g:molokai_original = 1
      "colorscheme github
      "au BufNewFile,BufRead,BufEnter,WinEnter * colo zenburn
      "au BufNewFile,BufRead,BufEnter,WinEnter *.wiki colo jellybeans
      "syntax on
    "endif
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

" remove tailing whitespace
"autocmd bufwritepre * :%s/\s\+$//e
"autocmd bufwritepre * :%s/\s\+$//e


" ======================================
"  custom key and plugin configurations
" ======================================

" jj replace ESC in insertmode
im jj <ESC>

" c-j,k for buffer switch
nn <c-j> :bn<cr>
nn <c-k> :bp<cr>

" emacs key bind
imap <c-e> <end>
imap <c-a> <home>
imap <C-f> <Right>
imap <C-b> <Left>
imap <M-f> <S-Right>
imap <M-b> <S-Left>
imap <M-n> <Down>
imap <M-p> <Up>

" remap vim 0
map 0 ^

" return current opened file's dirctory
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" time & date map
nmap <leader>da "=strftime("%y/%m/%d")<cr>p"
nmap <leader>ti "=strftime("%h:%m:%s")<cr>p"

" quick open vimrc in a new tab
nmap <leader>v  :tabe $MYVIMRC<cr>
map  <leader>0  :topleft 100 :split $HOME/.vim/README.md<cr>

nmap <leader>ee :tabe $HOME/.vim/plugin/settings/Settings.vim<cr>

" mouse
nmap <leader>sv :set mouse=v<cr>
nmap <leader>sa :set mouse=a<cr>

map  <leader>ta :Tabularize /
nmap <leader>f  :nohlsearch<cr>
nmap <leader>w  :w !sudo tee %<cr>

"insert a space line
nmap <leader>n o<ESC>
set ofu=syntaxcomplete#Complete
