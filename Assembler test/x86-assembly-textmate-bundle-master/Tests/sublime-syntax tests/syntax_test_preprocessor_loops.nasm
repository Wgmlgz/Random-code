; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%assign i 0 
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
%rep    64 
;<- punctuation.definition.keyword.preprocessor
;^^^ keyword.control.preprocessor
        inc     word [table+2*i] 
;       ^^^ keyword.operator.word.mnemonic
%assign i i+1 
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
%endrep
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor - invalid.illegal


fibonacci: 
%assign i 0 
%assign j 1 
%rep 100 
%if j > 65535 
    %exitrep 
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif 
        dw j 
%assign k j+i 
%assign i j 
%assign j k 
%endrep 
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor - invalid.illegal
fib_number equ ($-fibonacci)/2

%macro  mymacro 1
%rep    100
    push    %1
;            ^ variable.other.preprocessor - invalid.illegal
%endrep
%endmacro

%rep    100
    push    %1
;            ^ invalid.illegal
%endrep



%exitrep
;^^^^^^^ invalid.illegal
%endrep
;^^^^^^ invalid.illegal
