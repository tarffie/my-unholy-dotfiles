nnoremap ' `
nnoremap ` '

nnoremap <SPACE> <Nop> 
map <SPACE> <Leader>   

command! -nargs=0 Sw w !sudo tee % > /dev/null
