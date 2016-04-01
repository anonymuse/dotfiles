#!/bin/sh
#
###################################
#  Parlay configuration utility   #
##########################################################
#                                                        #
# Objective:                                             #
# Clone the desired repositories for a fresh OS install  #
#                                                        #
# Learn:                                                 #
#                                                        #
#                                                        #
#                                                        #
##########################################################

# Logging stuff.
function e_header()   { echo -e "\n\033[1m$@\033[0m"; }
function e_success()  { echo -e " \033[1;32m✔\033[0m  $@"; }

# Clone repositories
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
