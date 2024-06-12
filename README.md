# .vim
All my Vim settings from all my computers all in one spot.

Setup on a machine
==================================================

1. Remove old \_vimrc or merge it into the repository.
1. Remove old vimfiles or merge it into the repository. (Optional)
1. Git clone to users home (`~/`) this will create `~/.git`. Using command `git clone https://github.com/R1egn/.vim`.
1. In home link \_vimrc File system links must be manually made:
        Create ~/\_vimrc linked to \_vimrc in the repository. Note after trying 
        to write scripts that would create these links automatically I changed 
        my mind and thought that a manual process is probably much safer.

### On Windows
Link local \_vimrc to repository \_vimrc. (Needs admin or use Git Bash.)

	mklink %userprofile%\_vimrc %userprofile%\.vim\_vimrc

### On Linux or Git Bash
Hard link ~/.vimrc to repository ~/.vim/\_vimrc.

	ln ~/.vim/_vimrc ~/.vimrc

## General comments
- Keep it simple yo.
- Try to make it work on all systems.
- All file system stuff should point to the files inside the repository.

## TODO
- IM003327 This originally had the most settings setup. Really the source.
	- Merge in SAS syntax formatting.
	- Update other filetype scripts: sas, ps1, nfo .
- Cleanup _vimrc
- Remove the unneeded branches IM003327, 2Face, others? It can all go in 
  master.
