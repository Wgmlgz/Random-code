; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

 $ $$ $$$ $$$$
;^ variable.language
;  ^^ variable.language
;     ^^^ invalid.illegal
;         ^^^^ invalid.illegal

1|1
;^ keyword.operator
2^2
;^ keyword.operator
3&3
;^ keyword.operator
4<<4
;^^ keyword.operator
5>>5
;^^ keyword.operator
6+6
;^ keyword.operator
7-7
;^ keyword.operator
8*8
;^ keyword.operator
9/9
;^ keyword.operator
10//10
; ^^ keyword.operator
11% 11
; ^ keyword.operator
12%% 12
; ^^ keyword.operator
symbol wrt weird_seg
;      ^^^ keyword.operator.word

 +1
;^ keyword.operator
 -2
;^ keyword.operator
 ~3
;^ keyword.operator
 !4
;^ keyword.operator
 seg symbol
;^^^ keyword.operator.word


; not operators

4<4
5>5

%macro df 234
;<- punctuation.definition.keyword
%endmacro
%%also_macro
;<- punctuation.definition.keyword
