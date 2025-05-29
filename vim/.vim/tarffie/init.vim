" the big source import
source ~/.vim/tarffie/utils/utils.vim
source ~/.vim/tarffie/plugins/getPlugged.vim
source ~/.vim/tarffie/ftplugin/javascript.vim
source ~/.vim/tarffie/ftplugin/rust.vim

" the big set section
:set encoding=utf-8
:set title
:set tabstop=2
:set shiftwidth=2
:set expandtab
:set relativenumber
:set smartindent
:set autoindent
:set hidden
:set scrolloff=3
:set history=1000
:set wildmenu

runtime macros/matchit.vim

set termguicolors
set background=dark
set termguicolors
colorscheme deep-space

au BufWrite * :Autoformat
