# Makefile for updating dotfiles and related

all: update_local

update_vim:
	cp vim/vimrc ~/.vimrc

update_vimp:
	cp vimperator/vimperatorrc ~/.vimperatorrc

update_taskwarrior:
	cp taskwarrior/taskrc ~/.taskrc

update_bashrc
    cp osx/bashrc ~/.bashrc
