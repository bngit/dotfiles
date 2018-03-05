set nocompatible              " be ViMproved, required

" Plugin systen with 'vim-plug'
" Automatically executes filetype plugin indent on and syntax enable
call plug#begin('~/.vim/plugged')
Plug 'jlanzarotta/bufexplorer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'micbou/a.vim' " Replace with vim-scripts/a.vim to fix imcompatible with YouCompleteMe
                    " see https://github.com/Valloric/YouCompleteMe/issues/2791
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'rhysd/vim-clang-format' " format C/C++

" color scheme
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
call plug#end()

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

" for colors
set t_Co=256
set hlsearch
set background=dark
" let g:rehash256 = 1 " for color molokai
" color molokai
" color base16-default-dark
" colorscheme PaperColor
" colorscheme gruvbox
colorscheme jellybeans

" mouse
set mouse=a

set cc=100

" GUI settings
if has("gui_running")
    " set guifont=Droid\ Sans\ Mono\ Regular\ 14
    " set guifont=Consolas\ 11
    set guifont=Ubuntu\ Mono\ 13
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    "set guioptions-=T  "remove toolbar
    "set guioptions-=m  "remove menu bar
    " colorcolumn
endif

" format control
set tabstop=4 " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4
set expandtab " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
              " use CTRL-V<Tab> to insert real <Tab>
set softtabstop=4 " Number of spaces that a <Tab> counts for while performing editing

set nowrap  " not wrap the line
set cindent
" set autoindent
set cino=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,/0,(s,us,U0,w0,W0,m0,j0,J0,)20,*70,#0

" display on screen
set showcmd
set completeopt=longest,menu
set laststatus=2
set linespace=1
set nu
set foldcolumn=2
set textwidth=100
set sidescroll=1
set listchars+=precedes:<,extends:>

" disable bell in vim
set noeb vb t_vb=

" mapping
so ~/.vim/config/cscope_maps.vim
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

" set the list chars
set list listchars=tab:»\ ,precedes:←,extends:→,nbsp:␣,trail:∙

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""Plug 'ctrlpvim/ctrlp.vim'"""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_extensions = ['tag', 'buffertag']

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|out)$',
    \ 'file': '\v\.(exe|so|dll|so|swp|IAD|o|workspace|depend|layout|cbp)$',
    \ 'link': 'some_bad_symbolic_links',}
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'


"""""""""""""""""""""Plugin 'a.vim'"""""""""""""""""""""
let g:alternateSearchPath = 'sfr:../.,sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:Pointiinc,sfr:groupinc,sfr:Pointkinc,sfr:publicinc,sfr:Turniinc,sfr:include'


"""""""""""""""""""""Plugin 'octol/vim-cpp-enhanced-highlight'"""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1


"""""""""""""""""""""Plugin 'Yggdroot/indentLine'"""""""""""""""""""""
let g:indentLine_char = '┊'
let g:indentLine_concealcursor='nc' " fix issues when editing json files


"""""""""""""""""""""Plugin 'Valloric/YouCompleteMe'"""""""""""""""""""""
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


"""""""""""""""""""""Plug 'majutsushi/tagbar'"""""""""""""""""""""
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30
let g:tagbar_right = 1

" for the vimwiki to use tagbar
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.vim/config/vwtags.py'
          \ , 'ctagsargs': 'default'
          \ }


"""""""""""""""""""""Plugin 'luochen1990/rainbow'"""""""""""""""""""""
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle


"""""""""""""""""""""Plug 'airblade/vim-gitgutter'"""""""""""""""""""""
let g:gitgutter_max_signs = 9999  " default value


"""""""""""""""""""""Plug 'rhysd/vim-clang-format'"""""""""""""""""""""
let g:clang_format#style_options = {
            \ "BasedOnStyle": "LLVM",
            \ "IndentWidth": 4,
            \ "BreakBeforeBraces": "Stroustrup",
            \ "BreakBeforeBinaryOperators": "NonAssignment",
            \ "ColumnLimit": 100,
            \ "AlignAfterOpenBracket": "DontAlign",
            \ "AccessModifierOffset": -4,
            \ "ContinuationIndentWidth": 4}
