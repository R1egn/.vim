# .vim
All my vim settings from all my computers all in one spot!

Issue is things shouldn't break on individual computers.

## restrictions
- A major general idea is that all file system stuff should point to the repo.  
  Is that a good idea? Or should the repo contain scripts to push out settings 
  to where Vim expects them. Or should Vim be set to look for the repo.
- A major restriction that I have is that on my work computer IM003327 I only 
  have OneDrive and Dropbox isn't allowed.
- Hold up!!!! Why use OneDrive or Dropbox at all for syncing, it can just be a 
  backup.

## items
- \_vimrc
- linux\_vimrc
- /viminfo/

## link
- TODO remove from Dropbox and OneDrive and just leave a note there.
- OneDrive/viminfo --> Dropbox/Documents/viminfo
- Dropbox/Documents/viminfo
- Dropbox/Documents/Handy Files/\_vimrc
- /others?/

## computers starting with branching
- IM003327 This has the most settings setup. Really the source.
- Steve
- 2Face
- Chloe

## ideas
- the repo should reside under ~/.vim
- Repo upstream in GitHub
- make it Git compatible
- make it Dropbox compatible. Push to here? No - this is not needed.
- make it OneDrive compatible? No - this is not needed.

## todo
- change \_vimrc to point to ~/.vim

## done
- Acer all-in-one <--> Dropbox : both \_vimrc and /viminfo/
- Chloe <--> Dropbox : linux\_vimrc
- IM003327 : c:\users\dwildeboer\\_vimrc <<===>> c:\users\dwildeboer\.vim\\_vimrc
- IM003327 : %appdata%\Vim\vimfiles <<===>> c:\users\dwildeboer\.vim\vimfiles



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
