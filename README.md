# .vim
All my vim settings from all my computers all in one spot!


## restrictions
- Things shouldn't break on individual computers.
- All file system stuff should point to the files inside the repo. Is that a 
  good idea? Or should the repo contain scripts to push out settings to where 
  Vim expects them. Or should Vim be set to look for the repo.
- A major restriction that I have is that on my work computer IM003327 I only 
  have OneDrive and Dropbox isn't allowed.
- Hold up!!!! Why use OneDrive or Dropbox at all for syncing, it can just be a 
  backup and the main tool is Git.

## items to track
- \_vimrc
- linux\_vimrc
- /viminfo/

## link to change
- TODO remove from Dropbox and just leave a note there.
	- Dropbox/Documents/viminfo
	- Dropbox/Documents/Handy Files/\_vimrc
- _others?_

## computers 
- IM003327 This has the most settings setup. Really the source.
	- DONE in branch IM003327
	- TODO setup command line
	- TODO this is really going to be the master branch
- Chloe
	- TODO linked to linux.vimrc
	- TODO make a branch
	- TODO Add viminfo & test
- Steve
	- TODO setup and make a branch
- 2Face
	- DONE in branch 2Face

## ideas
- the repo should reside under ~/.vim
- Repo upstream in GitHub at https://github.com/R1egn/.vim/
- make it Git compatible
- make it Dropbox compatible. Push to here? No - this is not needed.
- make it OneDrive compatible? No - this is not needed.

## todo
- change inside \_vimrc to make Vim look for vimfiles first at ~/.vim/vimfiles

## done
- Acer all-in-one <--> Dropbox : both \_vimrc and /viminfo/
- Chloe <--> Dropbox : linux\_vimrc
- IM003327 : ~\_vimrc <<===>> ~\\.vim\\\_vimrc
- IM003327 : %appdata%\Vim\vimfiles <<===>> c:\users\dwildeboer\\.vim\vimfiles



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
