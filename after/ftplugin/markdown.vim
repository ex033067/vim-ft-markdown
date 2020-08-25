" Vim filetype plugin file
" Language:     Markdown
" Maintainer:   viniciusban


" Avoid loading indent file.
"
" Not only for markdown, but for all filetypes. That's how vim works.
"
" I disable loading indent file for markdown because:
"
"   1. vim-polyglot erroneously set configs in indent file;
"   2. Theses configs messes with list formatting;
"   3. "vim-polyglot/after/indent" is loaded after this script.
"
" Thus, the whole process is:
"
"   1. Read the markdown file;
"   2. Run this script (disable ident file);
"   3. Load the markdown file to buffer;
"   4. Re-enable filetype for all filetypes in "BufEnter" event.
filetype indent off

augroup vim-ft-markdown
    autocmd!
    autocmd BufEnter *.{md,mdown,mkd,mkdn,markdown,mdwn} filetype indent on
augroup END


" =========================
" Let's do something useful
" =========================

setlocal autoindent

" folded headings
let g:markdown_folding=1
setlocal foldlevel=1

" Automatically continue blockquote on line break
setlocal comments=n:>,b:>

" Indenting in lists and blockquotes with tab
setlocal tabstop=3

" Indenting with >>
setlocal shiftwidth=2

" Numbered and unnumbered lists
setlocal formatlistpat=^\\s*\\d\\+[:.)]\\s\\\|^\\s*[-*+]\\s

" Format lists correctly with "gq" and "gw"
setlocal formatoptions=tcqlnr

" Make headings
nmap <silent> <buffer> <localleader>1 :let x=substitute(getline("."), "^#* *", "# ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>2 :let x=substitute(getline("."), "^#* *", "## ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>3 :let x=substitute(getline("."), "^#* *", "### ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>
nmap <silent> <buffer> <localleader>4 :let x=substitute(getline("."), "^#* *", "#### ", "")<CR>:let x=substitute(x, " *#*$", "", "")<CR>:call setline(line("."), x)<CR>

" Go to next/previous heading (any level)
nmap <silent> <buffer>  ]] :call search("^#\\+ ", "Wzs")<CR>
nmap <silent> <buffer>  [[ :call search("^#\\+ ", "bWzs")<CR>

" Go to next/previous heading (of some level)
nmap <silent> <buffer>  ]1 :call search("^# ", "Wzs")<CR>
nmap <silent> <buffer>  [1 :call search("^# ", "bWzs")<CR>
nmap <silent> <buffer>  ]2 :call search("^## ", "Wzs")<CR>
nmap <silent> <buffer>  [2 :call search("^## ", "bWzs")<CR>
nmap <silent> <buffer>  ]3 :call search("^### ", "Wzs")<CR>
nmap <silent> <buffer>  [3 :call search("^### ", "bWzs")<CR>

" Add a codeblock paragraph
autocmd FileType markdown imap <buffer> <localleader>` <Esc><Esc>a```<CR><CR>```<Esc>ka
