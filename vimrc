set nocompatible              " be ViMproved, required
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
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Yggdroot/indentLine'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'

" color scheme
Plugin 'nanotech/jellybeans.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'

call vundle#end()            " required
filetype plugin indent on    " required

so ~/.vim/config/ctrlp_config.vim
so ~/.vim/config/Tagbar_config.vim
so ~/.vim/config/vimwiki_config.vim

syntax on

" formatting for muti-byte character
set fo+=mM

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

set t_Co=256
set hlsearch
so ~/.vim/config/cscope_maps.vim

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set showcmd
set completeopt=longest,menu
set laststatus=2
set nowrap	" not wrap the line
set cindent
" set autoindent
set cino=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,/0,(s,us,U0,w0,W0,m0,j0,J0,)20,*70,#0

" GUI settings
if has("gui_running")
"    set guifont=monaco\ 10
"    set guifont=Ubuntu\ Mono\ 11
    set guifont=Consolas\ 11
    "set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    "set guioptions-=m  "remove menu bar
    " colorcolumn
    set cc=120
    " for line space
    set lsp=1
endif

" set indicator
set nu
set foldcolumn=2
set textwidth=100
set sidescroll=1
set listchars+=precedes:<,extends:>
" set cursorline
let g:rehash256 = 1
" color molokai
color base16-default-dark
set background=dark
" colorscheme PaperColor

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

" set the list chars
set list listchars=tab:»\ ,precedes:←,extends:→,nbsp:␣,trail:∙


"set laststatus=2
"let g:airline_theme="molokai"
"set ttimeoutlen=50
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0


"""""""""""""""""""""Plugin 'a.vim'"""""""""""""""""""""
let g:alternateSearchPath = 'sfr:../.,sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:Pointiinc,sfr:groupinc,sfr:Pointkinc,sfr:publicinc,sfr:Turniinc,sfr:include'


"""""""""""""""""""""Plugin 'w0rp/ale'"""""""""""""""""""""
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


"""""""""""""""""""""Plugin 'octol/vim-cpp-enhanced-highlight'"""""""""""""""""""""
let g:cpp_class_scope_highlight = 1


"""""""""""""""""""""Plugin 'scrooloose/nerdtree'"""""""""""""""""""""
let g:netrw_keepdir= 0
"map <leader>n :NERDTreeToggle<CR>
nmap <silent> <F3> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$' ]
let g:netrw_home='~/bak'
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" keep the current directory the same as the browsing directory.
let g:netrw_keepdir= 0


"""""""""""""""""""""Plugin 'Yggdroot/indentLine'"""""""""""""""""""""
let g:indentLine_char = '┊'


"""""""""""""""""""""Plugin 'Valloric/YouCompleteMe'"""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf='/home/not/Script/ycm_extra_conf.py'
"let g:ycm_register_as_syntastic_checker=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_show_diagnostics_ui = 0   " disable syntex check
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_enable_diagnostic_signs = 0
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_max_diagnostics_to_display = 30


"""""""""""""""""""""Plugin 'scrooloose/nerdcommenter'"""""""""""""""""""""
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Specifies whether to add extra spaces around delimiters
let g:NERDSpaceDelims = 1

