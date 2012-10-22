" Set newer vim mode. This must be the first entry as it resets all (or most of) the settings
set nocompatible

" *************************************************************************************************************************************
" General settings
"
set autoread			" Automagically reload outside edited files
set fileformats=unix,dos	" Unix line ends

" *************************************************************************************************************************************
" Interface settings
"
set number		" Display line numbers (renders klipper unusable)
set history=20		" How many lines of command history to keep (do I need that at all?)
set showmode		" Display current edit mode (if any)
set showcmd		" Display command while it is being typed in
if has("syntax")
	syntax on	" Turn on syntax hughlighting if possible
endif

" *************************************************************************************************************************************
" Editor settings
"
set backspace=indent,eol,start		" Allow backspacing over everything
set cursorline				" Highlight current line
set ruler				" Sow cursor position
set showmatch				" Display maching brackets/braces
set matchtime=20			" Time in ms to show actual match
set textwidth=135			" Screw 80 col terminals, I have some screen real estate
set colorcolumn=+1			" Highlight column # ${textwidth}+1

" *************************************************************************************************************************************
" Whitespace settings
"
set autoindent		" Keep indentation on <LF> (default behaviour for IDEs)
"set softtabstop=4	" Indent = 4 spaces (tab key)
"set softtabstop=4	" Indent = 4 spaces (autoindent)
"set expandtab		" Tabs are always all-spaces

" *************************************************************************************************************************************
" Search/RegEx settings
"
set incsearch		" Show search results while typing (incremental search)
set ignorecase		" Ignore case when search string is in camelcase
set smartcase		" but do not for Camelcase/camelCase/etc.

" *************************************************************************************************************************************
" OS integration settings
"
set autoread		" Tail open files and automagically reload any changes

" *************************************************************************************************************************************
" Backups
"
set nobackup		" Do not keep backup files
set writebackup		" Backup for writing (in case of remote files'n'stuff)
set undodir=~/.vim/undo
set undofile		" Preserve undo information across vim launches. Handy
