"other settings see plugin/settings/Settings

" set leader to ,
let mapleader=","
let g:mapleader=","
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" vim-scripts repos

Bundle 'calendar.vim--Matsumoto'
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
