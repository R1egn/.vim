" Vim syntax file
" Language:	SAS
" Maintainer:	James Kidd <james.kidd@covance.com>
" Last Change:  2009-12-17 Donald Wildeboer <donald@wildeboer.org>
"		Added spelling, common operators, built in date time values.
"		Improved some macro stuff. 
"		Using oracle sql formatting because it's close enough to built
"		in SAS SQL.
"		Added proper log formatting (NOTE: WARNING: ERROR:).
"		Thanks to all the previous contributors.
"		18 Jul 2008 by Paulo Tanimoto <ptanimoto@gmail.com>
"		Fixed comments with * taking multiple lines.
"		Fixed highlighting of macro keywords.
"		Added words to cases that didn't fit anywhere.
"		02 Jun 2003
"		Added highlighting for additional keywords and such;
"		Attempted to match SAS default syntax colors;
"		Changed syncing so it doesn't lose colors on large blocks;
"		Much thanks to Bob Heckel for knowledgeable tweaking.

"  For version 5.x: Clear all syntax items
"  For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

syn case ignore
set ic

" Strings with double quotes (") can contain macros, single quotes (') can not. (Donald Wildeboer)
syn region sasString	start=+"+  skip=+\\\\+  end=+"+ contains=@Spell,sasMacro,sasMacroVar
syn region sasString	start=+'+  skip=+\\\\+  end=+'+ contains=@Spell

" Want region from 'cards;' to ';' to be captured
syn region sasCards	start="^\s*CARDS.*" end="^\s*;\s*$"
syn region sasCards	start="^\s*DATALINES.*" end="^\s*;\s*$"

syn match sasNumber	"\<\d*\.\=\d*\>"

" comparison operators (Donald Wildeboer)
syn keyword sasOperator	EQ NE GT GE LT LE YES NO NOT AS AND OR INAP 
syn match   sasOperator ">\|<\|-\|+\|*\|\/\|="

syn match sasDateTime   +\(3[0-1]\|[0-2]\d\)\(jan\|feb\|mar\|apr\|may\|jun\|jul\|aug\|sep\|oct\|nov\|dec\)\c\(\d\d\)\{1,2\}+
syn match sasDateTime   +\('\|"\)\(3[0-1]\|[1-2]\d\|0[1-9]\)\(jan\|feb\|mar\|apr\|may\|jun\|jul\|aug\|sep\|oct\|nov\|dec\)\c\(\d\d\)\{1,2\}\1d+
syn match sasDateTime   +\('\|"\)\(3[0-1]\|[1-2]\d\|0[1-9]\)\(jan\|feb\|mar\|apr\|may\|jun\|jul\|aug\|sep\|oct\|nov\|dec\)\c\(\d\d\)\{1,2\}\(:\d\d\)\{0,3\}\(.\d\d\d\)\?\1dt+

" Block comment
syn region sasComment	start="/\*"  end="\*/" contains=sasTodo,@Spell,sasMacroVar

" Ignore misleading //JCL SYNTAX... (Bob Heckel)
syn region sasComment	start="[^/][^/]/\*"  end="\*/" contains=sasTodo,@Spell,sasMacroVar

" Comments with * may take multiple lines (Paulo Tanimoto)
" They also can contain macro's that get run (Donald Wildeboer)
syn region sasComment start=";\s*\*"hs=s+1 end=";" contains=sasTodo,@spell,sasMacroVar,sasMacro,sasCustomMacro

" Comments with * starting after a semicolon (Paulo Tanimoto)
" They also can contain macro's that will run (Donald Wildeboer)
syn region sasComment start="^\s*\*" end=";" contains=sasTodo,@spell,sasMacroVar,sasMacro,sasCustomMacro

" SAS Macro Style comments (Donald Wildeboer)
syn region sasComment start="^\s*%\*" end=";" contains=sasTodo,@spell,sasMacroVar,sasMacro,sasCustomMacro

"This may help with macros
"syn match sasComment	"^\s*%*\*.*;" contains=sasTodo,@Spell

" This line defines macro variables in code.  HiLink at end of file
" defines the color scheme. Begin region with ampersand and end with
" any non-word character offset by -1; put ampersand in the skip list
" just in case it is used to concatenate macro variable values.
" Thanks to ronald höllwarth for this fix to an intra-versioning
" problem with this little feature
if version < 600
    syn region sasMacroVar	start="\&" skip="[_&]" end="\W"he=e-1 end="\.\|$"
else		 " for the older Vim's just do it their way ...
    syn region sasMacroVar	start="&" skip="[_&]" end="\W"he=e-1 end="\.\|$"
endif

" I dont think specific PROCs need to be listed if use this line (Bob Heckel).
syn match sasProc		"^\s*PROC\s\+\w\+"
syn keyword sasStep		RUN QUIT DATA
syn region sasStep		start="^\s*option\(s\)\=\s\+" end=";" contains=sasMacroVar
syn keyword sasNull		NULL .
syn match sasStep		"\s*PROC\s*SQL\s*\(\(\(no\)\=\(double\|feedback\|flow\|number\|print\|sortmsg\|errorstop\|exec\|prompt\|stimer\|threads\)\|\(\(BUFFERSIZE\|SORTSEQ\|DQUOTE\|INOBS\|OUTOBS\|LOOPS\|UNDO_POLICY\)\s*=\s*\S\+\)\)\s*\)*;"he=e-1 contained

" Add support for sql highlighting (Donald Wildeboer)
syn include @sql syntax/sqloracle.vim
syn region procSql start=+\s*proc\s*sql\s*\(\(\(no\)\=\(double\|feedback\|flow\|number\|print\|sortmsg\|errorstop\|exec\|prompt\|stimer\|threads\)\|\(\(BUFFERSIZE\|SORTSEQ\|DQUOTE\|INOBS\|OUTOBS\|LOOPS\|UNDO_POLICY\)\s*=\s*\S\+\)\)\s*\)*;+ end=+quit\s*;+ end=+\(^\|;\)\s*\(data\|proc\)+ contains=@sql,sasMacro,sasMacroVar,sasComment,sasStep,sasFunction,sasFormat,sasOperator keepend

" Add all the many SAS formats: <$>format<w>.<d>  (Donald Wildeboer) 
syn match sasFormat             "\$\=\w\+\d*\.\d*"

" My Custom format for placeholders for temporary text
syn match sasErrMsg             "<\w\+>"

" Handy settings for using vim with log files
" Highlight any following lines that are indented same as log message type (Donald Wildeboer)
syn region sasLogMsg	start=+^NOTE:.*+		end=+$+	nextgroup=sasLogMsg2	skipnl
syn region sasWarnMsg	start=+^WARNING:.*+		end=+$+	nextgroup=sasWarnMsg2	skipnl
syn region sasErrMsg	start=+^ERROR[-1-9 ]*:.*+	end=+$+	nextgroup=sasErrMsg2	skipnl
syn region sasLogMsg2	start=+^\s+			end=+$+	nextgroup=sasLogMsg2 	skipnl	contained
syn region sasWarnMsg2	start=+^\s+			end=+$+	nextgroup=sasWarnMsg2 	skipnl	contained
syn region sasErrMsg2	start=+^\s+			end=+$+	nextgroup=sasErrMsg2	skipnl	contained

" Base SAS Procs - version 8.1

syn keyword sasConditional	DO ELSE END IF THEN UNTIL WHILE

syn keyword sasStatement	ABORT ARRAY ATTRIB BY CALL CARDS CARDS4 CATNAME
syn keyword sasStatement	CONTINUE DATALINES DATALINES4 DELETE DISPLAY
syn keyword sasStatement	DM DROP ENDSAS FILE FILENAME FOOTNOTE
syn keyword sasStatement	FORMAT GOTO INFILE INFORMAT INPUT KEEP
syn keyword sasStatement	LABEL LEAVE LENGTH LIBNAME LINK LIST LOSTCARD
syn keyword sasStatement	MERGE MISSING MODIFY OTHERWISE OUTPUT PAGE
syn keyword sasStatement	PUT REDIRECT REMOVE RENAME REPLACE RETAIN
syn keyword sasStatement	RETURN SELECT SET SKIP STARTSAS STOP TITLE
syn keyword sasStatement	UPDATE WAITSAS WHEN WHERE WINDOW X SYSTASK

" Keywords that are used in Proc SQL
" I left them as statements because SAS's enhanced editor highlights
" them the same as normal statements used in data steps (Jim Kidd)

syn keyword sasStatement	ADD ALTER CASCADE CHECK CREATE
syn keyword sasStatement	DELETE DESCRIBE DISTINCT DROP FOREIGN
syn keyword sasStatement	FROM GROUP HAVING INDEX INSERT INTO IN
syn keyword sasStatement	KEY LIKE MESSAGE MODIFY MSGTYPE 
syn keyword sasStatement	ON ORDER PRIMARY REFERENCES
syn keyword sasStatement	RESET RESTRICT SELECT SET TABLE
syn keyword sasStatement	UNIQUE UPDATE VALIDATE VIEW WHERE

syn match sasStatement	"FOOTNOTE\d"
syn match sasStatement	"TITLE\d"

" customMacros
"syn match sasCustomMacro	"%\a\+"
syntax region sasCustomMacro start="%[^\*]" end="\h\w*"

syn match sasMacro	"%ABORT"
syn match sasMacro	"%BQUOTE"
syn match sasMacro      "%NRBQUOTE"
syn match sasMacro      "%CMPRES"
syn match sasMacro      "%QCMPRES"
syn match sasMacro	"%COMPSTOR"
syn match sasMacro      "%DATATYP"
syn match sasMacro      "%DISPLAY"
syn match sasMacro      "%DO"
syn match sasMacro	"%ELSE"
syn match sasMacro      "%END"
syn match sasMacro      "%EVAL"
"syn match sasMacro	"%GLOBAL"
syn region sasMacro     start="%global" end=";"
syn match sasMacro	"%GOTO"
syn match sasMacro      "%IF"
syn match sasMacro      "%INCLUDE"
syn match sasMacro      "%INDEX"
syn match sasMacro      "%INPUT"
syn match sasMacro	"%KEYDEF"
syn match sasMacro      "%LABEL"
syn match sasMacro      "%LEFT"
syn match sasMacro      "%LENGTH"
"syn match sasMacro	"%LET"
syn region sasMacro     start="%let\s\+" end="\w\+\s*"
"syn match sasMacro	"%LOCAL"
syn region sasMacro     start="%local" end=";"
syn match sasMacro      "%LOWCASE"
"syn match sasMacro	"%MACRO"
syn region sasMacro     start="%macro" end="\<\h\w*"
syn match sasMacro	"%MEND"
"syn region sasMacro	start="%mend"  end="\<\h\w*"
syn match sasMacro      "%NRBQUOTE"
syn match sasMacro      "%NRQUOTE"
syn match sasMacro      "%NRSTR"
syn match sasMacro	"%PUT"
syn match sasMacro      "%QCMPRES"
syn match sasMacro      "%QLEFT"
syn match sasMacro      "%QLOWCASE"
syn match sasMacro	"%QSCAN"
syn match sasMacro      "%QSUBSTR"
syn match sasMacro      "%QSYSFUNC"
syn match sasMacro      "%QTRIM"
syn match sasMacro	"%QUOTE"
syn match sasMacro      "%QUPCASE"
syn match sasMacro      "%SCAN"
syn match sasMacro      "%STR"
syn match sasMacro	"%SUBSTR"
syn match sasMacro      "%SUPERQ"
syn match sasMacro      "%SYSCALL"
syn match sasMacro      "%SYSEVALF"
syn match sasMacro	"%SYSEXEC"
syn match sasMacro      "%SYSFUNC"
syn match sasMacro      "%SYSGET"
syn match sasMacro      "%SYSLPUT"
syn match sasMacro	"%SYSPROD"
syn match sasMacro      "%SYSRC"
syn match sasMacro      "%SYSRPUT"
syn match sasMacro      "%THEN"
syn match sasMacro	"%TO"
syn match sasMacro      "%TRIM"
syn match sasMacro      "%UNQUOTE"
syn match sasMacro      "%UNTIL"
syn match sasMacro	"%UPCASE"
syn match sasMacro      "%VERIFY"
syn match sasMacro      "%WHILE"
syn match sasMacro      "%WINDOW"

" SAS Functions

syn keyword sasFunction	ABS ADDR AIRY ARCOS ARSIN ATAN ATTRC ATTRN
syn keyword sasFunction	BAND BETAINV BLSHIFT BNOT BOR BRSHIFT BXOR
syn keyword sasFunction	BYTE CDF CEIL CEXIST CINV CLOSE CNONCT COLLATE
syn keyword sasFunction	COMPBL COMPOUND COMPRESS COS COSH CSS CUROBS
syn keyword sasFunction	CV DACCDB DACCDBSL DACCSL DACCSYD DACCTAB
syn keyword sasFunction	DAIRY DATE DATEJUL DATEPART DATETIME DAY
syn keyword sasFunction	DCLOSE DEPDB DEPDBSL DEPDBSL DEPSL DEPSL
syn keyword sasFunction	DEPSYD DEPSYD DEPTAB DEPTAB DEQUOTE DHMS
syn keyword sasFunction	DIF DIGAMMA DIM DINFO DNUM DOPEN DOPTNAME
syn keyword sasFunction	DOPTNUM DREAD DROPNOTE DSNAME ERF ERFC EXIST
syn keyword sasFunction	EXP FAPPEND FCLOSE FCOL FDELETE FETCH FETCHOBS
syn keyword sasFunction	FEXIST FGET FILEEXIST FILENAME FILEREF FINFO
syn keyword sasFunction	FINV FIPNAME FIPNAMEL FIPSTATE FLOOR FNONCT
syn keyword sasFunction	FNOTE FOPEN FOPTNAME FOPTNUM FPOINT FPOS
syn keyword sasFunction	FPUT FREAD FREWIND FRLEN FSEP FUZZ FWRITE
syn keyword sasFunction	GAMINV GAMMA GETOPTION GETVARC GETVARN HBOUND
syn keyword sasFunction	HMS HOSTHELP HOUR IBESSEL INDEX INDEXC
syn keyword sasFunction	INDEXW INPUT INPUTC INPUTN INT INTCK INTNX
syn keyword sasFunction	INTRR IRR JBESSEL JULDATE KURTOSIS LAG LBOUND
syn keyword sasFunction	LEFT LENGTH LGAMMA LIBNAME LIBREF LOG LOG10
syn keyword sasFunction	LOG2 LOGPDF LOGPMF LOGSDF LOWCASE MAX MDY
syn keyword sasFunction	MEAN MIN MINUTE MOD MONTH MOPEN MORT N
syn keyword sasFunction	NETPV NMISS NORMAL NPV OPEN ORDINAL
syn keyword sasFunction	PATHNAME PDF PEEK PEEKC PMF POINT POISSON POKE
syn keyword sasFunction	PROBBETA PROBBNML PROBCHI PROBF PROBGAM
syn keyword sasFunction	PROBHYPR PROBIT PROBNEGB PROBNORM PROBT PUT
syn keyword sasFunction	PUTC PUTN QTR QUOTE RANBIN RANCAU RANEXP
syn keyword sasFunction	RANGAM RANGE RANK RANNOR RANPOI RANTBL RANTRI
syn keyword sasFunction	RANUNI REPEAT RESOLVE REVERSE REWIND RIGHT
syn keyword sasFunction	ROUND SAVING SCAN SDF SECOND SIGN SIN SINH
syn keyword sasFunction	SKEWNESS SOUNDEX SPEDIS SQRT STD STDERR STFIPS
syn keyword sasFunction	STNAME STNAMEL SUBSTR SUM SYMGET SYSGET SYSMSG
syn keyword sasFunction	SYSPROD SYSRC SYSTEM TAN TANH TIME TIMEPART
syn keyword sasFunction	TINV TNONCT TODAY TRANSLATE TRANWRD TRIGAMMA
syn keyword sasFunction	TRIM TRIMN TRUNC UNIFORM UPCASE USS VAR
syn keyword sasFunction	VARFMT VARINFMT VARLABEL VARLEN VARNAME
syn keyword sasFunction	VARNUM VARRAY VARRAYX VARTYPE VERIFY VFORMAT
syn keyword sasFunction	VFORMATD VFORMATDX VFORMATN VFORMATNX VFORMATW
syn keyword sasFunction	VFORMATWX VFORMATX VINARRAY VINARRAYX VINFORMAT
syn keyword sasFunction	VINFORMATD VINFORMATDX VINFORMATN VINFORMATNX
syn keyword sasFunction	VINFORMATW VINFORMATWX VINFORMATX VLABEL
syn keyword sasFunction	VLABELX VLENGTH VLENGTHX VNAME VNAMEX VTYPE
syn keyword sasFunction	VTYPEX WEEKDAY YEAR YYQ ZIPFIPS ZIPNAME ZIPNAMEL
syn keyword sasFunction	ZIPSTATE


" Added
syn keyword sasFunction ODS RTF ID LABEL IDLABEL FORMAT NODUPKEY OUT

" Always contained in a comment
syn keyword sasTodo	TODO TBD FIXME XXX NOTE contained

" These don't fit anywhere else (Bob Heckel).
syn match sasUnderscore	"_NULL_"
syn match sasUnderscore	"_INFILE_"
syn match sasUnderscore	"_N_"
syn match sasUnderscore	"_WEBOUT_"
syn match sasUnderscore	"_NUMERIC_"
syn match sasUnderscore	"_CHARACTER_"
syn match sasUnderscore	"_ALL_"

" End of SAS Functions

"  Define the default highlighting.
"  For version 5.7 and earlier: only when not done already
"  For version 5.8 and later: only when an item doesn't have highlighting yet

if version >= 508 || !exists("did_sas_syntax_inits")
   if version < 508
      let did_sas_syntax_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " Default sas enhanced editor color syntax
	hi sComment	term=bold cterm=NONE ctermfg=Green	ctermbg=Black	gui=NONE guifg=DarkGreen	guibg=White
	hi sCard	term=bold cterm=NONE ctermfg=Black	ctermbg=Yellow	gui=NONE guifg=Black	guibg=DarkYellow
	hi sDate_Time	term=NONE cterm=bold ctermfg=Green	ctermbg=Black	gui=bold guifg=SeaGreen	guibg=White
	hi sKeyword	term=NONE cterm=NONE ctermfg=Blue	ctermbg=Black	gui=NONE guifg=Blue	guibg=White
	hi sFmtInfmt	term=NONE cterm=NONE ctermfg=LightGreen	ctermbg=Black	gui=NONE guifg=SeaGreen	guibg=White
	hi sString	term=NONE cterm=NONE ctermfg=Magenta	ctermbg=Black	gui=NONE guifg=DarkMagenta	guibg=White
	hi sText	term=NONE cterm=NONE ctermfg=White	ctermbg=Black	gui=bold guifg=Black	guibg=White
	hi sNumber	term=NONE cterm=bold ctermfg=Green	ctermbg=Black	gui=bold guifg=DarkCyan	guibg=White
	hi sProc	term=NONE cterm=bold ctermfg=Blue	ctermbg=Black	gui=bold guifg=Navy	guibg=White
	hi sSection	term=NONE cterm=bold ctermfg=Blue	ctermbg=Black	gui=bold guifg=Navy	guibg=White
	hi mDefine	term=NONE cterm=bold ctermfg=White	ctermbg=Black	gui=bold guifg=Black	guibg=LightYellow
	hi mKeyword	term=NONE cterm=NONE ctermfg=Blue	ctermbg=Black	gui=NONE guifg=Blue 	guibg=LightYellow
	hi mKeyword2	term=NONE cterm=NONE ctermfg=Blue	ctermbg=Black	gui=italic guifg=Blue 	guibg=LightYellow
	hi mReference	term=NONE cterm=bold ctermfg=White	ctermbg=Black	gui=bold guifg=Blue	guibg=LightYellow
	hi mSection	term=NONE cterm=NONE ctermfg=Blue	ctermbg=Black	gui=bold guifg=Navy	guibg=LightYellow
	hi mText	term=NONE cterm=NONE ctermfg=White	ctermbg=Black	gui=bold guifg=Black	guibg=LightYellow

   " Colors that closely match SAS log colors for default color scheme
	hi lError	term=NONE cterm=NONE ctermfg=Red	ctermbg=Black	gui=bold guifg=Red	guibg=White
	hi lWarning	term=NONE cterm=NONE ctermfg=DarkGreen	ctermbg=Black	gui=bold guifg=DarkGreen	guibg=White
	hi lNote	term=NONE cterm=NONE ctermfg=Cyan	ctermbg=Black	gui=bold guifg=Blue	guibg=White

   " Special highlighting for the SAS proc section

	HiLink	sasComment	sComment
	HiLink	sasConditional	sKeyword
        HiLink	sasStep		sSection
	HiLink	sasNull		sSection
	HiLink	sasFunction	sKeyword
	HiLink	sasMacro	mKeyword
	HiLink	sasCustomMacro	mKeyword2
	HiLink	sasMacroVar	mReference
	HiLink	sasNumber	sNumber
	HiLink	sasStatement	sKeyword
	HiLink	sasOperator	sNumber
	HiLink	sasFormat	sNumber
	HiLink	sasString	sString
	HiLink	sasProc		sProc
	HiLink	sasTodo		Todo
	HiLink	sasErrMsg	lError
	HiLink	sasErrMsg2	lError
	HiLink	sasWarnMsg	lWarning
	HiLink	sasWarnMsg2	lWarning
	HiLink	sasLogMsg	lNote
	HiLink	sasLogMsg2	lNote
	HiLink	sasCards	sCard
        HiLink  sasDateTime     sDate_Time
	HiLink	sasUnderscore	PreProc
	delcommand HiLink
endif

" Syncronize from beginning to keep large blocks from losing
" syntax coloring while moving through code.
syn sync fromstart

let b:current_syntax = "sas"

" vim: ts=8
