set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'taglist.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'a.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tomasr/molokai'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'

so ~/.vim/config/ctrlp_config.vim
so ~/.vim/config/a_config.vim
so ~/.vim/config/Tagbar_config.vim
so ~/.vim/config/YouCompleteMe_config.vim
so ~/.vim/config/NERDtree_config.vim
so ~/.vim/config/vimwiki_config.vim
so ~/.vim/config/airline_config.vim

call vundle#end()            " required
filetype plugin indent on    " required

syntax on

" open GBK txt file correctly
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,cp936
" cp936,gb18030,euc-cn  : for simplified Chinese
" cp950,big5            : for traditional Chinese
" cp932,shift-jis,sjis  : for Japanese
" cp949,euc-kr          : for Korean
" latin1
"
" Use the following command to try (% the current file name)
" :e ++enc=utf-8 %


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
" set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set completeopt=longest,menu
set laststatus=2
set wrap	" wrap the line

" GUI settings
if has("gui_running")
"    set guifont=monaco\ 12
    set guifont=Ubuntu\ Mono\ 13
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guioptions-=m  "remove menu bar
    " colorcolumn
    set cc=100
endif

" set indicator
set nu
set foldcolumn=2
set textwidth=100
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

" set the behaviour of backspace
set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start " backspace fix

" for indent_guide
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" highlight trailing whitespace
" detail see:
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=red guibg=red
augroup WhitespaceMatch
  " Remove ALL autocommands for the WhitespaceMatch group.
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match_number =
        \ matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction
