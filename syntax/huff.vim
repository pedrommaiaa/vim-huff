" syntax/huff.vim
" Language:     Huff
" Maintainer:   Pedro Maia (https://github.com/pedrommaiaa)
" URL:          https://github.com/pedrommaiaa/vim-huff

if exists("b:current_syntax")
    finish
endif

syn keyword opInputs sstore sload mstore8 mstore mload pop msize balance address returndatacopy

syn region huffComment start=/\/\// end=/$/


hi def link opInputs Opcodes
hi def link huffComment Comment


let b:current_syntax = "huff"
