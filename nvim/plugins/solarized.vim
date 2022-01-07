Plug 'altercation/vim-colors-solarized'

syntax enable
set background=dark

augroup SolarizedOverrides
    autocmd!
    autocmd User PlugLoaded ++nested colorscheme solarized
augroup end
