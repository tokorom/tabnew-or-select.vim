command! -nargs=* -complete=file TabNewOrSelect :call tabnew_or_select#run(<f-args>)

