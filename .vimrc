let mapleader=" " " Leader

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup		  " switch off automatic creation of backup files *.ext~
set nowritebackup	" change default save behavior of Vim
set noswapfile		" switch off automatic creation of swap files *.swp
set history=50		" keep 50 lines of command line history
set ruler		      " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		  " do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Launch bundles from ~/.vimrc.bundles file
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Softtabs, 2 spaces
set tabstop=2		  " set hardtab width to 2 spaces
set shiftwidth=2	" set indent width to 2 spaces
set shiftround		" set indent alignment
set expandtab		  " set the TAB key to insert spaces instead of tab char

" Use one space, not two, after punctuation
set nojoinspaces

" Make it obvious where 80 characters
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Local config if defined
if filereadable($HOME . "/.vimrc.local")
  source ~.vimrc.local
endif
