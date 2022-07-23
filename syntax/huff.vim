" syntax/huff.vim
" Language:     Huff
" Maintainer:   Pedro Maia (https://github.com/pedrommaiaa)
" URL:          https://github.com/pedrommaiaa/vim-huff

if exists("b:current_syntax")
    finish
endif

syn match huffInclude '#include'
syn match huffDefine  '#define'

syn keyword huffKeyword takes returns

syn region huffComment start=/\/\// end=/$/
syn region huffComment start=/\/\*/ end=/\*\//
syn region huffString  start=/\v"/ skip=/\v\\./ end=/\v"/
syn region huffString  start=/\v'/ skip="/v\\." end="/v'"


hi def link huffComment Comment
hi def link huffString  String
hi def link huffInlcude Special
hi def link huffDefine  Define
hi def link huffKeyword Keyword


let b:current_syntax = "huff"
