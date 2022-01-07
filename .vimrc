
set nocompatible              " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'                 " Pretty Colors
Plug 'itchyny/lightline.vim'                            " Statusline
Plug 'tpope/vim-fugitive'                               " Git Integration
Plug 'tpope/vim-commentary'                             " CommentinG
Plug 'tpope/vim-vinegar'                                " Enhancements to netrw
Plug 'tpope/vim-surround'                               " surround motions
Plug 'ludovicchabant/vim-gutentags'                     " Tags
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                 " Vim commands for FZF
Plug 'ruyadorno/vim-change-indent'                      " Indentation conversion
" Plug 'preservim/nerdtree'                               " Project Tree
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " Autocompletion Engine
Plug 'tpope/vim-dispatch'                               " VIM Laravel Dependency
Plug 'tpope/vim-projectionist'                          " VIM Laravel Dependency
Plug 'noahfrederick/vim-composer'                       " VIM Laravel Dependency
Plug 'noahfrederick/vim-laravel'                        " Handy Laravel specific commands
Plug 'airblade/vim-gitgutter'                           " Git Diff indicators in the gutter

Plug 'vim-vdebug/vdebug'

Plug 'StanAngeloff/php.vim', { 'for': 'php' }           " php syntax highlighting
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }       " php coding standards fixer
Plug 'jwalton512/vim-blade'                             " syntax highlighting for blade templates
Plug 'nelsyeung/twig.vim'                               " syntax highlighting for twig

Plug 'editorconfig/editorconfig-vim'                    " Respect editorconfig
" All of your Plugins must be added before the following line
call plug#end()


set encoding=utf-8


set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set showmode      " Show in what mode we are
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline


" ==== Display settings ====
" P - whatever is yanked is automatically put in the system clipboard
" m - show menu bar
set guioptions=m



" Remember the last 100 commands on the command-line
set history=1000
" Hide buffers instead of unloading them
" If we unload a buffer it means it's local history/undo stack
" will be gone if we switch buffers
set hidden

" Tab settings
set tabstop=4      " One tab is 4 space
set shiftwidth=4   " Number of spaces for (auto)indent
set shiftround     " Round indent to multiple of shiftwidth
set expandtab      " Expand tabs to spaces
set softtabstop=4   

" Colorscheme Settings
syntax enable
set background=dark
colorscheme solarized

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set cursorline
"disable automatic line wrapping at textwidth use gq to auto-wrap
"comments to textwidth
set fo=cq 

" Numbers
set number relativenumber
set numberwidth=5

" Set tags for vim-fugitive
set tags^=.git/tags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" increase Vims update time
set updatetime=200



" Leader
let mapleader = " "


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'


""""""""""""""""""""""""""""""""
" Lightline Settings
""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }




""""""""""""""""""""""""""""""""
" Blade settings 
""""""""""""""""""""""""""""""""
" Define some single Blade directives. This variable is used for highlighting only.
let g:blade_custom_directives = []

" Define pairs of Blade directives. This variable is used for highlighting and indentation.
"let g:blade_custom_directives_pairs = {
"      \   'markdown': 'endmarkdown',
"      \   'cache': 'endcache',
"      \ }

""""""""""""""""""""""""""""""""
" PHP CS Settings
""""""""""""""""""""""""""""""""
" Fix directory
nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
" Fix File
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>



"""""""""""""""""""""""""""""""
" COC Settings
"""""""""""""""""""""""""""""""
"
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction



" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" GutenTags Config
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
" let g:gutentags_cache_dir = '~/.vim/gutentags'


""""""""""""""""""""""""""""""""""""""""
" FZF Settings
""""""""""""""""""""""""""""""""""""""""

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" FZF window will take almost full screen
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

" sets FZF to us RG (ripgrep) and to ignore some folders when searching
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'

" changes file preview window to take 60% of the FZF window, will place 
" search bar on top with a bit of margin,
"let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

" changes file preview window to take 60% of the FZF window, will place 
" search bar on top with a bit of margin, will also color the preview 
" using the Bat CLI app (it's an alternative to Cat(0) which uses 
" syntax highlighting and allows using themes, like Dracula, from
" the Brazilian developer, @Zenorocha. To use one of the themes, 
" it's advised to set the env var BAT_THEME into your profile 
" file - i.e, ~/.zshrc - to the name of theme you want to use
" and Bat allows to use)
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" nerdTree Config
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" basic mapping to avoid the problem with fast fingers =P
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Manually map NetRw shortcut commands 
command! Vex Vexplore
command! Sex Sexplore


" ========================
"
" VDebug Settings
" 
" ========================
if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
let g:vdebug_options.port = 9100
let g:vdebug_options.break_on_open = 0
let g:vdebug_options.path_maps = {
  \ "/home/vagrant/sites/myriad" : "/Users/chrispymm/Sites/myriad"
  \ }
" Fix on Save
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
" Coc Format on Save
autocmd BufWritePost *.php silent! call CocAction('format')

