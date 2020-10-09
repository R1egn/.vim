" Bethel Website Code Cleanup Macro:

" Old Macro: FROM _viminfo 2009
"c	CHAR	0
"	:%s/\(\s\)\s\+/\1/g:%s/<\/\=font.\{-}>//g

" Open new window.
" :new

" Paste: from OS clipboard register *
echo "Pasting HTML from clipboard."
echo " "
:normal "*P
echo " "

" Filetype: Show HTML syntax.
:set filetype=html

echo "Convert non breaking spaces into normal spaces."
:%s/&nbsp;/ /gei
echo " "

echo "Remove font, spans, img, ul, br, office name space (<o:...>), table tags."
:%s/<\/\=\(font\|span\|div\|img\|ul\|br\|\a:\|table\|tbody\|tr\|td\)\_.\{-}>//gei
echo " "

echo "Change: <p junk> to <p>"
:%s/<\/\=\(p\|h\d\|b\|i\)\_s\_.\{-}>/<\1>/gei
echo " "

echo "Remove empty tag groups (They can be nested so run a few times)."
for i in range(1, 5)  " Repeat 5 times.
	:%s/<\(\w\+\)\_s\{-}>\_s*<\/\1\_s*>//gei
endfor
echo " "

" TODO echo "Remove line thingy: code <HBR> or something?"

" TODO echo "Auto Clean: any code?"

" echo Remove Multiple Blank Lines: (Optional) - reduce multiple blank lines to a single blank"
" :g/^$/,/./-j

echo "Remove multiple spaces and blank lines."
:%s/\(\_s\)\_s\+/\1/gei
echo " "

" TODO echo Copy: into OS clipboard register *.
echo "Cutting HTML back into clipboard."
echo " "
:normal ggVG"*ydG
echo " "

" Close the window.
:q!

" vim: sts=2: sw=2: filetype=vim: 
