" Same as SAS defaults
set ts=4
set sts=4
set sw=4
set noexpandtab

" SAS general statements {{{1

" find previous by statement and copy it
iabbrev by; <bygroupinghere><C-O>mb<HOME><C-O>?by <return><C-O>v/;<RETURN>ly<C-O>/<bygroupinghere><RETURN><C-O>vf>p
" TODO fix this to actually search
iabbrev data; data;<RETURN>set ;<RETURN><bygroupinghere><C-O>mb<HOME><C-O>?by <return><C-O>v/;<RETURN>ly<C-O>/<bygroupinghere><RETURN><C-O>vf>p<HOME><C-O>2<UP><C-O>4<RIGHT>


iabbrev set; set;<LEFT>
iabbrev merge; merge;<LEFT>
iabbrev keep; keep;<LEFT>
iabbrev drop; drop;<LEFT>


" SAS SQL {{{1
"
abbreviate procsql; proc sql;<CR><BS>CREATE TABLE AS<CR><TAB>SELECT <CR>FROM <CR>LEFT JOIN <CR><TAB>ON <CR><BS>WHERE <CR>GROUP BY <CR>HAVING <CR>ORDER BY <CR>;<CR><BS>quit;<UP><UP><UP><UP><UP><UP><UP><UP><UP><UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>

abbreviate createtable CREATE TABLE AS<CR><TAB>SELECT <CR>FROM <CR>LEFT JOIN <CR><TAB>ON <CR><BS>WHERE <CR>GROUP BY <CR>HAVING <CR>ORDER BY <CR>;<CR><c-o>11<UP><c-o>13<RIGHT>
abbreviate CREATETABLE CREATE TABLE AS<CR><TAB>SELECT <CR>FROM <CR>LEFT JOIN <CR><TAB>ON <CR><BS>WHERE <CR>GROUP BY <CR>HAVING <CR>ORDER BY <CR>;<CR><c-o>11<UP><c-o>13<RIGHT>

abbreviate SELECT* SELECT *<CR>FROM <table><CR>LEFT JOIN <CR><TAB>ON <CR><BS>WHERE <CR>GROUP BY <CR>HAVING <CR>ORDER BY <CR>;<CR><c-o>8<UP><END>
abbreviate select* SELECT *<CR>FROM <table><CR>LEFT JOIN <CR><TAB>ON <CR><BS>WHERE <CR>GROUP BY <CR>HAVING <CR>ORDER BY <CR>;<CR><c-o>8<UP><END>

abbreviate DROPTABLE DROP TABLE;<CR>DROP TABLE ;<UP><LEFT>

" SAS procs {{{1
"
abbreviate procsort; proc sort data = sortseq=linguistic(numeric_collation=on);<return>by ;<c-o><Up><c-o>0<c-o>16<Right>
abbreviate proctranspose; proc sort data =; by ;<CR>proc transpose out = <dataset> ( drop = _: );<CR>by ;<c-o>==<END><CR>id ;<CR>idlabel ;<CR>var ;<CR><BS>run;<c-o>6<UP><c-o>12<RIGHT>
abbreviate procsummary; proc summary data =;<CR>output out = <dataset> ( drop = _TYPE_ ) sum=;<CR>by ;<CR>var ;<CR>run;<c-o>4<UP><c-o>15<RIGHT>

abbreviate procformat; proc format;<CR>value<field><CR><TAB>.             = ""<CR>low - -0.0001 = ""<CR>0.0 - 0.0     = ""<CR>0.0001 - 0.5  = ""<CR>0.5001 - 1.0  = ""<CR>1.0001 - high = ""<CR>;<CR>run;<CR><c-o>9<UP><c-o>2w
abbreviate procexport; proc export data = <dataset> dbms = excel replace <CR>outfile = "&outdir. - &sdate..xls";<CR><BS>run;<CR><c-o>3<UP><c-o>4w<left><c-o>
abbreviate class; class / order = formatted;<c-o>20<LEFT>

" My Custom SAS Macros {{{1
"
abbreviate %export( /* xls {{{2 */<CR>%export(, "&outdir. - &sdate..xls" );<c-o>28<LEFT>
abbreviate %createlocaltable( %createlocaltable( table = '' );<c-o>4<LEFT><c-o>
abbreviate %clt( %createlocaltable( table = '' );<c-o>4<LEFT><c-o>

" SAS Macros {{{1
"
" %if %then macro
abbreviate ifthenm %if [] EQ [] %then %do;<CR><CR>%end; %else %do;<CR><CR>%end;<c-o>4<UP>


" SAS Logical {{{1
"
abbreviate if( if then do;<CR> <BS><CR>end; else do;<CR><TAB><CR> <BS>end;<c-o>4<UP><LEFT><LEFT>
abbreviate ifdo if then do;<CR> <BS><CR>end; else do;<CR><TAB><CR> <BS>end;<c-o>4<UP><LEFT><LEFT>
abbreviate ifthen if then do;<CR> <BS><CR>end; else do;<CR><TAB><CR> <BS>end;<c-o>4<UP><LEFT><LEFT>
abbreviate thendo; then do;<CR><Tab><CR>end;<UP><left>
abbreviate elsedo; else do;<CR><Tab><CR>end;<UP><left>

abbreviate select( select( );<CR><TAB>when(  ) do;<CR><TAB><CR>en;d<c-o>x<c-o>P<CR>when(  ) do;<CR><TAB><CR>en;d<c-o>x<c-o>P<CR>otherwise do;<CR><TAB><CR>en;d<c-o>x<c-o>P<CR>end;  /*end select*/<c-o>10<UP><c-o>2<LEFT>

" SAS Data step {{{1 

abbreviate data; data;<CR>retain <fields>;<CR>merge <dataset> ( in = in )<CR><TAB><dataset> ( where = ( <logic> ))<CR>;<CR><BS>by <fields>;<CR>if in;<CR>run;<c-o>8<UP>
abbreviate infile; infile "R:\Corp Data Mgt\DWildeboer\Input\.csv" dsd missover;<CR>input <field> : <informat>;

" NOTE This one might be too much
abbreviate  merge; merge ( in = in )<CR><TAB> ( where = (  ))<CR>;<UP><UP><LEFT>

" TODO SAS functions {{{1
" TODO other SAS functions
" search
" find
" substr
" upcase lowcase

abbreviate tranwrd( tranwrd(<source>, <target>, <replacement> )<c-o>34<LEFT>
abbreviate translate( translate(<source>, <to1>, <from1> )<c-o>25<LEFT>
abbreviate substr( substr(<string>, <position>, <length> )<c-o>31<LEFT>



" Comments {{{1
" 
abbreviate /*** /***********************************************************************
abbreviate /**/ /***********************************************************************/<CR>/* {{{1 */<CR>/***********************************************************************/<UP><HOME><RIGHT><RIGHT>
abbreviate /*{{{ /* {{{2 */<HOME><RIGHT><RIGHT>
abbreviate /*{{{1 /* {{{1 */<HOME><RIGHT><RIGHT>
abbreviate /*{{{2 /* {{{2 */<HOME><RIGHT><RIGHT>
abbreviate /*{{{3 /* {{{3 */<HOME><RIGHT><RIGHT>

" VIM Settings for this file {{{1
" vim: foldcolumn=3: foldmethod=marker:
