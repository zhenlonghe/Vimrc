"    ===================================
"    Description  : zhenlong's vimrc
"    Author       : zhenlonghe@gmail.com
"    License      : GPL v2.0
"    ===================================

call plug#begin('~/.vim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'gaving/vim-sqlcase'
Plug 'godlygeek/tabular'
Plug 'itchyny/calendar.vim'
Plug 'junegunn/limelight.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-repeat'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'michaeljsmith/vim-indent-object'
Plug 'pelodelfuego/vim-swoop'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/SearchComplete'
Plug 'vim-scripts/matchit.zip'
Plug 'vimwiki/vimwiki'
Plug 'yianwillis/vimcdoc'
Plug '~/autocmds'
" Colorsheme {
Plug 'gerardbm/vim-atomic'
Plug 'altercation/vim-colors-solarized'
Plug 'thenewvu/vim-colors-sketching'
Plug 'antlypls/vim-colors-codeschool'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'nightsense/seagrey'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
"}
call plug#end()

" Environment {
    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    "}

    " Basics {
        set nocompatible
    "}

    " Arrow Key Fix {
        " https://github.com/spf13/spf13-vim/issues/780
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    "}
"}

" General {
    syntax on                           " Syntax highlighting
    filetype plugin indent on           " Automatically detect file types.
    set mouse=v                         " Automatically enable mouse usage
    set mousehide                       " Hide the mouse cursor while typing
    set noimdisable
    set encoding=utf-8
    scriptencoding utf-8
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,gbk,euc-kr,utf-bom
    if has('clipboard')
        if has('unnamedplus')           " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else                            " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set shortmess+=filmnrxoOtT          " Abbrev. of messages
    set viewoptions=folds,options,cursor,unix,slash
                                        " Better Unix / Windows compatibility
    set hidden                          " Allow buffer switching without saving
    set ttyfast                         " send more chars while redrawing
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator
    set history=1000                    " Store a ton of history (default is 20)
    set updatetime=250
    set virtualedit=onemore             " Allow for cursor beyond last character

    set visualbell                      " disable sound on errors
    set noerrorbells
    set t_vb=
    set tm=500

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG
                \ call setpos('.', [0, 1, 1, 0])

    " Windows {
        if WINDOWS()
            set viminfo+=n~/.cache/_viminfo
        endif
    "}

    " Backups {
        "set autochdir
        set backup
        set backupdir=~/.cache/backup
        set directory=~/.cache/backup
        set writebackup
        let g:netrw_home='~/.cache/'
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undodir=~/.cache/undo/
            set undolevels=1000         " Max number of changes can be undone
            set undoreload=10000        " Max number lines to save for undo
        endif
    "}
"}

" Vim UI {
    set t_Co=256                        " Enable 256 colors
    set background=dark                 " Assume a dark background
    colors Tomorrow-Night               " Load a colorscheme

    set showmode                        " Display the current mode
    set cursorline                      " Highlight current line
    set tabpagemax=15                   " Only show 15 tabs

    highlight clear SignColumn          " SignColumn should match background
    highlight clear LineNr              " Current line number row will have same
                                        " background color in relative mode

    if has('cmdline_info')
        set ruler                       " Show the ruler
        set showcmd                     " Show partial commands
    endif

    set backspace=indent,eol,start      " Backspace for dummies
    set linespace=0                     " No extra spaces between rows
    set numberwidth=4
    set showmatch                       " Show matching brackets/parenthesis
    set incsearch                       " Find as you type search
    set hlsearch                        " Highlight search terms
    set winminheight=0                  " Windows can be 0 line high
    set ignorecase                      " Case insensitive search
    set smartcase                       " Case sensitive when uc present
    set wildmenu                        " Show list instead of just completing
    set wildmode=list:longest,full      " Command <Tab> completion, list matches
                                        ", then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys wrap too
    set scrolljump=5                    " Lines to scroll when cursor leaves
    set scrolloff=3                     " Lines to keep above and below cursor
    set nofoldenable                      " Auto fold code

    " Highlight problematic whitespace
    set list
    set listchars=tab:\ \ ,trail:·,extends:#,nbsp:.
"}

