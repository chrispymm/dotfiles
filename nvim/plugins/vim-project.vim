set rtp+=~/.vim/bundle/vim-project/
let g:project_enable_welcome = 1
let g:project_use_nerdtree = 0

if get(g:, 'project_enable_welcome', 1)
  au VimEnter *
        \ if !argc() && (line2byte('$') == -1) && (v:progname =~? '^[gmn]\=vim\%[\.exe]$') |
        \   call project#config#welcome() |
        \ endif
endif

source ~/Projects.vim
