" prepend to path so we prioritize loading locally over a paq installation in
" XDG_HOME
set rtp^=.
runtime plugin/plenary.vim

nnoremap ,,x :luafile %<CR>
