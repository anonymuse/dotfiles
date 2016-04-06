#!/usr/bin/env python
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

import os
import re

my_repos = '/Users/jesse/Code/my_repos'
pub_repos = '/Users/jesse/Code/public_repos'

# Set up Vundle, which has a special install
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Clone public repositories
#git clone https://github.com/pallets/flask.git

# Do I want to put the full path of the repo here, or just the name? Not sure
dotfile_clones = [
        'https://github.com/gmarik/dotfiles.git',
        ]

clones = [
        'https://github.com/pallets/flask.git',
        'https://github.com/cptactionhank/docker-atlassian-confluence.git',
        'https://github.com/spf13/hugoThemes.git',
        'https://github.com/braydie/HowToBeAProgrammer.git',
        'https://github.com/mizzy/serverspec.git',
        'https://github.com/behave/behave.git',
        'https://github.com/mizzy/serverspec.git',
        ]

# Clone my repositories
#TODO: Create Repo cloner function
# Extracts the clone folder path from the clone link
# Takes a list of repos and clones ones that don't exist
# Skips ones that do exist
# Non-loop example:
repo = 'https://github.com/behave/behave.git'

#TODO: Create repository scan regex
clone_regex = re.compile('https:\/\/github.com\/\w+\/(.*).git$')
result = clone_regex.match(repo)
repo_path = result.group(1)
print(repo_path)

#TODO: Get the folder name from the https link
# https://github.com/pallets/flask.git == 'flask'

# If the folder existst already, move on to the next file

# If the folder doesn't exist, clone the link into the named folder
