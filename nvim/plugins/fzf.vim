""""""""""""""""""""""""""""""""""""""""
" FZF Settings
""""""""""""""""""""""""""""""""""""""""

" FZF window will take almost full screen
let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5 } }

" sets FZF to us RG (ripgrep) and to ignore some folders when searching
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'

" changes file preview window to take 60% of the FZF window, will place 
" search bar on top with a bit of margin, will also color the preview 
" using the Bat CLI app (it's an alternative to Cat(0) which uses 
" syntax highlighting and allows using themes, like Dracula, from
" the Brazilian developer, @Zenorocha. To use one of the themes, 
" it's advised to set the env var BAT_THEME into your profile 
" file - i.e, ~/.zshrc - to the name of theme you want to use
" and Bat allows to use)
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"


" Map Ctrl + p to open fuzzy find (FZF)
" nnoremap <c-p> :Files<cr>


nmap <leader>f :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>h :History<cr>
nmap <leader>r :Rg<cr>
nmap <leader>R :Rg<space>
nmap <leader>gb :GBranches<cr>
