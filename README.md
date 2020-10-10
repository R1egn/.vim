# .vim
All my vim settings from all my computers all in one spot!

## restrictions
- Things shouldn't break on individual computers.
- All file system stuff should point to the files inside the repo. Is that a 
  good idea? (Yes it is.) ~~Should the repo contain scripts to push out 
  settings to where Vim expects them.~~ Or should Vim be set to look for the 
  repo. (Yes)

## items that are tracked
- \_vimrc
- linux\_vimrc (merge into \_vimrc)
- /viminfo/

## TODO
- remove from Dropbox and just leave a note there pointing to GitHub.
	- Dropbox/Documents/viminfo
	- Dropbox/Documents/Handy Files/\_vimrc
- Chloe
	- get Git repo
	- link to \_vimrc
	- test plugins
- IM003327 This originally had the most settings setup. Really the source.
	- setup command line vim to have mouse & scroll
	- make sure the vimfiles is linked to repo
	- remove: ~\_vimrc <<===>> ~\\.vim\\\_vimrc
	- remove: %appdata%\Vim\vimfiles <<===>> 
	  c:\users\dwildeboer\\.vim\vimfiles
- IM00148x
	- backup old settings (in repo as backup IM148x 2020-10-xx)
	- setup
- Steve
	- remove old stuff
	- setup link
- 2Face 
	- in Windows make sure the vimfiles is linked
	- in Windows remove Links to <--> Dropbox : both \_vimrc and /viminfo/
- remove the unneeded branches IM003327, 2Face, others? It can all go in 
  master.
- merge linux.vimrc into \_vimrc
- check for new/updated Vim plugins
- Chloe <--> Dropbox : linux\_vimrc
- _other_

## done 
- 2Face DONE in Linux
- change inside \_vimrc to make Vim look for vimfiles first at ~/.vim/vimfiles
- the repo should reside under ~/.vim
- Repo upstream in GitHub at https://github.com/R1egn/.vim/
- make it Git compatible
- ~~make it Dropbox compatible.~~ Push to here? No - this is not needed.
- ~~make it OneDrive compatible?~~ No - this is not needed.


filesystem links should be manually made
==================================================

In order to setup create ~/\_vimrc linked to \_vimrc in the repo. After trying 
to write scripts that would create these links I changed my mind and thought 
that a manual process is probably much safer.

### On Windows:
Link local \_vimrc to repo \_vimrc. (Needs admin permissions.)

	`mklink %userprofile%\_vimrc %userprofile%\.vim\_vimrc`

### On Linux:

	`ln '~/.vim/_vimrc' ~/.vimrc`

