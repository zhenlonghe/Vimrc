let g:ackprg="ack-grep -H --nocolor --nogroup --column"
if executable("ack")
  noremap FF :Ack<SPACE>
else
  noremap FF :echo "Sorry, you need to install ack first!"<CR>
endif
