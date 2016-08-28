set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_extensions = ['tag', 'buffertag']

"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|out)$',
    \ 'file': '\v\.(exe|so|dll|so|swp|IAD|o|workspace|depend|layout|cbp)$',
    \ 'link': 'some_bad_symbolic_links',}

