" Set up pathogen
execute pathogen#infect()
filetype plugin indent on

" Use Vim settings, not Vi
set nocompatible

" Allow backspacing in insert mode
set backspace=indent,eol,start

" --------------
" Backup settings
" --------------
set nobackup                    " do not keep backups after close
set nowritebackup               " do not keep a backup while working
set backupdir=$HOME/.vim/backup " store backups in ~/.vim/backup

" Keep 5000 lines of command line history
set history=5000

" Show the cursor position all the time
set ruler

" Reload files
 set autoread

" Display incomplete commands
set showcmd

" Do incremental searching
set incsearch

" Turn on syntax highlighting and highlighted search
syntax on
set hlsearch

" 2 space Softtabs
set expandtab
set shiftwidth=2
set tabstop=2

" Highlight the background past 80 characters
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Always display the status line
set laststatus=2

" show trailing whitespace chars
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

" always set autoindenting on
set autoindent

" copy the previous indentation on autoindenting
set copyindent

" Turn on line numbers
set number

" Search Settings
set incsearch   " show search matches as you type
set ignorecase  " case insensitive search
set smartcase   " If a capital letter is included, make it case-sensitive
set nohlsearch  " dont highlight search result

" Keep lines of context above and below the screen borders
set scrolloff=2

" don't beep
set visualbell
set noerrorbells

" Auto read when a file is changed on disk
set autoread

" Set textwidth for Git committing
autocmd Filetype gitcommit setlocal spell textwidth=72

" Allow vim to use a global selection buffer
set clipboard=unnamed
