" syntax/huff.vim
" Language:     Huff
" Maintainer:   Pedro Maia (https://github.com/pedrommaiaa)
" URL:          https://github.com/pedrommaiaa/vim-huff

if exists("b:current_syntax")
    finish
endif

syn match huffInclude '#include'
syn match huffDefine  '#define'

syn keyword huffKeyword     takes returns 
syn keyword huffKeyword     return
syn keyword huffBuiltinType address
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
hi def link huffInclude     Include 
hi def link huffDefine      Define
hi def link huffKeyword     Keyword
hi def link huffBuiltinType Type

" Assembly
syn keyword huffAssemblyMethod stop add sub mul div sdiv mod smod exp not lt gt slt sgt eq iszero 
syn keyword huffAssemblyMethod and or xor byte shl shr sar addmod mulmod signextend keccak256 jump
syn keyword huffAssemblyMethod jumpi pop mload mstore mstore8 sload sstore calldataload calldatacopy
syn keyword huffAssemblyMethod codecopy extcodesize extcodecopy returndatacopy extcodehash create create2
syn keyword huffAssemblyMethod call callcode delegatecall staticcall return revert selfdestruct
syn keyword huffAssemblyMethod log0 log1 log2 log3 log4 blockhash
syn keyword huffAssemblyMethod swap1 swap2 swap3 swap4 swap5 swap6 swap7 swap8 swap9 swap10 swap11 swap12 
syn keyword huffAssemblyMethod swap13 swap14 swap15 swap16
syn keyword huffAssemblyMethod dup1 dup2 dup3 dup4 dup5 dup6 dup7 dup8 dup9 dup10 dup11 dup12 dup13 dup14
syn keyword huffAssemblyMethod dup15 dup16
syn keyword huffAssembltConst  pc msize gas address caller callvalue calldatasize codesize
syn keyword huffAssembltConst  returndatasize origin gasprice coinbase timestamp number difficulty gaslimit

hi def link huffAssemblyMethod Special
hi def link huffAssemblyConst  Constant

" Macro
syn keyword huffMacro      nextgroup=huffMacroName skipwhite skipempty macro
syn match huffMacroName    contained nextgroup=huffMacroParens skipwhite skipempty '\v<[A-Z_][0-9A-Z_]*'
syn region huffMacroParens start='(' end=')' skipwhite skipempty

hi def link huffMacro     Keyword
hi def link huffMacroName Function

" Constant Definition
syn keyword huffConstant nextgroup=huffConstName skipwhite skipempty constant
syn match huffConstName  contained skipwhite skipempty '\v<[a-zA-Z_][0-9a-zA-Z_]*'

hi def link huffConstant  Define 
hi def link huffConstName Constant 

" Events
syn keyword huffEvent    nextgroup=huffEvent skipwhite skipempty event
syn match huffEventName  contained nextgroup=huffEventArgs skipwhite skipempty '\v<[a-zA-Z_][0-9a-zA-Z_]*'
syn region huffEventArgs contained start='(' end=')' contains=huffComma,huffBuiltinType skipempty skipwhite

hi def link huffEvent     Define
hi def link huffEventName Function

" Functions 
syn keyword huffFunction     nextgroup=huffFuncName,huffFuncArgs skipwhite skipempty function
syn match huffFuncName       contained nextgroup=huffFuncArgs skipwhite skipempty '\v<[a-zA-Z_][0-9a-zA-Z_]*'
syn region huffFuncArgs      contained start='(' end=')' contains=huffComma,huffBuiltinType nextgroup=huffFuncModifier,huffFuncReturn skipempty skipwhite
syn keyword huffFuncModifier contained nextgroup=huffFuncModifier,huffFuncReturn skipwhite skipempty external internal nonpayable public pure view private contant override virtual
syn keyword huffFuncReturn   contained nextgroup=huffFuncRetParens skipwhite skipempty returns
syn region huffFuncRetParens contains=huffBuiltinType,huffComma start='(' end=')' skipwhite skipempty

hi def link huffFunction      Define 
hi def link huffFuncName      Function
hi def link huffFuncModifier  Keyword 
hi def link huffFuncReturn    Special

" Numbers
syntax match  huffNumber '\v0x\x+>'
syntax match  huffNumber '\v\c<%(\d+%(e[+-]=\d+)=|0b[01]+|0o\o+|0x\x+)>'
syntax match  huffNumber '\v\c<%(\d+.\d+|\d+.|.\d+)%(e[+-]=\d+)=>'

hi def link   huffNumber Number

" Common Groups
syn match huffComma ','

hi def link huffComma Normal


let b:current_syntax = "huff"