" GUI Settings {
    if has('gui_running')
        set guioptions-=T               " Remove the toolbar
        set lines=40                    " 40 lines of text instead of 24
        if LINUX()
            set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11
        elseif OSX()
            set guifont=Monaco:h14,Menlo\ Regular:h11,Consolas\ Regular:h12
            colors Tomorrow-Night
            set guioptions=aAce
            set showtabline-=0
        elseif WINDOWS()
            set go=
            exec 'cd ' . fnameescape('D:\Dropbox\code')
            color hybrid
            set guifont=Monaco:h9,Courier_New:h10
            "set guifont=Source\ Code\ Pro:h10,Courier_New:h10
            let g:MyVimLib   = 'gvimfullscreen.dll'
            let g:VimAlpha   = 245
            let g:VimTopMost = 0

            if !exists('g:screen_size_restore_pos')
              let g:screen_size_restore_pos = 1
            endif
            if !exists('g:screen_size_by_vim_instance')
              let g:screen_size_by_vim_instance = 1
            endif
            autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
            autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
            "autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                " Enable 256 colors
        endif
    endif
    if !exists(":DiffOrig")
        command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
              \ | wincmd p | diffthis
    endif
"}

" Formatting {
    set nowrap                          " Do not wrap long lines
    set autoindent                      " Indent at the same level
    set shiftwidth=4                    " Use indents of 4 spaces
    set expandtab                       " Tabs are spaces, not tabs
    set tabstop=4                       " An indentation every four columns
    set softtabstop=4                   " Let backspace delete indent
    set smarttab                        " Insert tabs on the start
    set nojoinspaces                    " Prevents inserting two spaces
    set splitright                      " Puts new vsplit windows to the right
    set splitbelow                      " Puts new split windows to the bottom
    "set matchpairs+=<:>                " Match, to be used with %
    set pastetoggle=<F12>               " pastetoggle

    "autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml
                \ setlocal expandtab shiftwidth=2 softtabstop=2
    " preceding line best in a plugin but here for now.
    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    " Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    " Workaround broken colour highlighting in Haskell
    autocmd FileType haskell,rust setlocal nospell
    autocmd BufNewFile,BufRead *.py  set nu

    " Sop file
    autocmd BufNewFile,BufRead *.sop set filetype=c
    autocmd BufNewFile,BufRead *.sop let g:airline#extensions#whitespace#checks = []

    "wxml,wxss
    "set equalprg=xmllint\ --format\ -
    autocmd BufNewFile,BufRead *.wxml set filetype=xml
    autocmd BufNewFile,BufRead *.wxss set filetype=css


"}

" Key (re)Mappings {
    let mapleader   = " "
    let g:mapleader = " "

    nm <leader>n  :ene<CR>
    nm <leader>o  :TagbarToggle<CR>
    nm <leader>c  :bd!<cr>
    nm <leader>q  :bd<cr>
    nm <leader>xx :qa!<cr>
    nm <leader>t  :set ft=

    " remap vim 0
    nm 0 ^
    nm j gj
    nm k gk
    nm Y y$

    " c-j,k for buffer switch
    nm <c-j> :bn<cr>
    nm <c-k> :bp<cr>
    nm <tab> <c-w>w

    if WINDOWS()
        nm <c-CR> :call ToggleFullScreen()<cr>
        nm <a-f>  :call SwitchVimTopMostMode()<cr>
        nm <a-r>  :call SetAlpha(-10)<cr>
        nm <a-e>  :call SetAlpha(10)<cr>
    endif

    nm <leader>r :call leaderf#Mru#startExpl(g:Lf_WindowPosition)<cr>

    " Code folding options
    "nm <leader>f0 :set foldlevel=0<CR>
    "nm <leader>f1 :set foldlevel=1<CR>
    "nm <leader>f2 :set foldlevel=2<CR>
    "nm <leader>f3 :set foldlevel=3<CR>
    "nm <leader>f4 :set foldlevel=4<CR>
    "nm <leader>f5 :set foldlevel=5<CR>
    "nm <leader>f6 :set foldlevel=6<CR>
    "nm <leader>f7 :set foldlevel=7<CR>
    "nm <leader>f8 :set foldlevel=8<CR>
    "nm <leader>f9 :set foldlevel=9<CR>

    nm <silent> <leader>/ :nohlsearch<CR>

    " time & date map
    nm <leader>da "=strftime("%y%m%d")<cr>p"
    nm <leader>ti "=strftime("%h:%m:%s")<cr>p"

    " quick open vimrc in a new tab
    nm <leader>v  :e $MYVIMRC<cr>
    nm <leader>s  :source $MYVIMRC<cr>

    " mouse
    nm <leader>sv :set mouse=v<cr>
    nm <leader>sa :set mouse=a<cr>

    " Some helpers to edit mode
    cm %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    nm <leader>ew :e %%
    nm <leader>es :sp %%
    nm <leader>ev :vsp %%
    nm <leader>et :tabe %%

    " emacs key bind
    im jj    <ESC>
    im <c-a> <HOME>
    im <c-e> <END>
    im <C-f> <Right>
    im <C-b> <Left>
    im <M-f> <S-Right>
    im <M-b> <S-Left>
    im <M-n> <Down>
    im <M-p> <Up>

    " Shortcuts
    " Change Working Directory to that of the current file
    cm cwd lcd %:p:h
    cm cd. lcd %:p:h

    cm <C-A> <Home>
    cm <C-E> <End>

    " For when you forget to sudo.. Really Write the file.
    cm w!! w !sudo tee % >/dev/null

    " Allow using the repeat operator with a visual selection (!)
    vm . :normal .<CR>
    vm < <gv
    vm > >gv

    " Stupid shift key fixes
    if has("user_commands")
        command! -bang Wa     wa<bang>
        command! -bang WA     wa<bang>
        command! -bang H       h<bang>
        command! -bang Q       q<bang>
        command! -bang QA     qa<bang>
        command! -bang Qa     qa<bang>
        command! -bang Tabe tabe<bang>
        command! -bang -nargs=* -complete=file E   e<bang> <args>
        command! -bang -nargs=* -complete=file W   w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
    endif
