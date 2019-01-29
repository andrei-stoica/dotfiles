set nocompatible              " be iMproved, required
filetype on										" required

if empty(glob("~/.vim/bundle/Vundle.vim"))
	execute '!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
	autocmd VimEnter * silent! PluginInstall
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	Plugin 'scrooloose/nerdtree'

	Plugin 'digitaltoad/vim-pug'

	Plugin 'itchyny/lightline.vim'

	Plugin 'airblade/vim-gitgutter'

	Plugin 'suan/vim-instant-markdown'
	Plugin 'xuhdev/vim-latex-live-preview'

	Plugin 'kien/rainbow_parentheses.vim'

	" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
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
set tabstop=2
set ruler
set undolevels=1000
set backspace=indent,eol,start
set colorcolumn=80

" lastline plugin config
set laststatus=2

" colorscheme
syntax enable
"set background=dark
"colorscheme solarized

highlight colorcolumn ctermbg=grey ctermfg=blue
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%>80v.\+/
filetype plugin on
nmap ne :NERDTreeToggle<cr>
let g:livepreview_previewer = 'atril'
