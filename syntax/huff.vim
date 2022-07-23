" syntax/huff.vim
" Language:     Huff
" Maintainer:   Pedro Maia (https://github.com/pedrommaiaa)
" URL:          https://github.com/pedrommaiaa/vim-huff

if exists("b:current_syntax")
    finish
endif

syn match huffInclude '#include'
syn match huffDefine  '#define'

syn keyword huffKeyword     takes return returns function constant
syn keyword huffKeyword     public external internal private view pure
syn keyword huffBuiltinType int int8 int16 int24 int32 int40 int48 int56 int64 int72 
syn keyword huffBuiltinType uint uint8 uint16 uint24 uint32 uint40 uint48 uint56 uint64 uint72 
syn keyword huffBuiltinType int80 int88 int96 int104 int112 int120 int128 int136 int144 int152 
syn keyword huffBuiltinType uint80 uint88 uint96 uint104 uint112 uint120 uint128 uint136 uint144 uint152 
syn keyword huffBuiltinType int160 int168 int178 int184 int192 int200 int208 int216 int224 int232 int240 int248 int256
syn keyword huffBuiltinType uint160 uint168 uint178 uint184 uint192 uint200 uint208 uint216 uint224 uint232 uint240 uint248 uint256

syn region huffComment start=/\/\// end=/$/
syn region huffComment start=/\/\*/ end=/\*\//
syn region huffString  start=/\v"/ skip=/\v\\./ end=/\v"/
syn region huffString  start="\v'" skip="\v\\." end="\v'"

hi def link huffComment     Comment
hi def link huffString      String
hi def link huffInlcude     Include 
hi def link huffDefine      Define
hi def link huffKeyword     Keyword
hi def link huffBuiltinType Type

" Function definition
syn match huffFunction  /\<function\>/ nextgroup=huffFuncName,huffFuncArgs skipwhite
syn match huffFuncName  contained /\<[a-zA-Z_$][0-9a-zA-Z_$]*/ nextgroup=huffFuncArgs skipwhite
syn region huffFuncArgs contained matchgroup=huffFuncParens start='(' end=')' contains=huffFuncArgCommas,huffBuiltinType nextgroup=huffFuncReturns keepend skipwhite skipempty
syn region huffFuncReturns contained matchgroup=huffFuncParens start='(' end=')' contains=huffFuncArgCommas,huffBuiltinType
syn match huffFuncArgCommas contained ','

hi def link huffFunction Type
hi def link huffFuncName Function

let b:current_syntax = "huff"
