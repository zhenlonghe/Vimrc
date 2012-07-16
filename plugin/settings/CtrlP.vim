nnoremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max = 500
let g:ctrlp_use_caching = 1
let g:ctrlp_max_files = 0
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*  " Linux/MacOSX
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
