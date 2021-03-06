let g:pqf_signs_default = {
  \ 'E': 'E',
  \ 'W': 'W',
  \ 'H': 'H',
  \ 'I': 'I'
  \ }

let g:pqf_signs = get(g:, 'pqf_signs', g:pqf_signs_default)

let s:hidden_sign = '>$<'

function! pqf#quickfixtextfunc(info) abort
  let items = a:info.quickfix
    \ ? getqflist(#{id: a:info.id, items: 1}).items
    \ : getloclist(a:info.winid, #{id: a:info.id, items: 1}).items

  let lines = []
  let pad_len = 0
  let no_sign = 1
  for idx in range(a:info.start_idx - 1, a:info.end_idx - 1)
    let item = items[idx]

    let text = trim(item.text)
    if has_key(g:pqf_signs, item.type)
      let no_sign = 0
    endif
    let sign = get(g:pqf_signs, item.type, ' ')

    let filepath = bufname(item.bufnr)->fnamemodify(':p:~:.')->pathshorten(2)
    if item.lnum
      let loc = filepath.':'.item.lnum
    else
      let loc = ''
    endif
    if item.col
      let loc = loc.':'.item.col
    endif

    let len = len(loc)
    if len > pad_len
      let pad_len = len
    endif
    call add(lines, #{ sign: sign, loc: loc, text: text })
  endfor
  return map(
    \ lines,
    \ { _, l -> printf('%s %s %s', no_sign ? s:hidden_sign : l.sign, l.loc == '' ? l.loc : pqf#right_pad(l.loc, pad_len), l.text) })
endfunction

function! pqf#right_pad(loc, len) abort
  return a:loc.repeat(' ', a:len - len(a:loc))
endfunction

function! pqf#syntax() abort
  for [type, kind] in
      \ [['E', 'Error'], ['W', 'Warning'], ['H', 'Hint'], ['I', 'Info']]
    if has_key(g:pqf_signs, type)
      execute printf(
        \'syn match qf%s /^%s / nextgroup=qfFileName',
        \ kind, g:pqf_signs[type])
    endif
  endfor
  execute printf('syn match qfHiddenSign /^%s / conceal nextgroup=qfFileName', s:hidden_sign)
  execute printf('syn match qfHiddenSignAndPath /^%s  / conceal', s:hidden_sign)
endfunction
