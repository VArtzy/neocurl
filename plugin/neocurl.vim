" Title:        Neocurl
" Description:  Simple, effective and fast HTTP Client based on curl for neovim.
" Last Change:  14 June 2024
" Maintainer:   VArtzy <https://github.com/VArtzy>

if exists(g:neocurl)
    finish
endif
let g:neocurl = 1

command! -nargs=0 Http lua require("neocurl").exec()
command! -nargs=0 Httpv lua require("neocurl").exec(true)
command! -nargs=0 Httpd lua require("neocurl").exec(false, true)
