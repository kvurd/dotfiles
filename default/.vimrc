" kvurd vimrc

" Vundle settings
set nocompatible
filetype off

" auto install vundle if not installed

let isVundleFreshInstall=0
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
     silent !mkdir -p ~/.vim/bundle/
     silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
     let isVundleFreshInstall=1
endif

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'ambv/black'
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()

if isVundleFreshInstall == 1
     :PluginInstall
endif

filetype plugin indent on

syntax on

" fix clipboard
set clipboard=unnamed

" allows switching from unsaved buffer without saving
set hidden

" allows better command line completion
set wildmenu

" show partial commands in last line of screen
set showcmd

" highlight search results
set hlsearch

" security benefit indeed
set nomodeline

" make benefit case insensitive searches, except if capitals used
set ignorecase

" turn on the ruler (show cursor position)
set ruler

" turn on line numbers
set number

" always display the status line, even if only one window is displayed
set laststatus=2

" performance benefits
set nocursorline
set nocursorcolumn
set lazyredraw
set scrolljump=8

" instead of failing for no file save, ask for confirmation
"set confirm

" allow backspacing over autoindent, line breaks and start of insert
set backspace=indent,eol,start

" use visual bell instead of beeping
set visualbell

" enable mouse for all modes
set mouse=a

" set command window height to two lines, to avoid
" having to press enter to continue
set cmdheight=2

" INDENTATION DEFAULTS
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" 2 spaces for html/css/less etc
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 softtabstop=2
autocmd FileType less setlocal shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2

" <esc> is no good

inoremap kj <esc>

" set up visual line jumps
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" colorscheme
set background=dark
colorscheme PaperColor

" turn wrapping on in html files and markdown files
augroup WrapLineInHTMLFile
    autocmd!
    autocmd FileType html setlocal wrap
augroup END

augroup WrapLineInMarkdownFile
    autocmd!
    autocmd FileType markdown setlocal wrap
augroup END

" django html
au BufRead,BufNewFile *.html set filetype=htmldjango

" stop ctrlp.vim opening certain files
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.o,*.lo,*.swp,*.zip,*.pyc,*.pyo

" column highlighting
if exists('+colorcolumn')
    set colorcolumn=80
    highlight ColorColumn ctermbg=0
endif

" when wrapping lines, keep the wrapped line at the same indent as previous
" lines (relatively new feature of vim)
if exists("&breakindent")
    set breakindent
endif

" auto format python
autocmd BufWritePre *.py execute ':Black'
