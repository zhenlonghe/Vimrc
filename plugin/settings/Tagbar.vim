if (isMac)
  let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8/bin/ctags'
endif
nmap <leader>l :TagbarToggle<CR>
let g:tagbar_iconchars = ['▶', '▼']
let g:tagbar_iconchars = ['▾', '>']
let g:tagbar_iconchars = ['▷', '◢']
let g:tagbar_iconchars = ['▶', '◢']
