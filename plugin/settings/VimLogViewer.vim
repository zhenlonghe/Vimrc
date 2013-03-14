" Log viewer like edit++ or other GUI editing tools
" Last Change:	2012 09 03 
" Maintainer:	danguria <danguria@gmail.com>
" License:	This file is placed in the public domain.
" ChangeList: 2012.9.3 : syntax clear를 syntax on으로 수정
" Bug: 1. 리스트에 단어 추가후, set ft=filetype 하면 syntax 날라감(워드리스트에는
" 남아 있음)

if exists("g:loaded_QuickLogHighlighter")
    finish
endif
let g:loaded_QuickLogHighlighter = 1

let s:save_cpo = &cpo
set cpo&vim


map ,1 :call AddWordToList(expand("<cword>"), 'FG1')<cr>
map ,2 :call AddWordToList(expand("<cword>"), 'FG2')<cr>
map ,3 :call AddWordToList(expand("<cword>"), 'FG3')<cr>
map ,4 :call AddWordToList(expand("<cword>"), 'FG4')<cr>
map ,5 :call AddWordToList(expand("<cword>"), 'FG5')<cr>
map ,6 :call AddWordToList(expand("<cword>"), 'FG6')<cr>
" a text highlighting style that always stands out...
"highlight STANDOUT gui=bold
"highlight STANDOUT guibg=lightblue 

" let fg_colors = {   'FG1': '#880015', 'FG2': '#f25c62', 'FG3': '#ff7f27', 'FG4': '#ffc90e', 'FG5': '#fff648', 'FG6': '#22b14c', 'FG7': '#06a2e8', 'FG8': '#454ece', 'FG9': '#a349a4' } 
hi FG1	guifg=#880015 ctermfg=green
hi FG2	guifg=#f25c62 ctermfg=darkgreen
hi FG3	guifg=#ff7f27 ctermfg=red
hi FG4	guifg=#ffc90e ctermfg=yellow
hi FG5	guifg=#fff648 ctermfg=darkyellow
hi FG6	guifg=#22b14c ctermfg=blue
" Build a Vim command to match troublesome words...
function! s:MatchWords()

    exec "syn on"
    for key in keys(w:dic_words)

	let a:words = w:dic_words[key]
	let a:words_matcher = 'syn match '. key . '  /\c\<\(' . join(a:words, '\|') . '\)\>/'
	exec a:words_matcher
    endfor
endfunction

" Toggle word checking on or off...
" TODO: change to ToggleMatch()
" function! TWordCheck()
    "Toggle the flag (or set it if it doesn't yet exist)...
 "    let w:check_words = exists('w:check_words') ? !w:check_words : 1

    " Turn match mechanism on/off, according to new state of flag ...
  "   if w:check_words
" 	call s:MatchWords()
 "    else
" 	match none
 "    endif 
" endfunction

function! AddWordToList(word, fg_color)

    if !exists('w:dic_words')
	let w:dic_words = {'FG1':[], 'FG2':[],'FG3':[],'FG4':[],'FG5':[],'FG6':[]}
    endif

    for key in keys(w:dic_words)

	if key == a:fg_color
       continue 
	endif
	
	let a:word_list = w:dic_words[key]
	let a:idx = index(a:word_list, a:word)
	if -1 != a:idx
	    call remove(a:word_list, a:idx)
	    break
	endif

    endfor

    let a:words = w:dic_words[a:fg_color]

    let a:idx = index(a:words, a:word)
    if -1 == a:idx
	call add(a:words, a:word)
    else
	call remove(a:words, a:idx)
    endif
    
    call s:MatchWords()
endfunction



" nmap <silent> ;p :call WordCheck()<cr>

" search the current cursor position from all buffers.
"-------------------------------------------------------------------------------------------------------
"  functions about searching.
"-------------------------------------------------------------------------------------------------------
function! SearchCursorFromAllBuffer()
    let st = expand("<cword>")
    call setqflist([]) 
    exe "bufdo vimgrepadd /".st."/j %" 
endfunction 

" search the pattern from all buffers
function! SearchPatternFromBuffer(pattern) 
    call setqflist([]) 
    exe "bufdo vimgrepadd /".a:pattern."/j %" 
endfunction 

" search the pattern from current buffers
function! SearchPatternFromCurrentBuffer(pattern) 
    call setqflist([]) 
    exe "vimgrep /".a:pattern."/j %" 
endfunction 

" search the current cursor position from current buffers(add to list).
function! SearchCursorFromCurrentBufferAddToList()
    let st = expand("<cword>")
    "call setqflist([]) 
    exe "vimgrepadd /".st."/j %" 
endfunction 

" search the current cursor position from current buffers(erase old list).
function! SearchCursorFromCurrentBufferEraseOldList()
    let st = expand("<cword>")
    call setqflist([]) 
    exe "vimgrep /".st."/j %" 
endfunction 

function! TTest()
    let dic1 = {'filename' : 'test.java', 'lnum' : '1'}
    let list = [dic1]
    call setqflist(list)
endfunction
command! -nargs=1 Search :call SearchPatternFromCurrentBuffer(<q-args>) 
command! -nargs=1 SearchAll :call SearchPatternFromAllBuffer(<q-args>) 
nmap ,f :call SearchCursorFromCurrentBufferEraseOldList()<cr>
nmap ,F :call SearchCursorFromCurrentBufferAddToList()<cr>
nmap ,c :call setqflist([])<cr>
nmap ,t :call TTest()<cr>


let &cpo = s:save_cpo
