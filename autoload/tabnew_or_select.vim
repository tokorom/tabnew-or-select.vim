function! tabnew_or_select#tabindex(name)
  let name = expand(a:name)

  let numberOfTabs = tabpagenr('$')
  let i = 0
  while i < numberOfTabs
    let tabindex = i + 1
    let buflist = tabpagebuflist(tabindex)
    for bufnr in buflist
      if bufname(bufnr) == name
        return tabindex
      endif
    endfor
    let i += 1
  endwhile

  return -1
endfunction

function! tabnew_or_select#run(...)
  if a:0 < 1
    return
  endif

  for name in a:000
    let name = expand(name)

    if bufexists(name)
      let tabindex = tabnew_or_select#tabindex(name)
      if tabindex > 0
        execute '' . tabindex . 'tabnext'
        return
      endif
    endif

    execute 'tabnew ' . name
  endfor
endfunction