"}

" Plugins {

    " Misc {
        if isdirectory(expand("~/.vim/Plugged/matchit.zip"))
            let b:match_ignorecase = 1
        endif
    "}

    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels
        let gitroot = substitute(system('git rev-parse --show-toplevel'),
                    \ '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    "}

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    "}

    " LeaderF {
        let g:Lf_WildIgnore = {
                    \ 'dir': ['.svn','.git','.hg'],
                    \ 'file': ['*.jpg']
                    \}
    " }

    " NerdTree {
        if isdirectory(expand("~/.vim/Plugged/nerdtree"))
            let g:NERDShutUp=1
            "map <leader>e :NERDTreeFind<CR>
            nm  <leader>e :NERDTreeToggle<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$',
                        \ '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
            let NERDTreeChDirMode=0
            let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
        endif
    "}

    " Tabularize {
        if isdirectory(expand("~/.vim/Plugged/tabular"))
            nm <Leader>a&     : Tabularize /&<CR>
            vm <Leader>a&     : Tabularize /&<CR>
            nm <Leader>a=     : Tabularize /^[^=]*\zs=<CR>
            vm <Leader>a=     : Tabularize /^[^=]*\zs=<CR>
            nm <Leader>a=>    : Tabularize /=><CR>
            vm <Leader>a=>    : Tabularize /=><CR>
            nm <Leader>a:     : Tabularize / : <CR>
            vm <Leader>a:     : Tabularize / : <CR>
            nm <Leader>a::    : Tabularize / : \zs<CR>
            vm <Leader>a::    : Tabularize / : \zs<CR>
            nm <Leader>a,     : Tabularize /,<CR>
            vm <Leader>a,     : Tabularize /,<CR>
            nm <Leader>a,,    : Tabularize /,\zs<CR>
            vm <Leader>a,,    : Tabularize /,\zs<CR>
            nm <Leader>a<Bar> : Tabularize /<Bar><CR>
            vm <Leader>a<Bar> : Tabularize /<Bar><CR>
        endif
    "}

    " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        if isdirectory(expand("~/.vim/Plugged/sessionman.vim/"))
            nm <leader>sl :SessionList<CR>
            nm <leader>ss :SessionSave<CR>
            nm <leader>sc :SessionClose<CR>
        endif
    "}

    " Vimwiki {
        if isdirectory(expand("~/.vim/Plugged/vimwiki"))
            let g:vimwiki_camel_case = 0
            map <leader>a :VimwikiToggleListItem<CR>
            " diary map
            autocmd BufNewFile,BufRead *.wiki map <leader>m <ESC>ggO## <C-R>=strftime("%Y %m %d %A")<CR><ESC>
                            \ 3o<ESC>ggj^i<tab>
            if WINDOWS()
                let g:vimwiki_list = [{'path': 'D:\Dropbox\doc\vimwiki',
                            \"syntax": "markdown"}]
                cm cds cd  D:\project\source-code\<CR>
                cm dpb cd  D:\Dropbox\<CR>
            elseif OSX()
                let g:vimwiki_list = [{'path': '~/Dropbox/doc/vimwiki',
                            \"syntax": "markdown"}]
            endif
        endif
    "}

    " TagBar {
        if isdirectory(expand("~/.vim/Plugged/tagbar/"))
        endif
    "}

    " Rainbow {
        if isdirectory(expand("~/.vim/Plugged/rainbow/"))
            let g:rainbow_active = 1
            let g:rbpt_max = 16
            let g:rbpt_loadcmd_toggle = 0
            let g:rbpt_colorpairs = [
                    \ ['brown',       'RoyalBlue3'],
                    \ ['Darkblue',    'SeaGreen3'],
                    \ ['darkgray',    'DarkOrchid3'],
                    \ ['darkgreen',   'firebrick3'],
                    \ ['darkcyan',    'RoyalBlue3'],
                    \ ['darkred',     'SeaGreen3'],
                    \ ['darkmagenta', 'DarkOrchid3'],
                    \ ['brown',       'firebrick3'],
                    \ ['gray',        'RoyalBlue3'],
                    \ ['black',       'SeaGreen3'],
                    \ ['darkmagenta', 'DarkOrchid3'],
                    \ ['Darkblue',    'firebrick3'],
                    \ ['darkgreen',   'RoyalBlue3'],
                    \ ['darkcyan',    'SeaGreen3'],
                    \ ['darkred',     'DarkOrchid3'],
                    \ ['red',         'firebrick3'],
                    \ ]
        endif
    "}

    " markdow {
    let g:vim_markdown_folding_disabled = 1
    if WINDOWS()
        nm <leader>wl :e D:\Dropbox\code\log.md<CR>
    endif
    if OSX()
        nm <leader>wl :e ~/Dropbox/doc/log.md<CR>
    endif
    autocmd BufNewFile,BufRead *.md map <leader>m <ESC>ggO## <C-R>=strftime("%Y %m %d %A")<CR><ESC>
                \ 5o<ESC>ggj^i<tab>

    " }
    " Fugitive {
        if isdirectory(expand("~/.vim/Plugged/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gr :Gread<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
            nnoremap <silent> <leader>ge :Gedit<CR>
            nnoremap <silent> <leader>gi :Git add -p %<CR>
            nnoremap <silent> <leader>gg :SignifyToggle<CR>
        endif
    "}
    " FZF{
        if isdirectory(expand("~/.vim/Plugged/fzf.vim/"))
            nnoremap <silent> <c-p> :FZF<CR>
        endif
    "}

    " UndoTree {
        if isdirectory(expand("~/.vim/Plugged/undotree/"))
            nnoremap <Leader>u :UndotreeToggle<CR>
            " If undotree is opened, it is likely one wants to interact with it.
            let g:undotree_SetFocusWhenToggle=1
        endif
    "}

    " indent_guides {
        if isdirectory(expand("~/.vim/Plugged/vim-indent-guides/"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1
        endif
    "}

    " vim-airline {
        " Set configuration options for the statusline plugin vim-airline.
        " Use the powerline theme and optionally enable powerline symbols.
        " To use the symbols , , , , , , and .in the statusline
        " segments add the following to your .vimrc.before.local file:
        "   let g:airline_powerline_fonts=1
        " If the previous symbols do not render for you then install a
        " powerline enabled font.
        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if isdirectory(expand("~/.vim/Plugged/vim-airline-themes/"))
            let g:airline#extensions#tabline#show_buffers = 1
            let g:airline#extensions#tabline#tab_nr_type  = 1
            if !exists('g:airline_powerline_fonts')
                " Use the default set of separators with a few customizations
            endif
        endif
    "}

    " ultisnips {
        if isdirectory(expand("~/.vim/Plugged/ultisnips/"))
            " Trigger configuration.
            let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
            let g:UltiSnipsJumpBackwardTrigger = "<c-z>"

            " If you want :UltiSnipsEdit to split your window.
            let g:UltiSnipsEditSplit="vertical"
        endif
    "}
"}

" Functions {
    " Clean whitespace {
    function! DelTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    command! -bang -nargs=* DelTrailingWhitespace
                \ :call DelTrailingWhitespace(<bang> <args>)
    "}

    " Clean WhiteLines {
    function! DelWhiteLines()
        %g/^$/d
    endfunction
    command! -bang -nargs=* DelWhiteLines
                \ :call DelWhiteLines(<bang> <args>)
    "}

    "quick format multi line data for sql {
    function! FormatSqlData()
        silent! set ft=sql
        silent! %s/^\(.*\)$/'\1',/
        silent! 1 s/^/(/
        silent! $ s/,$/)/
        silent! noh
        silent! 1,$ y
    endfunction
    command! -bang -nargs=* FormatSqlData :call FormatSqlData(<bang> <args>)
    "}

    " highlight active windows {
    "if exists('+colorcolumn')
        "function! s:DimInactiveWindows()
            "for i in range(1, tabpagewinnr(tabpagenr(), '$'))
                "let l:range = ""
                "if i != winnr()
                    "if &wrap
                        "" HACK: when wrapping lines is enabled, we use the
                        "" maximum number " of columns getting highlighted.
                        "" This might get calculated by " looking for the longest
                        "" visible line and using a multiple of winwidth().
                        "let l:width=256
                    "else
                        "let l:width=winwidth(i)
                    "endif
                    "let l:range = join(range(1, l:width), ',')
                "endif
                "call setwinvar(i, '&colorcolumn', l:range)
            "endfor
        "endfunction
        "augroup DimInactiveWindows
            "au!
            "au WinEnter * call s:DimInactiveWindows()
            "au WinEnter * set cursorline
            "au WinLeave * set nocursorline
        "augroup END
    "endif
    "}

    " Cycle through relativenumber + number, number (only), and no numbering.
    function! CycleNumbering()
        if exists('+relativenumber')
            execute {
             \ '00': 'set norelativenumber   | set number',
             \ '01': 'set norelativenumber   | set number',
             \ '10': 'set relativenumber     | set number',
             \ '11': 'set norelativenumber   | set nonumber' }[&number . &relativenumber]
        else
            " No relative numbering, just toggle numbers on and off.
            set number!
        endif
    endfunction
    command! -bang -nargs=* CycleNumbering :call CycleNumbering(<bang> <args>)
    noremap <leader>tn :call CycleNumbering()<CR>

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

    function! ScreenFilename()
      if has('amiga')
        return "s:.vimsize"
      elseif has('win32')
        return $HOME.'\.cache\_vimsize'
      else
        return $HOME.'/.vimsize'
      endif
    endfunction

   function! ScreenRestore()
     " Restore window size (columns and lines) and position
     " from values stored in vimsize file.
     " Must set font first so columns and lines are based on font size.
     let f = ScreenFilename()
     if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
       let vim_instance =
                   \ (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
       for line in readfile(f)
         let sizepos = split(line)
         if len(sizepos) == 5 && sizepos[0] == vim_instance
           silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
           silent! execute "winpos ".sizepos[3]." ".sizepos[4]
           return
         endif
       endfor
     endif
   endfunction

   function! ScreenSave()
     " Save window size and position.
     if has("gui_running") && g:screen_size_restore_pos
         let vim_instance =
                   \ (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
         let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
                   \ (getwinposx()<0?0:getwinposx()) . ' ' .
                   \ (getwinposy()<0?0:getwinposy())
         let f = ScreenFilename()
         if filereadable(f)
             let lines = readfile(f)
             call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
             call add(lines, data)
         else
             let lines = [data]
         endif
         call writefile(lines, f)
     endif
   endfunction

   function! ToggleFullScreen()
       call SetAlpha(100)
       call SwitchVimTopMostMode()
       call libcall(g:MyVimLib, 'ToggleFullScreen', 1)
   endfunction
   command! -bang -nargs=* ToggleFullScreen :call ToggleFullScreen(<bang> <args>)

   function! SetAlpha(alpha)
       let g:VimAlpha = g:VimAlpha + a:alpha
       if g:VimAlpha < 180
           let g:VimAlpha = 180
       endif
       if g:VimAlpha > 255
           let g:VimAlpha = 255
       endif
       call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
   endfunction

   function! SwitchVimTopMostMode()
       if g:VimTopMost == 0
           let g:VimTopMost = 1
       else
           let g:VimTopMost = 0
       endif
       call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
   endfunction

   " toggle between working mode and presentation mode
   " borrowed from skalnik(https://github.com/skalnik)
   "
   " font size change only work for GUI-version Vim

   function! PresentationModeOn()
       colorscheme Tomorrow
       if has("gui_macvim")
           set guifont=Monaco:h25           " for Mac
       elseif has("gui_win32")
           set guifont=InputMono:h14,Menlo:h10,Consolas:h10,Courier_New:h10
       elseif has("gui_gtk")
           set guifont=Monospace\ 22        " for linux
       end
   endfunction

   function! PresentationModeOff()
       set bg=dark
       colorscheme hybrid
       if has('gui_macvim')
           set guifont=Monaco:h17           " for Mac
       elseif has("gui_win32")
           set guifont=InputMono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
       elseif has("gui_gtk")
           set guifont=Monospace\ 14        " for linux
       end
   endfunction

   function! TogglePresentationMode()
       if !exists('w:present')
           let w:present=0
       endif

       if w:present==0
           call PresentationModeOn()
           let w:present=1
       else
           call PresentationModeOff()
           let w:present=0
       endif
   endfunction
   map <leader>z :call TogglePresentationMode()<CR>
"}
