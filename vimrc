"------------------------------------------------------------------------------
"    Description  : zhenlong's vimrc
"    Author       : zhenlonghe@gmail.com
"    License      : GPL v2.0
"    Organization :
"                   Environment
"                   General
"                   Vim UI
"                   GUI Settings
"                   Formatting
"                   Key (re)Mappings
"                   Plugins
"                   Functions
"------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'enricobacis/vim-airline-clock'
Plug 'terryma/vim-multiple-cursors'
Plug 'sjl/gundo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/matchit.zip'
Plug 'pelodelfuego/vim-swoop'
Plug 'vim-scripts/SearchComplete'
Plug 'gaving/vim-sqlcase'
Plug 'itchyny/calendar.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vimwiki/vimwiki'
Plug 'luochen1990/rainbow'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-scripts/taglist.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-repeat'
Plug 'vimcn/vimcdoc'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf'
Plug '~/autocmds'
" Colorsheme {
Plug 'c9s/colorselector.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'w0ng/vim-hybrid'
Plug 'joshdick/onedark.vim'
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
    set background=dark                 " Assume a dark background
    syntax on                           " Syntax highlighting
    filetype plugin indent on           " Automatically detect file types.
    set mouse=a                         " Automatically enable mouse usage
    set mousehide                       " Hide the mouse cursor while typing
    set encoding=utf-8
    scriptencoding utf-8
    set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,gbk,euc-kr,utf-bom
    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

    set shortmess+=filmnrxoOtT          " Abbrev. of messages
    set viewoptions=folds,options,cursor,unix,slash
                                        " Better Unix / Windows compatibility
    set hidden                          " Allow buffer switching without saving
    set ttyfast                         " send more chars while redrawing
    set iskeyword-=.                    " '.' is an end of word designator
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

    " Setting up the directories {
        set backup
        set backupdir=~/.cache/backup
        set directory=~/.cache/backup
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
    color Tomorrow-Night                " Load a colorscheme

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
    set foldenable                      " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
                                        " Highlight problematic whitespace
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
            color Tomorrow-Night
            set guifont=InputMono:h9,Menlo:h10,Consolas:h10,Courier_New:h10
            "set guifontwide=YouYuan:h10:cGB2312
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
            autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
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

    autocmd BufNewFile,BufRead *.sop    set filetype=c
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
"}

