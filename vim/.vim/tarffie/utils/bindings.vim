source ~/.vim/tarffie/utils/handlers.vim

" Tarffie bindings-file for ndings-file for vim
nnoremap ' `
nnoremap ` '

nnoremap <Space> <Nop>
let mapleader = " "  " Explicitly set <Leader> to <Space>

" Scope File binding (assuming 'Scope' is a plugin command)
nnoremap <Leader>pf :Scope File<CR>
nnoremap <Leader>xb :Scope Buffer<CR>
nnoremap <C-s> :Scope BufSearch<CR>

" Open :E (netrw file explorer)
nnoremap <Leader>pv :Explore<CR>

" Restart vim sourcing vimrc
nnoremap <Leader>rv :source $MYVIMRC <CR>

"#################################################
"######### Text Editing custom bindings ##########
"#################################################
nnoremap <Leader>f :Autoformat <CR>
nnoremap <Leader>R :YcmCompleter RefactorRename <new name> <CR>

nnoremap <Leader>R :call RenameWithYCM()<CR>

" Sudo write (your existing command, just cleaned up)
command! -nargs=0 Sw w !sudo tee % > /dev/null)))vim


"#####################################"
"############# VIM MOVE ##############"
"#####################################"

let g:move_normal_option = 1

let g:move_key_modifier = 'A-S'
let g:move_key_modifier_visualmode = 'A-S'

" Move line down with Alt+Shift+J (escape sequence \033J)
execute "set <M-J>=\033J"
nnoremap <M-J> :m+<CR>==
inoremap <M-J> <Esc>:m+<CR>==gi
vnoremap <M-J> :m+<CR>gv=gv

" Move line up with Alt+Shift+K (escape sequence \033K)
execute "set <M-K>=\033K"
nnoremap <M-K> :m-2<CR>==
inoremap <M-K> <Esc>:m-2<CR>==gi
vnoremap <M-K> :m-2<CR>gv=gv"")""")"

" Go To
nnoremap <Leader>. :YcmCompleter GoTo<CR>
