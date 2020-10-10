" Donald Wildeboer _vimrc file.
" TODO Clean this file up......
" There should be sections for different things IE settings, keyboard
" shortcuts, macros...

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Stuff I Added:
set guifont=Consolas:h12:cANSI
set ai  			" Auto-indent
set formatoptions=tcq		" This is what it used to be.
set formatoptions=tcqrowanlj	" Trying this out for a while it's a bit crazy.

"ft-syntax-omni
" This uses the current syntax highlighting for completion.  It can be used
" for any filetype and provides a minimal language-sensitive completion.
setlocal omnifunc=syntaxcomplete#Complete

" Save all files in one location so as not to leave files everywhere
" TODO check for directory %appdata%\Vim if it doesn't exist then create it.
set dir=%appdata%\Vim,%temp%,$TEMP,$TMP,~/tmp,/var/tmp,/tmp
set backupdir=%appdata%\Vim,%temp%,$TEMP,~/tmp,/var/tmp,/tmp
set undodir=%appdata%\Vim,%temp%,$TEMP,~/tmp,/var/tmp,/tmp
set undofile

" Location of Vim customized files (run time files) saved in Git repo.
set runtimepath+=%userprofile%/.vim/vimfiles,~/.vim/vimfiles

" "inclusive" means that the last character of the selection is included in an
" operation.  For example, when "x" is used to delete the selection.
set selection=exclusive

" When to start Select mode instead of Visual mode, when a selection is
" started.
set selectmode=key

set guioptions-=T	" Disable the tool bar.
set guioptions-=m	" Hide the menu bar
" keys to show the menu bar
map  <silent> <a-m> :set guioptions+=m<return>
imap <silent> <a-m> <esc>:set guioptions+=m<return>
map  <silent> <a-M> :set guioptions-=m<return>
imap <silent> <a-M> <esc>:set guioptions-=m<return>
"TODO Show the menu bar and pass the key in to values where it should be shown 
"this should be done for <a-f> <a-e> <a-t> <a-s> <a-b> <a-w> <a-p> <a-h> 

" TODO Hide the menu bar until Alt is pressed

" Enable spell checker
set spl=en_ca spell
set spell

" different background on line where cursor is
set cursorline
" set cursorcolumn
" specify when the last window has a status line
set laststatus=2
" Start Vim with a larger window
"au GUIEnter * winsize 116 55
au GUIEnter * set lines=48 columns=116

" String to put at the start of lines that have been wrapped.
let &showbreak = '+++ ' " was '… ' but it causes an Error when ran in prompt (it's not single width)
" display options for list mode
set listchars=eol:¶,tab:»\ ,trail:¬,extends:>,precedes:<,nbsp:º
" ¶»¬.?…º


