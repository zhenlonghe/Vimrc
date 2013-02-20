"other settings see plugin/settings/Settings


" set leader to ,
let mapleader=","
let g:mapleader=","
set nocompatible
filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


if has("gui_running")
  let g:isgui = 1
else
  let g:isgui = 0
endif

if(has("win32") || has("win64") || has("win95") || has("win16"))
  let g:iswindows = 1
else
  let g:iswindows = 0
endif

if has('mac')
  let g:isMac= 1
else
  let g:isMac = 0
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'matchit.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-surround'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'taglist.vim'
Bundle 'vimwiki'
Bundle 'colorselector'
"Bundle 'jiangmiao/auto-pairs'
Bundle 'mattn/calendar-vim'
Bundle 'Townk/vim-autoclose'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'tpope/vim-ragtag'
Bundle 'ap/vim-css-color'
Bundle 'mileszs/ack.vim'
Bundle 'hallison/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'Raimondi/delimitMate'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-repeat'
Bundle 'benmills/vimux'
Bundle 'xolox/vim-easytags'
Bundle 'godlygeek/tabular'
Bundle 'Lokaltog/vim-easymotion'
