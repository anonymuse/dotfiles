# Makefile for updating dotfiles and related

COLOR = \033[32;01m
NO_COLOR = \033[0m


all: vim vimp taskwarrior bashrc
.PHONY: vim vimp taskwarrior bashrc

vim:
	cp vim/vimrc ~/.vimrc

vimp:
	cp vimperator/vimperatorrc ~/.vimperatorrc

taskwarrior:
	cp taskwarrior/taskrc ~/.taskrc

bashrc:
	cp osx/bashrc ~/.bashrc

help:
	@echo "Makefile for installing dotfiles"
	@echo "========================================"
	@echo
	@echo "Install ViM configuration:"
	@echo "	$(COLOR)make vim$(NO_COLOR)	>> Copy ViM config"
	@echo "----------------------------------------"
	@echo
	@echo "Install Vimperator configuration:"
	@echo "	$(COLOR)make vimp$(NO_COLOR)	>> Copy Vimperator config"
	@echo "----------------------------------------"
	@echo
	@echo "Install bashrc configuration:"
	@echo "	$(COLOR)make bashrc$(NO_COLOR)	>> Copy bashrc config"
	@echo "----------------------------------------"
	@echo
