@echo Create an HTML file from a source file using Vim.
    @:: Notes:
    @echo off
    :: This probably only works on Windows NT OS.
    :: Assumes that batch files were selected on install.
    echo.

:: Create HTML file
    echo Loading and converting to HTML file:
    echo   %*
    :: -f  no fork
    :: -n  no swap file
    :: -c "let html_ignore_folding = 1"  expand all folds
    :: -c "let html_use_css = 1"  use cascading style sheets (smaller file-size)
    :: -c "runtime! syntax/2html.vim"  run vim file to convert formating to HTML
    :: -c "w!"  save the HTML file (overwriting existing HTML file)
    :: -c "quitall"  close gvim
    cmd.exe /c gvim.bat -f -n -c "let html_ignore_folding = 1" -c "let html_use_css = 1" -c "silent runtime! syntax/2html.vim" -c "w!" -c "quitall" "%*"
    echo.

:: Attempt to open new HTML file in default browser.
    echo Opening new HTML file.
    echo   %*.html
    "%*.html"
    echo.

:: vim: foldmethod=indent foldcolumn=1
