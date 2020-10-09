filesystem links should be manually made
==================================================

There will need to be 2 items linked \_vimrc and vimfiles. After trying to 
write scripts that would craete these links I changed my mind and thought that 
a manual process is probably much safer.

### \_vimrc is under home
> \_vimrc aka .vimrc
> home aka ~
> home aka %userprofile%

The idea is to point the filesytem \_vimrc to the \_vimrc in the repo. Without 
losing the \_vimrc.

On Windows:
Link local \_vimrc to repo \_vimrc. (Needs admin permissions.)
`mklink %userprofile%\\_vimrc %userprofile%\.vim\\_vimrc`

On Linux:
question: should the link be overwritten? Probably yes
`ln -f '~/.vim/linux.vimrc' ~/.vimrc`


### viminfo is under ?
> on my IM003327 it is under %appdata%\Vim
