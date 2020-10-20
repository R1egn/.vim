" Donald Wildeboer _vimrc file.
" TODO Clean this file up......
" There should be sections for different things IE settings, keyboard
" shortcuts, macros...

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Stuff I Added:
set ai  			" Auto-indent
set formatoptions=crqwanlj	" autowrap comments, use gq
set gdefault			" ":substitute" flag 'g' is on by default. WARNING can break plugins.
set showmatch 			" jump to the matching bracket
" TODO fix indentkeys especially for SAS 

" Set font. This is very system dependant.
if has("gui_running")
    if has("gui_win32") || has("gui_win64")
	set guifont=Consolas:h12:cANSI:qCLEARTYPE
	set renderoptions=type:directx
	" Ctrl PageUp and PageDown zooms in and out with hard-coded settings
	nmap <C-PageUp> :set guifont=Courier_New:h16:cANSI:qCLEARTYPE<CR>
	nmap <C-PageDown> :set guifont=Courier_New:h9:cANSI:qCLEARTYPE<CR>
	" TODO create CTRL-Scroll up and down to zoom font size in and out 1 size at a time
    elseif has("x11")  " Also for GTK 1
	:set guifont=Source\ Code\ Pro\ 12
	nmap <C-PageUp> :set guifont=Source\ Code\ Pro\ 16<CR>
	nmap <C-PageDown> :set guifont=Source\ Code\ Pro\ 10<CR>
    elseif has("gui_gtk2") || has("gui_gtk3")
	:set guifont=Luxi\ Mono\ 12
    endif
endif

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

" When to start Select mode instead of Visual mode, when a selection is started.
set selectmode=key

" Hide menu by default Alt-?. Show & hide with F9, F10.
set guioptions+=k		" Keep the GUI window size when adding/removing a scrollbar
set guioptions-=T		" Disable the tool bar.
set guioptions-=m		" Hide the menu bar
set mousefocus			" window under mouse on gets focus switched with <F9>/<F10>
" Show the menu bar and pass the key in to values where it should be shown for 
" <a-f> <a-e> <a-t> <a-s> <a-b> <a-w> <a-p> <a-h>
for i in ["f","e","t","s","b","w","p","h"]
	" TODO figure out how open the menu on the first press
	" TODO remove the toupper(i) when figured out to open menu
    exec "map  <a-" . i . "> <F9><a-" . toupper(i) . ">"
    exec "imap <a-" . i . "> <F9><a-" . toupper(i) . ">"
endfor


" different background on line where cursor is
set cursorline
" set cursorcolumn
" specify when the last window has a status line
set laststatus=2
set statusline=%([%M]\ \ %)%f\ \ [%n%R%W%Y]\ %=%<%(\ %-20a%)%(\ %-20{fugitive#statusline()}%)%(\ %-20q%)\ %<%-14.(%l,%c%V%)\ %P'
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
" NOTE here for handy reference: To tell Git to always use Vimdiff, issue the 
" following commands:
" git config --global diff.tool vimdiff
" git config --global merge.tool vimdiff
" git config --global difftool.prompt false


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
nmap <silent> <F9> :set guioptions+=mT<CR>:set nomousefocus<CR>:echo ":set guioptions+=mT\t\tF9 Show menu and toolbar."<CR>
nmap <silent> <F10> :set guioptions-=mT<CR>:set mousefocus<CR>:echo ":set guioptions-=mT\t\tF10 Hide menu and toolbar."<CR>
" TODO F11 could be full screen toggle.
" TODO Clean up F12
nmap <silent> <F12> :NERDTreeToggle<CR><C-w>n:0Git<CR>:echo "Open :Git NERDTree windows. Only really works for one press."<CR>


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
if !exists("syntax_on")
  syntax on			" Switch on syntax highlighting
endif
set hlsearch			" Switch on search pattern highlighting.
" Text below the last line is darker grey
highlight NonText guibg=grey80
highlight clear Visual		" select text highlight reversed with background
highlight Visual 	cterm=inverse gui=inverse term=inverse

" dbext Connection Profiles
"let g:dbext_default_profile_caisview = 'type=ASE:user=dowildeboer:passwd=changeme12:srvname=PRODVIEW_PLCOCAISYBG11:dbname=APF:bin_path=C:\sybase\OCS-12_5\bin'
let g:dbext_default_profile_ring2 = 'type=ORA:user=dwildebo:passwd=pleasechangeme:srvname=ring2:bin_path=C:\apps\Oracle\product\11.2.0\client_1\BIN'
" TODO add the other databases
"let g:dbext_default_profile_PeopleSoft = 'type=ORA:user=dwildeboer:passwd=Wildeboer:srvname=PPS5:bin_path=C:\ORANT\BIN'

" Tooltips!
" Show folds if no folds show spelling corrections. TODO add other?
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
 
set spl=en_ca spell	" Enable spell checker
set spell
" TODO Change the spell checker options in the right click menu. It's way to 
" easy to accidentally add misspellings. See :help popup-menu

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

" Shift-tab to unindent the current line one tab stop.  NOTE this messes with 
" autotab completion. TODO fix perhaps only do it when there is text selected?
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
