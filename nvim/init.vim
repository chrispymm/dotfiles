"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
set path+=**

set wildmode=longest:full,full
set wildmenu
" ignore files
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

set expandtab
set shiftwidth=4
set tabstop=4
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell spelllang=en_gb
set title
set ignorecase
set smartcase
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set splitbelow
set clipboard=unnamedplus
set confirm
set showmode
" set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set textwidth=80
set colorcolumn=+1
set cursorline
set laststatus=3
set winbar=%=%m\ %f
"disable automatic line wrapping at textwidth use gq to auto-wrap
"comments to textwidth
set fo=cqj

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-ruby/vim-ruby'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
Plug 'heavenshell/vim-jsdoc', {
      \ 'for': ['javascript', 'javascript.jsx','typescript'],
      \ 'do': 'make install'
      \}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'moll/vim-bbye'
Plug 'nvim-lualine/lualine.nvim'
Plug 'ahmedkhalf/project.nvim'
Plug 'windwp/nvim-autopairs' " Autopairs, integrates with both cmp and treesitter
Plug 'folke/which-key.nvim'

" LSP & Completion
Plug 'neovim/nvim-lspconfig'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'williamboman/mason.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim' " for formatters and linters

" Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'

au BufRead,BufNewFile *.njk set filetype=html
Plug 'glench/vim-jinja2-syntax'

" Git
Plug 'lewis6991/gitsigns.nvim'

call plug#end()


"-------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------
let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>nhl :nohlsearch<CR>
nmap <leader>rnu :set relativenumber!<CR>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Make Y behave like the other capitals
nnoremap Y yg$

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz


" Open the current file in the default program
nmap <leader>x :!xdg-pen %<CR><CR>

" Quicky escape to normal mode
imap jj <esc>

" Easy insertion of a trailing ; or , from insert mode
" imap ;; <Esc>A;<Esc>
" imap ,, <Esc>A,<Esc>

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <leader>o :SymbolsOutline<CR>

" Start search and replace for wortd under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Quicker window movement
" Commented out due to using vim-tmux-navigator
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

nnoremap <C-A-Down> :resize -2<CR>
nnoremap <C-A-Up> :resize +2<CR>
nnoremap <C-A-Right> :vertical resize +5<CR>
nnoremap <C-A-Left> :vertical resize -5<CR>

nnoremap <C-A-+> :resize max(map(range(1, line('$')), "col([v:val, '$'])")) - 1<CR>
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" basic mapping to avoid the problem with fast fingers =P
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

" Manually map NetRw shortcut commands
command! Vex Vexplore
command! Sex Sexplore

inoremap <C-c> <esc>

" RSpec.vim mappings
let g:test#runner_commands = ['Rspec', 'Mocha']
let g:test#javascript#runner = 'mocha'
let test#javascript#mocha#options = '--recursive'

let test#ruby#rspec#options = '--format progress --require ~/code/support/rspec/quickfix_formatter.rb --format QuickfixFormatter --out quickfix.out'
let test#strategy = "vimux"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

map <Leader>vq :VimuxCloseRunner<CR>
map <leader>qf :cg quickfix.out \| cwindow<CR>
map <Leader>vqf :VimuxCloseRunner<CR> :cg quickfix.out \| cwindow<CR>

"--------------------------------------------------------------------------
" Commands
"--------------------------------------------------------------------------
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =




lua require("chrispymm")

source ~/.config/nvim/plugins/dracula.vim
" source ~/.config/nvim/plugins/vim-code-dark.vim
" source ~/.config/nvim/plugins/fzf.vim
" source ~/.config/nvim/plugins/lightline.vim
" source ~/.config/nvim/plugins/floatterm.vim
" source ~/.config/nvim/plugins/vim-project.vim
" source ~/.config/nvim/plugins/cmp.vim

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>ca <cmd>lua require('telescope.builtin').lsp_code_actions()<cr>

" Background colors for active vs inactive windows
hi ActiveWindow guibg=#282A36
hi InactiveWindow guibg=#30323E
hi WinSeparator guibg=none
hi WinSeparator guifg=#5B5D69

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
  autocmd WinLEave * call Handle_Win_Leave()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
  setlocal cc=+1
  set cursorline
endfunction

function Handle_Win_Leave()
  setlocal cc=0
  set nocursorline
endfunction

"--------------------------------------------------------------------------
" Miscellaneous
"--------------------------------------------------------------------------
runtime macros/matchit.vim


