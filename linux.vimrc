" Custom .vimrc for Chloe

" Use mouse, this is very handy. (and not lol)
set mouse=a

"ft-syntax-omni
" This uses the current syntax highlighting for completion.  It can be used
" for any filetype and provides a minimal language-sensitive completion.
setlocal omnifunc=syntaxcomplete#Complete

" Enable spell checker
set spl=en_ca spell
set spell

" different background on line where cursor is
set cursorline

" Tab page stuff Arrow Keys
" Doesn't work through Cockpit
" TODO Test through Putty
map  <silent> <a-up> :tabnew<return>
imap <silent> <a-up> <esc>:tabnew<return>
map  <silent> <a-n> :tabnew<return>
imap <silent> <a-n> <esc>:tabnew<return>

map  <silent> <a-right> :tabnext<return>
imap <silent> <a-right> <esc>:tabnext<return>
map  <silent> <a-left> :tabprevious<return>
imap <silent> <a-left> <esc>:tabprevious<return>

" L and H
map  <silent> <a-l> :tabnext<return>
imap <silent> <a-l> <esc>:tabnext<return>
"Conflicts with Help Menu
map  <silent> <a-h> :tabprevious<return>
imap <silent> <a-h> <esc>:tabprevious<return>

" J and K
map  <silent> <a-j> :tabnext<return>
imap <silent> <a-j> <esc>:tabnext<return>
map  <silent> <a-k> :tabprevious<return>
imap <silent> <a-k> <esc>:tabprevious<return>

" Ctrl-Shift u for uppercase the selection (like in SAS)
vmap <C-S-U> U
" Ctrl-Shift l for lowercase the selection (like in SAS)
vmap <C-S-L> u

" only move one line even when line is wrapped
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" In insert mode jk will be escape key and return you to normal mode.
:inoremap jk <esc>l

" <F> Key Mappings (Description in the echo statement.)
nmap <silent> <F2> :echo ":set list!\t\t\tF2 Display all characters."<CR>:set list!<CR>
nmap <silent> <F3> :echo ":set number!\t\t\tF3 Toggle Line Numbering."<CR>:set number!<CR>
nmap <silent> <F4> :echo ":set relativenumber!\t\tF4 Toggle Relative Line Numbering."<CR>:set relativenumber!<CR>
nmap <silent> <F5> :echo ":copen\t\t\t\tF5 Open the Error Window."<CR>:copen<CR>
nmap <silent> <F6> :Explore<CR>:echo ":Explore\t\t\tF6 Explore filesystem."<CR>
nmap <silent> <F7> :echo ":diffthis\t\t\tF7 Diff this current file."<CR>:diffthis<CR>
nmap <silent> <F8> :echo ":diffupdate\t\t\tF8 Update the diff."<CR>:diffupdate<CR>

set cmdheight=2		" Make command line two lines high
set winminheight=0	" set window minimum height = 0

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.
set autoread

