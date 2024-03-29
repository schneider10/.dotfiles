set nocompatible
filetype plugin on


" set the path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" Syntax Plugins
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'plasticboy/vim-markdown'
Plugin 'dense-analysis/ale'
Plugin 'axelf4/vim-strip-trailing-whitespace'

" Markdown Previewer
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"

" Git helper
Plugin 'tpope/vim-fugitive'

" RipGrep
Plugin 'jremmen/vim-ripgrep'

" VimWiki
Plugin 'vimwiki/vimwiki'
let g:vimwiki_list = [
       \ {
	   \	'path': '~/Code/schneider10.github.io/wiki',
 	   \	'path_html': '~/Code/schneider10.github.io/docs',
	   \	'ext': '.md',
 	   \    'syntax': 'markdown',
       \   	'custom_wiki2html': '~/go/bin/vimwiki-godown',
 	   \	'auto_toc': 1}
 	   \ ]


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" =================================
"       Hotkey Mappings
" =================================

" Rebind <Leader> key
let mapleader = ","

" Moving between windows in split mode
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Better tabbing - Note that in insert mode you can backtab with backspace.
set tabstop=4
set shiftwidth=4
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

:ca mdp MarkdownPreview

" show line break with arrow graphic
set showbreak=↪\

" Set file title
set title

" Redo without ctrl
nnoremap U <C-r>

"Example macro for quoting
let @q="I'\<Esc>ea'\<Esc>"
" =================================
"       Python IDE Setup
" =================================

" Show unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Syntax Highlighting
let python_highlight_all=1
syntax on

" Color scheme
" =================================
"       Default Settings
" =================================

set encoding=utf-8

" Better copy & paste
set clipboard=unnamed

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2 " make backspace normal

" Useful settings
set history=700
set undolevels=700
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set number  " show line numbers

" Make search case insensitive
set incsearch
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
" set nobackup
" set nowritebackup

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
  hi Search ctermbg=DarkRed
  hi Search ctermfg=Black
endif

" allow dot command for block selections
vnoremap . :normal .<CR>

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
