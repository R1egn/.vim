# this file is to recreate any links in Dropbox that the system should use to
# point to ~/.vim
# this file needs to fix up any links that may have been broken by the system.
# Assumptions:
# - by default Dropbox is under ~/Dropbox
# - this is running on a Fedora machine with default settings.

# question: should the link be overwritten? Probably yes
# ln [OPTION]... [-T] TARGET LINK_NAME
ln -f '~/.vim/linux.vimrc' .vimrc

