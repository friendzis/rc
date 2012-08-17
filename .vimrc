" Set newer vim mode. This must be the first entry as it resets all settings
set nocompatible

" *****************************************************************************
" General settings
"
set autoread			" Automagically reload outside edited files
set fileformats=unix,dos	" Unix line ends

" *****************************************************************************
" Interface settings
"
set number		" Display line numbers. These are good
set history=20		" How many lines of command history to keep
set showmode		" Display current edit mode (if any)
syntax on		" Turn on syntax hughlighting
  
" *****************************************************************************
" Editor settings
"
set backspace=indent,eol,start		" Allow backspacing over everything

" *****************************************************************************
" Whitespace settings
"
set autoindent		" keep indentation on <LF> (default behaviour for IDEs)
"set softtabstop=4	" indent = 4 spaces (tab key)
"set softtabstop=4	" indent = 4 spaces (autoindent)

" *****************************************************************************
" Backups
"
set nobackup		" Do not keep backup files
set writebackup		" Backup for writing (in case of remote files'n'stuff)
set undodir=~/.vim/undo
set undofile		" Preserve undo information. Handy
