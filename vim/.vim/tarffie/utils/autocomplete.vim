filetype plugin on 

:set omnifunc=syntaxcomplete#Complete
:set completeopt=longest,menuone

:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
:inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

:inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

:inoremap ( ()<Left>
:inoremap [ []<Left>
:inoremap { {}<Left>

:inoremap <expr> <CR> search('{\%#}', 'n') ? "\<CR>\<CR>\<Up>\<C-f>" : "\<CR>"

" 
" inoremap <expr> <CR>         --- map the <CR> key using an expression
"   search('{\%#}', 'n') ?    --- is the cursor ('\%#') between '{'and '}' ?
"   "\<CR>\<CR>\<Up>\<C-f>"   --- if so, press <CR> twice, go <Up> a line, and autoindent (<C-f>),
"   :                         --- otherwise, 
"   \<CR>"                   --- press <CR>.
"
"link from where I got that :
"https://vi.stackexchange.com/questions/31702/how-to-make-vim-automatically-insert-closing-delimiters-and-new-lines-like-subli
"kek 
