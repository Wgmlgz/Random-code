; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%1
;^ invalid.illegal
%macro  silly  2
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.import
;       ^^^^^ entity.name.function
;              ^ variable.parameter
    %2: db      %1
;   ^ punctuation.definition.variable
;    ^ variable.other.preprocessor - invalid.illegal
;^^^^^^^^^^^^^^^^^ meta.preprocessor.macro
%endmacro 
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.import
        silly 'a', letter_a             ; letter_a:  db 'a'
        silly 'ab', string_ab           ; string_ab: db 'ab'
        silly {13,10}, crlf             ; crlf:      db 13,10
        %1                              ; should be invalid outside of multi-line macro
;        ^ invalid.illegal
%macro  retz 0
        jnz     %%skip
;               ^^ punctuation.definition.keyword.preprocessor
;                 ^^^^ entity.name.constant - invalid.illegal
        ret
    %%skip:
;   ^^ punctuation.definition.keyword.preprocessor
;     ^^^^ entity.name.constant - invalid.illegal
;         ^ punctuation.separator
%endmacro
    %%macro_label: ; invalid outside of macro
;     ^^^^^^^^^^^ invalid.illegal

%macro  level1  0
    %%level1_label:
;     ^^^^^^^^^^^^ - invalid.illegal

    %macro      level2  0
        %%level2_label:
;         ^^^^^^^^^^^^ - invalid.illegal
    %endmacro

    %%still_level1_label:
;     ^^^^^^^^^^^^^^^^^^ - invalid.illegal
%endmacro
%%and_now_its_invalid:
; ^^^^^^^^^^^^^^^^^^^ invalid.illegal

%macro  writefile 2+
;                  ^ storage.modifier
        jmp     %%endstr 
  %%str:        db      %2 
  %%endstr: 
        mov     dx,%%str 
        mov     cx,%%endstr-%%str 
        mov     bx,%1 
        mov     ah,0x40 
        int     0x21 
%endmacro
writefile [filehandle],"hello, world",13,10
writefile [filehandle], {"hello, world",13,10}

%macro mpar 1-*
;           ^^^ variable.parameter
;            ^ keyword.operator
     db %{3:%[__BITS__]}
;       ^^ meta.preprocessor
;       ^ punctuation.definition
;        ^ punctuation.section.braces.begin
;          ^ punctuation.separator
;        ^^^^^^^^^^^^^^^ meta.braces
;            ^^^^^^^^^^ meta.brackets
;                      ^ punctuation.section.braces.end
%endmacro 
mpar 1,2,3,4,5,6

%macro  die 0-1 "Painful program death has occurred." 
        writefile 2,%1 
        mov     ax,0x4c01 
        int     0x21 
%endmacro

%macro foobar 1-3 mov,eax,[ebx+2]
%endmacro

%macro die 0-1+ "Painful program death has occurred.",13,10
%endmacro

%macro  multipush 1-* 
  %rep  %0 
; ^ punctuation.definition.keyword.preprocessor
;  ^^^ keyword.control.preprocessor - keyword.operator.word.mnemonics
        push    %1 
;^^^^^^^^^^^^^^^^^ meta.block.preprocessor
  %rotate 1 
  %endrep 
; ^ punctuation.definition.keyword.preprocessor
;  ^^^^^^ keyword.control.preprocessor
  %endrep 
;  ^^^^^^ invalid.illegal
%endmacro
%endmacro
;^^^^^^^^ invalid.illegal

%macro  multipop 1-* 
  %rep %0
;       ^ variable.other.preprocessor - invalid.illegal
  %rotate -1
        pop     %1 
  %endrep 
%endmacro

%rep 10
    push  %1
;          ^ invalid.illegal
%endrep

%macro keytab_entry 2 
    keypos%{1}8     equ     $-keytab 
                    db      %2 
%endmacro 
keytab: 
          keytab_entry F1,128+1 
          keytab_entry F2,128+2 
          keytab_entry Return,13
;which would expand to
keytab: 
keyposF18       equ     $-keytab 
                db     128+1 
keyposF28       equ     $-keytab 
                db      128+2 
keyposReturn    equ     $-keytab 
                db      13

%macro expansion 0
    %{%foo}bar 
    %%foobar    ; same thing
%endmacro

%macro  retc 1 
        j%-1    %%skip 
        ret 
  %%skip: 
%endmacro

%macro foo 1.nolist
;           ^^^^^^^ storage.modifier
%endmacro
%macro bar 1-5+.nolist a,b,c,d,e,f,g,h
;              ^^^^^^^ storage.modifier
%endmacro

%macro foo 1-3 
        ; Do something 
%endmacro 
%unmacro foo 1-3+.nolist
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.import
;        ^^^ entity.name.function.preprocessor
;            ^^^ variable.parameter.preprocessor
;                ^^^^^^^ storage.modifier
not_a_macro
;<- - meta.preprocessor

%imacro align 1-2+.nolist nop ;comment
    sectalign %1
    times (((%1) - (($-$$) % (%1))) % (%1)) %2
;                    ^^^^ - invalid.illegal
;                    ^ variable.language
;                      ^^ variable.language

%endmacro
{}
;<- - meta
%imacro istruc 1.nolist
    %push
        %define %$strucname %1
;               ^^^^^^^^^^^^^^ - invalid.illegal
        %$strucstart:
%endmacro
{}
;<- - meta
%imacro absolute 1+.nolist
    %define __SECT__ [absolute %1]
;           ^^^^^^^^^^^^^^^^^^^^^^ - invalid.illegal
    __SECT__
%endmacro
{}
;<- - meta
%imacro section 1+.nolist
    %define __SECT__ [section %1] ; broken :(
;           ^^^^^^^^^^^^^^^^^^^^^ - invalid.illegal
    __SECT__
%endmacro
{}
;<- - meta
%imacro cpu 1+.nolist
    [cpu %1]
;   ^^^^^^^^ - invalid.illegal
%endmacro
{}
;<- - meta
%imacro arg 0-1 1
    %assign %$arg %1+%$arg
;   ^^^^^^^^^^^^^^^^^^^^^^ - invalid.illegal
%endmacro
{}
;<- - meta
%imacro float 1-*.nolist
    %rep %0
        [float %1]
        %ifidni %1,daz
            %define __FLOAT_DAZ__ daz
        %elifidni %1,nodaz
;       ^^^^^^^^^^^^^^^^^^ - invalid.illegal
            %define __FLOAT_DAZ__ nodaz
        %elifidni %1,near
;       ^^^^^^^^^^^^^^^^^ - invalid.illegal
            %define __FLOAT_ROUND__ near
        %elifidni %1,up
;       ^^^^^^^^^^^^^^^ - invalid.illegal
            %define __FLOAT_ROUND__ up
        %elifidni %1,down
;       ^^^^^^^^^^^^^^^^^ - invalid.illegal
            %define __FLOAT_ROUND__ down
        %elifidni %1,zero
;       ^^^^^^^^^^^^^^^^^ - invalid.illegal
            %define __FLOAT_ROUND__ zero
        %elifidni %1,default
;       ^^^^^^^^^^^^^^^^^^^^ - invalid.illegal
            %define __FLOAT_DAZ__ nodaz
            %define __FLOAT_ROUND__ near
        %endif
;       ^^^^^^ - invalid.illegal
        %rotate 1
    %endrep
;   ^^^^^^^ - invalid.illegal
%endmacro
{}
;<- - meta
