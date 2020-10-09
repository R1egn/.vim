@echo off
@rem The idea is to point the filesytem _vimrc to the _vimrc in the repo.
@rem Without losing the _vimrc.

echo Move the local _vimrc and backup into repo
if exist %userprofile%\_vimrc move %userprofile%\_vimrc "%userprofile%\.vim\backup _vimrc %computername% on %date:/=-%"

echo Link local _vimrc to repo _vimrc. (Needs admin permissions.)
pause
mklink %userprofile%\_vimrc %userprofile%\.vim\_vimrc

pause
