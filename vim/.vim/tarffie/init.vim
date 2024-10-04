" the big source import 
source ~/.vim/tarffie/utils/utils.vim
source ~/.vim/tarffie/plugins/getPlugged.vim
source ~/.vim/tarffie/ftplugin/javascript.vim

" the big set section
:set encoding=utf-8
:set title
:set relativenumber
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set smartindent
:set autoindent
:set hidden
:set scrolloff=3
:set history=1000
:set wildmenu

runtime macros/matchit.vim

set termguicolors

" styling or something, making it a bit nicer
let base16_colorspace=256 " Access colors present in 256 colorspace
" Make vim background transparent to work alongside transparent terminal backgrounds
let base16_background_transparent=1

set background=dark
"colorscheme base16-uwunicorn
colorscheme base16-emil
