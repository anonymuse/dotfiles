# Makefile for updating dotfiles and related

all: vim vimp taskwarrior bashrc

vim:
	cp vim/vimrc ~/.vimrc

vimp:
	cp vimperator/vimperatorrc ~/.vimperatorrc

taskwarrior:
	cp taskwarrior/taskrc ~/.taskrc

bashrc:
	cp osx/bashrc ~/.bashrc

