set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'a.vim'
Plugin 'Tagbar'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/The-NERD-tree'
" Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
Plugin 'vimwiki/vimwiki'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'

so ~/.vim/config/ctrlp_config.vim
so ~/.vim/config/a_config.vim
so ~/.vim/config/Tagbar_config.vim
" so ~/.vim/config/YouCompleteMe_config.vim
so ~/.vim/config/NERDtree_config.vim
so ~/.vim/config/vimwiki_config.vim
so ~/.vim/config/airline_config.vim

call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" open GBK txt file correctly
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936

" persistent undo
set undofile
set undodir=$HOME/.vim/undofiles
set undolevels=1000

" set t_Co=256
set hlsearch
so ~/.vim/config/cscope_maps.vim

" set cindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set completeopt=longest,menu
set wrap	" wrap the line

" GUI settings
if has("gui_running")
"    set guifont=monaco\ 12
    set guifont=Ubuntu\ Mono\ for\ Powerline\ 13
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=m  "remove menu bar
    " colorcolumn
    set cc=100
endif

" set indicator
set nu
set foldcolumn=4
set textwidth=100
set nowrap
set sidescroll=1
set listchars+=precedes:<,extends:>
" set cursorline
let g:rehash256 = 1
color molokai

" disable bell in vim
set noeb vb t_vb=

" enter fullscreen for gvim in gnome3
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" open url in vim with 'gx'
if has("gui_running")
    let g:netrw_browsex_viewer= "setsid gnome-open"
else
    let g:netrw_browsex_viewer= "gnome-open"
endif

