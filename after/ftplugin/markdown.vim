" Vim filetype plugin file
" Language:     Markdown
" Maintainer:   viniciusban


" =================================
" Undo configs made by vim-polyglot
" =================================

setlocal indentexpr=
setlocal formatoptions-=r
setlocal formatoptions+=c
setlocal comments-=b:*
setlocal comments-=b:+
setlocal comments-=b:-


" =========================
" Let's do something useful
" =========================

setlocal autoindent
setlocal nofoldenable foldmethod=indent
" Indenting in lists and blockquotes with tab
setlocal tabstop=3

" Indenting with >>
setlocal shiftwidth=2

" Numbered lists: a number followed by ":", "." or ")" and a space
setlocal formatlistpat=^\\s*\\d\\+[:.)]\\s*

" Format numbered lists correctly with "gq" and "gw"
setlocal formatoptions+=n

" Make headings
" -------------
nmap <silent> <buffer> <localleader>1 :let x=substitute(getline("."), "^#* *", "# ", "")<CR>:let x=substitute(x, " *#*$", " #", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>2 :let x=substitute(getline("."), "^#* *", "## ", "")<CR>:let x=substitute(x, " *#*$", " ##", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>3 :let x=substitute(getline("."), "^#* *", "### ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>4 :let x=substitute(getline("."), "^#* *", "#### ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>

" Navigate through headings
" -------------------------

" Next/previous heading (any level)
nmap <silent> <buffer>  ]] :call search("^#\\+ ", "Wzs")<CR>
nmap <silent> <buffer>  [[ :call search("^#\\+ ", "bWzs")<CR>

" Next/previous h2
nmap <silent> <buffer>  ]2 :call search("^## ",   "Wzs")<CR>
nmap <silent> <buffer>  [2 :call search("^## ",   "bWzs")<CR>

" Next/previous h3
nmap <silent> <buffer>  ]3 :call search("^### ",  "Wzs")<CR>
nmap <silent> <buffer>  [3 :call search("^### ",  "bWzs")<CR>
