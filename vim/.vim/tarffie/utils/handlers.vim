set backup

if !isdirectory($HOME."/.vim-tmp")
  silent! execute "!mkdir ~/.vim-tmp"
endif

:set backupdir=~/.vim-tmp
:set directory=~/.vim-tmp

function! RenameWithYCM() abort
  call inputsave()
  let new_name = input("new name: ")
  call inputrestore()

  if empty(new_name)
    echo "Cancelled: No name provided"
    return
  endif

  execute 'YcmCompleter RefactorRename ' . new_name
endfunction
