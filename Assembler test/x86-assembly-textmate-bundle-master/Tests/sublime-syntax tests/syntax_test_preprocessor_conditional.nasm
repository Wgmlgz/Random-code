; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%if<condition> 
;<- punctuation.definition.keyword.preprocessor
;^^ keyword.control.preprocessor
    push %1
;   ^^^^ keyword.operator.word.mnemonic
;         ^ invalid.illegal
%elif<condition2> 
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor - invalid.illegal
%else 
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifn
;<- punctuation.definition.keyword.preprocessor
;^^^ keyword.control.preprocessor
%elifn 
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%macro asdf 3
  %if %0
      push  %1
;     ^^^^ keyword.operator.word.mnemonic
;            ^ variable.other.preprocessor - invalid.illegal
  %endif
%endmacro

%ifdef DEBUG
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
;      ^^^^^ entity.name.constant.preprocessor
    push %1
;   ^^^^ keyword.operator.word.mnemonic
;         ^ invalid.illegal
;^^^^^^^^^^ meta.block
%else
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor
    push %2
;   ^^^^ keyword.operator.word.mnemonic
;         ^ invalid.illegal
;^^^^^^^^^^ meta.block
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifndef DEBUG
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
;       ^^^^^ entity.name.constant.preprocessor
%elifdef RELEASE
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
;        ^^^^^^^ entity.name.constant.preprocessor
%elifndef TEST
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
;         ^^^^ entity.name.constant.preprocessor
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%macro mymacro 2
%ifdef DEBUG
    push %1
;   ^^^^ keyword.operator.word.mnemonic
;         ^ variable.other.preprocessor - invalid.illegal
;^^^^^^^^^^ meta.block
%else
    push %2
;         ^ variable.other.preprocessor - invalid.illegal
;^^^^^^^^^^ meta.block
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%endmacro

%ifmacro MyMacro 1-3+.nolist
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor
;        ^^^^^^^ entity.name.function.preprocessor
;                ^^^ variable.parameter.preprocessor
;                   ^^^^^^^^ storage.modifier
     %error "MyMacro 1-3" causes a conflict with an existing macro. 
%else 
     %macro MyMacro 1-3+.nolist
             ; insert code to define the macro 
     %endmacro 
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor

%ifnmacro MyMacro 1-3+.nolist
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor
;         ^^^^^^^ entity.name.function.preprocessor
;                 ^^^ variable.parameter.preprocessor
;                    ^^^^^^^^ storage.modifier

%elifmacro MyMacro 1
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^ keyword.control.preprocessor - invalid.illegal
;          ^^^^^^^ entity.name.function.preprocessor
;                  ^ variable.parameter.preprocessor

%elifnmacro MyMacro 2-*
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^^ keyword.control.preprocessor - invalid.illegal
;           ^^^^^^^ entity.name.function.preprocessor
;                   ^^^ variable.parameter.preprocessor
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifctx ctx
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
;      ^^^ entity.name.constant.preprocessor
%elifctx ctx
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
;        ^^^ entity.name.constant.preprocessor
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifnctx ctx
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor - invalid.illegal
;       ^^^ entity.name.constant.preprocessor
%elifnctx ctx
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
;         ^^^ entity.name.constant.preprocessor
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor

%macro if 1 
  %push if 
  j%-1  %$ifnot 
  %%label %0
%endmacro 
%macro else 0 
  %ifctx if 
        %repl   else 
        jmp     %$ifend 
        %$ifnot: 
  %else 
        %error  "expected `if' before `else'" 
  %endif 
  %%label %0
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
  %%label %0
%endmacro

%ifidn text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
    push %1
;   ^^^^ keyword.operator.word.mnemonic
;         ^ invalid.illegal
%elifidn text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifidni text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
%elifidni text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifnidn text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
%elifnidn text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifnidni text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor
%elifnidni text1,text2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%macro  pushparam 1 
  %%label %0
  %ifidni %1,ip 
        call    %%label 
        push    %1
;       ^^^^ keyword.operator.word.mnemonic
;                ^ variable.other.preprocessor - invalid.illegal
  %%label: 
  %else 
        push    %1 
  %endif 
  %%label %0
%endmacro

%ifid
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor
%elifid
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifnid
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
%elifnid
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifnum
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
%elifnum
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifnnum
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
%elifnnum
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifstr
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor
%elifstr
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifnstr
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor
%elifnstr
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%macro writefile 2-3+ 
  %ifstr %2 
        jmp     %%endstr 
    %if %0 = 3 
      %%str:    db      %2,%3 
    %else 
      %%str:    db      %2 
    %endif 
      %%endstr: mov     dx,%%str 
                mov     cx,%%endstr-%%str 
  %else 
                mov     dx,%2 
                mov     cx,%3 
  %endif 
                mov     bx,%1 
                mov     ah,0x40 
                int     0x21 
%endmacro
        writefile [file], strpointer, length 
        writefile [file], "hello", 13, 10

%iftoken 1
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
%eliftoken asdf
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifntoken 2
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%elifntoken 4
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifempty
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
%elifempty
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifnempty
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%elifnempty
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal

%ifenv %!FOO
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%elifenv %!'::FOO::'
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal
%ifnenv %!"::FOO::"
;<- punctuation.definition.keyword.preprocessor
;^^^^^^ keyword.control.preprocessor - invalid.illegal
%elifnenv %!`::FOO::`
;<- punctuation.definition.keyword.preprocessor
;^^^^^^^^ keyword.control.preprocessor - invalid.illegal
%endif
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor - invalid.illegal


%else
;^^^^ invalid.illegal
%elif
;^^^^ invalid.illegal
%elifn
;^^^^^ invalid.illegal
%endif
;^^^^^ invalid.illegal
%elifdef RELEASE
;^^^^^^^ invalid.illegal
%elifndef RELEASE
;^^^^^^^^ invalid.illegal
%elifmacro MyMacro 1
;^^^^^^^^^ invalid.illegal
%elifnmacro MyMacro 2-*
;^^^^^^^^^^ invalid.illegal
%elifctx
;^^^^^^^ invalid.illegal
%elifnctx
;^^^^^^^^ invalid.illegal
%elifidn text1,text2
;^^^^^^^ invalid.illegal
%elifidni text1,text2
;^^^^^^^^ invalid.illegal
%elifnidn text1,text2
;^^^^^^^^ invalid.illegal
%elifnidni text1,text2
;^^^^^^^^^ invalid.illegal
%elifid
;^^^^^^ invalid.illegal
%elifnid
;^^^^^^^ invalid.illegal
%elifnum
;^^^^^^^ invalid.illegal
%elifnnum
;^^^^^^^^ invalid.illegal
%elifstr
;^^^^^^^ invalid.illegal
%elifnstr
;^^^^^^^^ invalid.illegal
%eliftoken 1
;^^^^^^^^^ invalid.illegal
%elifntoken 23
;^^^^^^^^^^ invalid.illegal
%elifempty
;^^^^^^^^^ invalid.illegal
%elifnempty
;^^^^^^^^^^ invalid.illegal
%elifenv %!'::FOO::'
;^^^^^^^ invalid.illegal
%elifnenv %!`::FOO::`
;^^^^^^^^ invalid.illegal
