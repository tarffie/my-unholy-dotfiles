" vim-plug calls 
call plug#begin()
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'tinted-theming/base16-vim'
Plug 'ycm-core/youcompleteme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
