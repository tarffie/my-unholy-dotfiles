autocmd FileType javascript setlocal shiftwidth=2

:let b:ale_fixers = ['prettier', 'eslint']
:let g:ale_fix_on_save = 1

autocmd FileType javascript setlocal shiftwidth=2
:set list
:set listchars=""                      " reset
:set listchars=tab:→\
:set listchars+=trail:·
