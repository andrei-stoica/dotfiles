set number
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=2
set smartindent
set softtabstop=2
set ruler
set undolevels=1000
set backspace=indent,eol,start
set colorcolumn=80
highlight colorcolumn ctermbg=grey ctermfg=blue
highlight OverLength ctermbg=red ctermfg=white 
match OverLength /\%>80v.\+/
filetype plugin on
syntax on
