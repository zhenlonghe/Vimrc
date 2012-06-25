"---------------------------------------------------------------------------
"    Description:  Programming Automation
"    Author:       ywgx.ch@gmail.com
"    Created:      2011/11/22 00:33:31
"    License:      GPL v2.0
"    Version:      2.1
"---------------------------------------------------------------------------
se nocp exrc
se nu is cin smd wmnu magic
im  ,, <ESC>
im  ;; <ESC>
map<Up>   gk
map<Down> gj
no!<M-k> <Up>
no!<M-j> <Down>
no!<M-h> <Left>
no!<M-l> <Right>
nm<silent> ;; :q!<CR>
nm<silent> ,, :wq<CR>
au BufRead,BufNewFile *.html setf html
au FileType python,ruby,sh :call Py()
au FileType cpp,c,cc,h,html,perl :call Cc()
au FileType c,cc,cpp,h,html,python :call Cp()
fu Cp()
        ino , ,<SPACE>
	ino ; ;<SPACE>
	ino <= <SPACE><=<SPACE>
	ino *= <SPACE>*=<SPACE>
	ino /= <SPACE>/=<SPACE>
	ino >> <SPACE>>><SPACE>
	ino << <SPACE><<<SPACE>
	ino >= <SPACE>>=<SPACE>
	ino == <SPACE>==<SPACE>
	ino += <SPACE>+=<SPACE>
	ino && <SPACE>&&<SPACE>
endf
fu Py()
	nm mm :call Ct()<CR>
	im mm <ESC>$
	im nn <ESC>o
	im <F2> <ESC>
	if exists("$DISPLAY")
		nm <F2> :call Cv()<CR>
	el
		nm <F2> :call Ct()<CR>
	en
endf
fu Cc()
	no != <SPACE>!=<SPACE>
    im mm <ESC>A;<ESC>
	im nn <ESC>A;<ESC>o
	if exists("$DISPLAY")
		if &filetype == 'perl'
		   nm mm :call Ct()<CR>
		   nm<F2> :call Cv()<CR>
		   im<F2> <ESC> :call Cv()<CR>
	    el
		   nm mm :call Ct()<CR><CR>
		   nm mm :call Ct()<CR><CR>
		   nm<F2> :call Cv()<CR><CR>
		   im<F2> <ESC> :call Cv()<CR><CR>
		en
	el
		nm<F2> :call Ct()<CR>
		im<F2> <ESC> :call Ct()<CR>
		nm mm :call Ct()<CR>
	en
endf
fu Cv()
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!clear;./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!clear;python %"
	elsei &filetype == 'ruby'
		exe "!clear;ruby  %"
	elsei &filetype == 'sh'
		exe "!clear;bash %"
	elsei &filetype == 'perl'
		exe "!clear;perl %"
	en
endf
fu Ct()
	exe "w"
	if &filetype == 'c'
		exe "!gcc -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'cpp'
		exe "!g++ -Wall % -o %<"
		exe "!./%< 2>/dev/null && rm -f %<"
	elsei &filetype == 'python'
		exe "!python %"
	elsei &filetype == 'ruby'
		exe "!ruby  %"
	elsei &filetype == 'sh'
		exe "!bash %"
	elsei &filetype == 'perl'
		exe "!perl %"
	elsei &filetype =='html'
		exe "!firefox %"
	en
endf
au FileType h,c,cc,cpp,sh,perl,python :call YWcode()
fu YWcode()
	se ai si
	se sw=4 ts=4 sts=4
endf
au FileType ruby :call YWruby()
fu YWruby()
	se ai si
	se sw=2 ts=2 sts=2
endf
