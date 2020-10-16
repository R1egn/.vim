# .vim
All my Vim settings from all my computers all in one spot!

## General comments
- Keep it simple yo.
- Things shouldn't break on individual computers.
- All file system stuff should point to the files inside the repository. Is 
  that a good idea? (Yes it is.) ~~Should the repository contain scripts to 
  push out settings to where Vim expects them.~~ Or should Vim be set to look 
  for the repository. (Yes)
- This turned out to be way easier than I thought it would be.

## TODO
- Remove from Dropbox and just leave a note there pointing to GitHub.
	- Dropbox/Documents/viminfo
	- Dropbox/Documents/Handy Files/\_vimrc
- Change VCSCommand to a Git solution that is great.
- IM003327 This originally had the most settings setup. Really the source.
	- setup command line vim to have mouse & scroll both bash and cmd.
	- make sure the vimfiles is linked to repository
	- Move plugins to repo (from C:\Data\Docs\vim\vim82)
		Done: Align, SuperTab, NERD Tree, Buffer Explorer, Calendar, 
		dbext, mru, vcscommand.
		Already good: increment,
		TODO Remove: genutils, multvals, SQLUtilities, others?
	- remove: ~\_vimrc <<===>> ~\\.vim\\\_vimrc
	- remove: %appdata%\Vim\vimfiles <<===>> 
	  c:\users\dwildeboer\\.vim\vimfiles
	- Merge in SAS syntax formatting.
- IM00148x
	- backup old settings (in repository as backup IM148x 2020-10-xx)
	- setup
- 2Face 
	- in Windows make sure the vimfiles is linked
	- in Windows remove Links to <--> Dropbox : both \_vimrc and /viminfo/
- Remove the unneeded branches IM003327, 2Face, others? It can all go in 
  master.
- check for new/updated Vim plugins
- _other_

## Done
- 2Face DONE in Linux
- change inside \_vimrc to make Vim look for vimfiles first at ~/.vim/vimfiles
- the repository should reside under ~/.vim
- Repo upstream in GitHub at https://github.com/R1egn/.vim/
- make it Git compatible
- Chloe DONE : get Git repository, link to \_vimrc, test plugins
- Steve DONE : link setup, cmd mouse setup, git setup, remove old stuff
- ~~make it Dropbox compatible.~~ Push to here? No - this is not needed.
- ~~make it OneDrive compatible?~~ No - this is not needed.

## Tracked file system items
- \_vimrc
- /viminfo/

Setup on a machine
==================================================

1. Remove old \_vimrc or merge it into the repository.
1. Remove old vimfiles or merge it into the repository. (Optional)
1. Git checkout to users home (`~/`) this will create `~/.git`.
1. In home link \_vimrc File system links must be manually made:
        Create ~/\_vimrc linked to \_vimrc in the repository. Note after trying 
        to write scripts that would create these links automatically I changed 
        my mind and thought that a manual process is probably much safer.

### On Windows
Link local \_vimrc to repository \_vimrc. (Needs admin permissions.)

	mklink %userprofile%\_vimrc %userprofile%\.vim\_vimrc

### On Linux

	ln ~/.vim/_vimrc ~/.vimrc

