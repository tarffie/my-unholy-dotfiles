" vim-plug calls
call plug#begin()
Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'tinted-theming/base16-vim'
Plug 'ycm-core/youcompleteme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'vim-airline/vim-airline'
Plug 'girishji/scope.vim'
Plug 'vim-autoformat/vim-autoformat'
Plug 'matze/vim-move'
call plug#end()
