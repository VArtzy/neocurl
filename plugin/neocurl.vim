" Title:        Neocurl
" Description:  Simple, effective and fast HTTP Client based on curl for neovim.
" Last Change:  14 June 2024
" Maintainer:   VArtzy <https://github.com/VArtzy>

command! -nargs=0 Http lua require("neocurl").execute_http_request_from_visual()
command! -nargs=0 Httpv lua require("neocurl").execute_http_request_from_visual(true)
command! -nargs=0 Httpd lua require("neocurl").execute_http_request_from_visual(false, true)
