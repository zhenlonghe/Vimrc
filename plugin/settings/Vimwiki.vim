let g:vimwiki_camel_case = 0
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

map <leader>a :VimwikiToggleListItem<CR>


" diary map
:map <F2> <ESC>ggO· <C-R>=strftime("%Y %m %d %A")<CR><ESC>5o<ESC>ggJj^i<tab>
