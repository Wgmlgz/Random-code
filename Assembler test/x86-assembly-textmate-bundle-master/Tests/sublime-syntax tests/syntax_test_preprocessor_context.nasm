; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%push    foobar
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor
%pop     repeat
;<- punctuation.definition.keyword.preprocessor
;^^^ keyword.control.preprocessor

%macro repeat 0 
    %push   repeat 
    %$begin: 
;   ^^ punctuation.definition.keyword.preprocessor
;     ^^^^^ entity.name.constant
%endmacro 

%macro until 1 
        j%-1    %$begin 
    %pop
%endmacro

%define %$localmac 3
%$$localmac
%$$$localmac
;<- punctuation.definition.keyword.preprocessor
;^^^ punctuation.definition.keyword.preprocessor
;   ^^^^^^^^ entity.name.constant

; deprecated
%macro ctxthru 0 
%push ctx1 
    %assign %$external 1 
        %push ctx2 
            %assign %$internal 1 
            mov eax, %$external 
            mov eax, %$internal 
        %pop 
%pop 
%endmacro
; correct
%macro ctxthru 0 
%push ctx1 
    %assign %$external 1 
        %push ctx2 
            %assign %$internal 1 
            mov eax, %$$external ; notice $$
            mov eax, %$internal 
        %pop 
%pop 
%endmacro

%repl newname
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor

%macro if 1 
    %push if 
    j%-1  %$ifnot 
%endmacro 

%macro else 0 
  %ifctx if 
        %repl   else 
        jmp     %$ifend 
        %$ifnot: 
  %else 
        %error  "expected `if' before `else'" 
  %endif 
%endmacro 

%macro endif 0 
  %ifctx if 
        %$ifnot: 
        %pop 
  %elifctx      else 
        %$ifend: 
        %pop 
  %else 
        %error  "expected `if' or `else' before `endif'" 
  %endif 
%endmacro

%arg
;<- punctuation.definition.keyword.preprocessor
;^^^ keyword.control.preprocessor
%stacksize
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^ keyword.control.preprocessor
%local
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor

some_function: 
    %push     mycontext        ; save the current context 
    %stacksize large           ; tell NASM to use bp 
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^^^^^ keyword.control.preprocessor
;              ^^^^^ support.constant.macro - invalid.illegal
    %arg      i:word, j_ptr:word
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^ keyword.control.preprocessor
;             ^ variable.parameter.macro
;              ^ punctuation.separator
;               ^^^^ storage.type
;                   ^ punctuation.separator
        mov     ax,[i] 
        mov     bx,[j_ptr] 
        add     ax,[bx] 
        ret 
    %pop                       ; restore original context


%arg      invalid, valid:invalid
;         ^^^^^^^ invalid.illegal
;                  ^^^^^ variable.parameter.macro
;                        ^^^^^^^ invalid.illegal
%stacksize flat
;          ^^^^ support.constant.macro - invalid.illegal
%stacksize flat64
;          ^^^^^^ support.constant.macro - invalid.illegal
%stacksize large
;          ^^^^^ support.constant.macro - invalid.illegal
%stacksize small
;          ^^^^^ support.constant.macro - invalid.illegal
%stacksize invalid
;          ^^^^^^^ invalid.illegal
%stacksize flat32
;          ^^^^^^ invalid.illegal

silly_swap: 
    %push mycontext             ; save the current context 
    %stacksize small            ; tell NASM to use bp 
    %assign %$localsize 0       ; see text for explanation 
    %local old_ax:word, old_dx:word 
        enter   %$localsize,0   ; see text for explanation 
        mov     [old_ax],ax     ; swap ax & bx 
        mov     [old_dx],dx     ; and swap dx & cx 
        mov     ax,bx 
        mov     dx,cx 
        mov     bx,[old_ax] 
        mov     cx,[old_dx] 
        leave                   ; restore old bp 
        ret                     ; 
    %pop                        ; restore original context

%local    invalid, valid:invalid
;         ^^^^^^^ invalid.illegal
;                  ^^^^^ variable.parameter.macro
;                        ^^^^^^^ invalid.illegal
