; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%define THIS_VERY_LONG_MACRO_NAME_IS_DEFINED_TO \
        THIS_VALUE

%define ctrl    0x1F &
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.import.preprocessor
;       ^^^^ entity.name.constant.preprocessor
;               ^^^^^^ meta.preprocessor.macro

%define param(a,b) ((a)+(a)*(b)) 
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.import.preprocessor
;       ^^^^^ entity.name.function.preprocessor
;            ^^^^^ - invalid.illegal
;            ^ punctuation.section.group.begin
;             ^ variable.parameter
;              ^ punctuation.separator
;               ^ variable.parameter
;                ^ punctuation.section.group.end
;                  ^^^^^^^^^^^^^ meta.preprocessor.macro

%xdefine isTrue  1 
%xdefine isFalse isTrue 
%xdefine isTrue  0 
val1:    db      isFalse 

%xdefine isTrue  1 
val2:    db      isFalse

%define Foo16    align 16
%define Foo32    align 32
%define Foo64    align 64
mov ax,Foo%[__BITS__]   ; Will expand to Foo16/Foo32/Foo64
;         ^ punctuation.definition.keyword.preprocessor
;          ^ punctuation.section.brackets.begin
;          ^^^^^^^^^^ meta.brackets
;           ^^^^^^^^ meta.preprocessor.macro
;                   ^ punctuation.section.brackets.end

%xdefine Bar         Quux    ; Expands due to %xdefine 
%define  Bar         %[Quux] ; Expands due to %[...]
;                    ^ punctuation.definition.keyword.preprocessor
;                     ^ punctuation.section.brackets.begin
;                     ^^^^^^ meta.brackets
;                      ^^^^ meta.preprocessor.macro
;                          ^ punctuation.section.brackets.end

%define BDASTART 400h
struc   tBIOSDA
        .COM1addr       RESW    1 
        .COM2addr       RESW    1 
endstruc
; Macro to access BIOS variables by their names (from tBDA):
%define BDA(x)  BDASTART + tBIOSDA. %+ x
;                                   ^ punctuation.definition.keyword.preprocessor
        mov     ax,BDA(COM1addr) ; Expands to BDASTART + tBIOSDA.COM1addr
        mov     bx,BDA(COM2addr)

%idefine Foo mov %?,%?? ?
;                ^ punctuation.definition.keyword.preprocessor
;                 ^ variable.language - invalid.illegal
;                   ^ punctuation.definition.keyword.preprocessor
;                    ^^ variable.language - invalid.illegal

%idefine pause $%?                  ; Hide the PAUSE instruction

%undef ctrl
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
;      ^^^^ entity.name.constant

%assign i i+1
%assign i(a,b) ((a)+(a)*(b))
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
;       ^ entity.name.constant
;        ^^^^^ invalid.illegal
;              ^^^^^^^^^^^^^ meta.preprocessor.macro

%define test 'TEST'
;            ^^^^^^ string.quoted.single
%defstr test TEST %[__BITS__] CONTINUES
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.import.preprocessor
;       ^^^^ entity.name.constant.preprocessor
;                 ^ punctuation.definition.keyword.preprocessor
;                  ^ punctuation.section.brackets.begin
;                  ^^^^^^^^^^ meta.brackets
;                   ^^^^^^^^ meta.preprocessor.macro
;                           ^ punctuation.section.brackets.end
;            ^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.preprocessor.macro
;            ^^^^^^^^^^^^^^^^^^^^^^^^^^ string - string.quoted
%idefstr PATH TEST %!PATH CONTINUES; The operating system PATH variable
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.import.preprocessor
;        ^^^^ entity.name.constant
;             ^^^^^^^^^^^^^^^^^^^^^ meta.preprocessor.macro string - string.quoted
;                  ^ punctuation.definition.keyword.preprocessor - variable.parameter.preprocessor
;                   ^ punctuation.definition.variable - variable.parameter.preprocessor
;                    ^^^^ variable.parameter.preprocessor

%define test TEST
%deftok test 'TEST'
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
;       ^^^^ entity.name.constant
;            ^^^^^^ string.quoted.single

%strcat alpha "Alpha: ", '12" screen'
%strcat beta '"foo"\', "'bar'"

%define sometext 'my string' 
%strlen charcnt sometext
%strlen charcnt 'my string'

%substr mychar 'xyzw' 1       ; equivalent to %define mychar 'x' 
%substr mychar 'xyzw' 2       ; equivalent to %define mychar 'y' 
%substr mychar 'xyzw' 3       ; equivalent to %define mychar 'z' 
%substr mychar 'xyzw' 2,2     ; equivalent to %define mychar 'yz' 
%substr mychar 'xyzw' 2,-1    ; equivalent to %define mychar 'yzw' 
%substr mychar 'xyzw' 2,-2    ; equivalent to %define mychar 'yz'