" Key (re)Mappings {
    let mapleader   = ","
    let g:mapleader = ","

    " remap vim 0
    nm 0 ^
    nm j gj
    nm k gk
    nm Y y$

    " c-j,k for buffer switch
    nm <c-j> :bn<cr>
    nm <c-k> :bp<cr>
    nm <tab> <c-w>w

    nm <leader>ff  :call ToggleFullScreen()<cr>
    nm <s-r> :call SwitchVimTopMostMode()<cr>
    nm <s-w> :call SetAlpha(-10)<cr>
    nm <s-e> :call SetAlpha(10)<cr>


    " Code folding options
    nm <leader>f0 :set foldlevel=0<CR>
    nm <leader>f1 :set foldlevel=1<CR>
    nm <leader>f2 :set foldlevel=2<CR>
    nm <leader>f3 :set foldlevel=3<CR>
    nm <leader>f4 :set foldlevel=4<CR>
    nm <leader>f5 :set foldlevel=5<CR>
    nm <leader>f6 :set foldlevel=6<CR>
    nm <leader>f7 :set foldlevel=7<CR>
    nm <leader>f8 :set foldlevel=8<CR>
    nm <leader>f9 :set foldlevel=9<CR>

    nm <silent> <leader>/ :nohlsearch<CR>

    " time & date map
    nm <leader>da "=strftime("%y%m%d")<cr>p"
    nm <leader>ti "=strftime("%h:%m:%s")<cr>p"

    " quick open vimrc in a new tab
    nm <leader>v  :e $MYVIMRC<cr>
    nm <leader>s  :source $MYVIMRC<cr>
    nm <leader>0  :e ~/.vim/README.md<cr>

    " mouse
    nm <leader>sv :set mouse=v<cr>
    nm <leader>sa :set mouse=a<cr>

    nm <leader>w      :w !sudo tee %<cr>
    nm <leader>q      :bd!<cr>
    nm <space>w       :w<cr>
    nm <space>c       :qa!<cr>
    nm <space><space> :bd<cr>

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
        if isdirectory(expand("~/.vim/Plugged/nerdtree"))
            let g:NERDShutUp=1
        endif
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

    " NerdTree {
        if isdirectory(expand("~/.vim/Plugged/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

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
            nmap <Leader>a&     : Tabularize /&<CR>
            vmap <Leader>a&     : Tabularize /&<CR>
            nmap <Leader>a=     : Tabularize /^[^=]*\zs=<CR>
            vmap <Leader>a=     : Tabularize /^[^=]*\zs=<CR>
            nmap <Leader>a=>    : Tabularize /=><CR>
            vmap <Leader>a=>    : Tabularize /=><CR>
            nmap <Leader>a:     : Tabularize / : <CR>
            vmap <Leader>a:     : Tabularize / : <CR>
            nmap <Leader>a::    : Tabularize / : \zs<CR>
            vmap <Leader>a::    : Tabularize / : \zs<CR>
            nmap <Leader>a,     : Tabularize /,<CR>
            vmap <Leader>a,     : Tabularize /,<CR>
            nmap <Leader>a,,    : Tabularize /,\zs<CR>
            vmap <Leader>a,,    : Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> : Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> : Tabularize /<Bar><CR>
        endif
    "}

    " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        if isdirectory(expand("~/.vim/Plugged/sessionman.vim/"))
            nmap <leader>sl :SessionList<CR>
            nmap <leader>ss :SessionSave<CR>
            nmap <leader>sc :SessionClose<CR>
        endif
    "}

    " Vimwiki {
        if isdirectory(expand("~/.vim/Plugged/vimwiki"))
            let g:vimwiki_camel_case = 0
            map <leader>a :VimwikiToggleListItem<CR>
            " diary map
            if WINDOWS()
                let g:vimwiki_list = [{'path': 'D:\vimwiki',
                            \"syntax": "markdown"}]
                map <leader>m <ESC>ggO## <C-R>=strftime("%Y %m %d %A")<CR><ESC>
                            \ 5o<ESC>ggJj^i<tab>
                map <leader>wl :e D:\vimwiki\WorkLog.wiki<CR>
            endif
        endif
    "}

    " ctrlp {
        if isdirectory(expand("~/.vim/Plugged/ctrlp.vim/"))
            let g:ctrlp_working_path_mode = 'ra'
            let g:ctrlp_cmd = 'CtrlPMRU'
            nnoremap <silent> <D-t> :CtrlP<CR>
            nnoremap <silent> <D-r> :CtrlPMRU<CR>
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            " On Windows use "dir" as fallback command.
            elseif WINDOWS()
                let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif
            if exists("g:ctrlp_user_command")
                unlet g:ctrlp_user_command
            endif
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files .
                    \    --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }

            if isdirectory(expand("~/.vim/Plugged/ctrlp-funky/"))
                " CtrlP extensions
                let g:ctrlp_extensions = ['funky']

                "funky
                nnoremap <Leader>fu :CtrlPFunky<Cr>
            endif
        endif
    "}

    " TagBar {
        if isdirectory(expand("~/.vim/Plugged/tagbar/"))
            nnoremap <silent> <leader>tt :TagbarToggle<CR>
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

    " fugitive  {
        if isdirectory(expand("~/.vim/Plugged/vim-fugitive/"))
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
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
    if exists('+colorcolumn')
        function! s:DimInactiveWindows()
            for i in range(1, tabpagewinnr(tabpagenr(), '$'))
                let l:range = ""
                if i != winnr()
                    if &wrap
                        " HACK: when wrapping lines is enabled, we use the
                        " maximum number " of columns getting highlighted.
                        " This might get calculated by " looking for the longest
                        " visible line and using a multiple of winwidth().
                        let l:width=256
                    else
                        let l:width=winwidth(i)
                    endif
                    let l:range = join(range(1, l:width), ',')
                endif
                call setwinvar(i, '&colorcolumn', l:range)
            endfor
        endfunction
        augroup DimInactiveWindows
            au!
            au WinEnter * call s:DimInactiveWindows()
            au WinEnter * set cursorline
            au WinLeave * set nocursorline
        augroup END
    endif
    "}

    " Cycle through relativenumber + number, number (only), and no numbering.
    function! CycleNumbering()
        if exists('+relativenumber')
            execute {
             \ '00': 'set relativenumber   | set number',
             \ '01': 'set norelativenumber | set number',
             \ '10': 'set norelativenumber | set nonumber',
             \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
        else
            " No relative numbering, just toggle numbers on and off.
            set number!
        endif
    endfunction
    command! -bang -nargs=* CycleNumbering :call CycleNumbering(<bang> <args>)
    noremap <space>tn :call CycleNumbering()<CR>

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
"}