" Set diff options
set diffopt=filler,icase,iwhite,context:3
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
endif
"update existing menu stuff to show shortcut keys defined in this file really 
aunmenu Tools.Diff.Update
inoremenu <script> &Tools.&Diff.&Update<tab>:diffupdate\ or\ F8  <C-O>:diffupdate<CR>
noremenu  <script> &Tools.&Diff.&Update<tab>:diffupdate\ or\ F8  :diffupdate<CR>
" Add diff stuff to menu
menu &Tools.&Diff.-Sep- :
inoremenu <script> &Tools.&Diff.&Diff\ current\ file<tab>:diffthis\ or\ F7  <C-O>:diffthis<CR>
noremenu  <script> &Tools.&Diff.&Diff\ current\ file<tab>:diffthis\ or\ F7  :diffthis<CR>
inoremenu <script> &Tools.&Diff.&UnDiff\ current\ file<tab>:diffoff  <C-O>:diffoff<CR>
noremenu  <script> &Tools.&Diff.&UnDiff\ current\ file<tab>:diffoff  :diffoff<CR>
inoremenu <script> &Tools.&Diff.To\ &Next\ change<Tab>]c  <C-O>]c
noremenu  <script> &Tools.&Diff.To\ &Next\ change<Tab>]c  ]c
inoremenu <script> &Tools.&Diff.To\ &Last\ change<Tab>[c  <C-O>[c
noremenu  <script> &Tools.&Diff.To\ &Last\ change<Tab>[c  [c


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
"TODO Make F7 show a diff menu tearoff
nmap <silent> <F7> :echo ":diffthis\t\t\tF7 Diff this current file."<CR>:diffthis<CR>
nmap <silent> <F8> :echo ":diffupdate\t\t\tF8 Update the diff."<CR>:diffupdate<CR>
"TODO turn F9 into a toggle!
nmap <silent> <F9> :set guioptions+=m<CR>:set guioptions+=T<CR>:echo ":set guioptions+=mT\t\tF9 Show menu and toolbar."<CR>
nmap <silent> <F10> :set guioptions-=m<CR>:set guioptions-=T<CR>:echo ":set guioptions-=mT\t\tF10 Hide menu and toolbar."<CR>


" Ctrl PageUp and PageDown zooms in and out with hardcoded settings
nmap <C-PageUp> :set guifont=Courier_New:h16:cANSI<CR>
nmap <C-PageDown> :set guifont=Courier_New:h9:cANSI<CR>
" TODO create CTRL-Scroll up and down to zoom font size in and out


" MAP SQL database thing 
" do an entire submit with F8
"
" NOTE: This is now done with \se   \=(comand key thing) s=(SQL) e=(Execute)
" 			 or   \sea  a=(all)
"
" map <f8> <esc>ggVG:DBExecVisualSQL<return>
" imap <f8> <esc>ggVG:DBExecVisualSQL<return>
" vmap <f8> :DBExecVisualSQL<return>


" Other
set cmdheight=2			" Make command line two lines high

set mousehide			" Hide the mouse when typing text
set mousemodel=popup_setpos	" Right mouse button action
set mouse=a 			" turn mouse on from command line TODO test that this is nice

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
  syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

" Text below the last line is darker grey
highlight NonText guibg=grey80

" Set highlight for selected text to be reversed with background
highlight clear Visual
highlight Visual 	cterm=inverse gui=inverse term=inverse

" dbext Connection Profiles
let g:dbext_default_profile_caisview = 'type=ASE:user=dowildeboer:passwd=changeme12:srvname=PRODVIEW_PLCOCAISYBG11:dbname=APF:bin_path=C:\sybase\OCS-12_5\bin'
let g:dbext_default_profile_ring2 = 'type=ORA:user=dwildebo:passwd=pleasechangeme:srvname=ring2:bin_path=C:\apps\Oracle\product\11.2.0\client_1\BIN'
let g:dbext_default_profile_PeopleSoft = 'type=ORA:user=dwildeboer:passwd=Wildeboer:srvname=PPS5:bin_path=C:\ORANT\BIN'

" Tooltips!
" Show folds if no folds show spelling corrections.
function! FoldSpellBalloon()
    let foldStart = foldclosed(v:beval_lnum )
    let foldEnd = foldclosedend(v:beval_lnum)
    let lines = []
    " Detect if we are in a fold
    if foldStart < 0
        " Detect if we are on a misspelled word
        let lines = spellsuggest( spellbadword(v:beval_text)[ 0 ], 6, 0 )
    else
        " we are in a fold
        let numLines = foldEnd - foldStart + 1
        " if we have too many lines in fold, show only the first 14 and the
        " last 14 lines
        if ( numLines > 31 )
            let lines = getline( foldStart, foldStart + 14 )
            let lines += [ '-- Snipped ' . ( numLines - 30 ) . ' lines --' ]
            let lines += getline( foldEnd - 14, foldEnd )
        else
            " less than 30 lines, lets show all of them
            let lines = getline( foldStart, foldEnd )
        endif
    endif
    " return result
    return join( lines, has( "balloon_multiline" ) ? "\n" : " " )
endfunction
set balloonexpr=FoldSpellBalloon()
set ballooneval
set balloondelay=400
 
" Use the increment.vim plugin to increment the numbers
vnoremap <c-i> :Inc<CR>

" When a file has been detected to have been changed outside of Vim and it has
" not been changed inside of Vim, automatically read it again.
set autoread

" Change the way text is displayed.  This is comma separated list of
"	flags:
"	lastline	When included, as much as possible of the last line
"			in a window will be displayed.  When not included, a
"			last line that doesn't fit is replaced with "@" lines.
"	uhex		Show unprintable characters hexadecimal as <xx>
"			instead of using ^C and ~C.
set display=lastline,uhex
set winminheight=0

" Shift-tab to unindent the current line one tab stop.
" NOTE this messes with autotab completion
" imap <S-Tab> <C-o><<

" A granular approach to managing sessions:
" Session Save As saves the open files and prefills the command line with the
" command to save the current session in a ~/sessions/ directory. All you need
" to do is enter a name and hit <Enter>.
nmap SSA :wa<CR>:mksession! ~/sessions/

" Session Open also saves the open files, then prefills the command line with
" the command to load a session file. Just type the name of the session you
" want to load and hit <Enter>.
nmap SO :wa<CR>:so ~/sessions/


" vim: backupcopy=yes: nobackup:
