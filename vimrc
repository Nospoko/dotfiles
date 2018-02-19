set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/roszcz/Vim-Star-Search.git'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'https://github.com/widox/vim-buffer-explorer-plugin.git'
Plugin 'https://github.com/ihacklog/HiCursorWords.git'
Plugin 'https://github.com/roszcz/python-syntax.git'
Plugin 'https://github.com/tomtom/tcomment_vim.git'
Plugin 'https://github.com/flazz/vim-colorschemes.git'
Plugin 'https://github.com/pangloss/vim-javascript'
Plugin 'https://github.com/StanAngeloff/php.vim.git'

" Plugins here
"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

set encoding=utf-8

" More colors in colors
set t_Co=256

" colorscheme badwolf
" colorscheme dark-ruby
" colorscheme gotham256
" colorscheme 256-grayvim
" colorscheme peachpuff
" colorscheme landscape
colorscheme Tomorrow-Night-Bright
colorscheme CandyPaper
" colorscheme PaperColor
" colorscheme Revolution

set number
syntax on

" Control LAMMPS syntax
augroup filetypedetect
    au BufRead,BufNewFile *.lamps setf lammps
augroup end

" Custom comment style for lammps
call tcomment#DefineType('lammps', '# %s')

filetype on
filetype plugin on
filetype indent on

" spaces in a tab
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

set nocompatible
set encoding=utf-8
set fileencodings=usc-bom,utf-8,latin2
set termencoding=utf-8
set guifont=Consolas:h11:cDEFAUL

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Space as a Leader
let mapleader=" "

" Paste properly
" set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" My own shortcut for 'de-highlightning' search results
map <Leader>h :noh <CR>
" Toggle mini bufer explorer (not shure if it's still needed at all)
map <Leader>m :MBEToggle <CR>
" Show nicer buf explorer
map <Leader>e :BufExplorer<CR>
" " Uber good saving files
map <Leader>w :w <CR> :echo "Is he live or dead? Has he thoughts within his head?"<CR>
" Maybe quit if needed
map <Leader>q :wq <CR> :echo "Wydupa i zapis" <CR>

" Autocomment
map <C-c> :TComment<CR>

" NERDTree toggle Qt style 
map <Leader>0 :NERDTreeToggle<CR>

" Do not show in the nerd tree
let NERDTreeIgnore = ['\.pyc$', '\.png$']

" Search tags
map <C-k> :tag 

" Always show status
set laststatus=2
