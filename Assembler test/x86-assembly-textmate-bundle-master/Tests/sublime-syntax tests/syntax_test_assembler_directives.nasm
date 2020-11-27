; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

 ideal jumps p386 p486 p586 end
;^^^^^ invalid.deprecated
;      ^^^^^ invalid.deprecated
;            ^^^^ invalid.deprecated
;                 ^^^^ invalid.deprecated
;                      ^^^^ invalid.deprecated
;                           ^^^ invalid.deprecated

 bits 16
;^^^^ support.function.directive
 use16 use32 use64
;^^^^^ support.function.directive
;      ^^^^^ support.function.directive
;            ^^^^^ support.function.directive
 bits16
;^^^^^^ - support.function.directive
 use8
;^^^^ - support.function.directive

 default
;^^^^^^^ support.function.directive
 default rel
;^^^^^^^ support.function.directive
;        ^^^ support.constant.directive
 default nonsense
;^^^^^^^ support.function.directive
;        ^^^^^^^^ - support.constant.directive
 nobnd
;^^^^^ - support.constant.directive

 section .text
;^^^^^^^ support.function.directive
;        ^^^^^ entity.name.section string.unquoted support.constant.section
 segment .arm
;^^^^^^^ support.function.directive
;        ^^^^ entity.name.section string.unquoted

%macro  writefile 2+ 
        [section custom] 
;                ^^^^^^ string.unquoted
  %%str:        db      %2 
  %%endstr: 
        __SECT__ 
;       ^^^^^^^^ support.constant.directive
        mov     dx,%%str 
        mov     cx,%%endstr-%%str 
        mov     bx,%1 
        mov     ah,0x40 
        int     0x21 
%endmacro

 absolute 0x1A 
;^^^^^^^^ support.function.directive
    kbuf_chr    resw    1 
    kbuf_free   resw    1 
    kbuf        resw    16

        org     100h               ; it's a .COM program 
        jmp     setup              ; setup code comes last 
        ; the resident part of the TSR goes here 
setup: 
        ; now write the code that installs the TSR here 
absolute setup 
runtimevar1     resw    1 
runtimevar2     resd    20 
tsr_end:

 extern  _printf 
;^^^^^^ support.function.directive
 extern  _sscanf,_fscanf
 extern  _variable:wrt dgroup

 global _main 
;^^^^^^ support.function.directive
_main: 
        ; some code
global  hashlookup:function, hashtable:data

 common  intvar  4
;^^^^^^ support.function.directive
global  intvar 
section .bss 
intvar  resd    1

common  commvar  4:near  ; works in OBJ 
common  intarray 100:4   ; works in ELF: 4 byte aligned

 CPU 8086 8086
;^^^ support.function.directive
;    ^^^^ support.constant.directive
;         ^^^^ - support.constant.directive 
CPU 186
;   ^^^ support.constant.directive
CPU 286
;   ^^^ support.constant.directive
CPU 386
;   ^^^ support.constant.directive
CPU 486
;   ^^^ support.constant.directive
CPU 586
;   ^^^ support.constant.directive
CPU PENTIUM
;   ^^^^^^^ support.constant.directive
CPU 686
;   ^^^ support.constant.directive
CPU PPRO
;   ^^^^ support.constant.directive
CPU P2
;   ^^ support.constant.directive
CPU P3
;   ^^ support.constant.directive
CPU KATMAI
;   ^^^^^^ support.constant.directive
CPU P4
;   ^^ support.constant.directive
CPU WILLAMETTE
;   ^^^^^^^^^^ support.constant.directive
CPU PRESCOTT
;   ^^^^^^^^ support.constant.directive
CPU X64
;   ^^^ support.constant.directive
CPU IA64
;   ^^^^ support.constant.directive
 8086 186 286 386 486 586 PENTIUM 686 PPRO P2 P3 KATMAI P4 WILLAMETTE PRESCOTT X64 IA64
;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ - support.constant.directive


    FLOAT DAZ DAZ ; Flush denormals to zero
;   ^^^^^ support.function.directive
;         ^^^ support.constant.directive
;             ^^^ - support.constant.directive
    FLOAT NODAZ   ; Do not flush denormals to zero (default)
;         ^^^^^ support.constant.directive
    FLOAT NEAR    ; Round to nearest (default)
;         ^^^^ support.constant.directive
    FLOAT UP      ; Round up (toward +Infinity)
;         ^^ support.constant.directive
    FLOAT DOWN    ; Round down (toward –Infinity)
;         ^^^^ support.constant.directive
    FLOAT ZERO    ; Round toward zero
;         ^^^^ support.constant.directive
    FLOAT DEFAULT ; Restore default settings
;         ^^^^^^^ support.constant.directive
 DAZ NODAZ NEAR UP DOWN ZERO DEFAULT
;^^^^^^^^^^^^^^^^^^^^^^^^^^^ - support.constant.directive
;                            ^^^^^^^ support.function.directive

    [warning +macro-params]   ; enables warnings for warning-class.
    [warning -macro-selfref]  ; disables warnings for warning-class.
    [warning *macro-defaults] ; restores warning-class to the original value, either the default value or as specified on the command line.
;    ^^^^^^^ support.function.directive
;            ^ keyword.control.warning
;             ^^^^^^^^^^^^^^ support.constant.directive.warning
;                           ^ - support.constant.directive.warning
    [ warning *macro-defaults ] ; restores warning-class to the original value, either the default value or as specified on the command line.
;     ^^^^^^^ support.function.directive
;             ^ keyword.control.warning
;              ^^^^^^^^^^^^^^ support.constant.directive.warning
;                             ^ - support.constant.directive.warning

    [warning *invalid-warning] ; restores warning-class to the original value, either the default value or as specified on the command line.
;             ^^^^^^^^^^^^^^^ invalid.illegal
;                            ^ - invalid.illegal
    [ warning *invalid-warning ] ; restores warning-class to the original value, either the default value or as specified on the command line.
;              ^^^^^^^^^^^^^^^ invalid.illegal
;                              ^ - invalid.illegal
[warning all]
;        ^^^ support.constant.directive.warning
[warning error]
;        ^^^^^ support.constant.directive.warning
[warning error=unknown-warning]
;        ^^^^^ support.constant.directive.warning
;             ^ keyword.operator
;              ^^^^^^^^^^^^^^^ support.constant.directive.warning
;                             ^ - support.constant.directive.warning
[ warning error=unknown-warning ]
;               ^^^^^^^^^^^^^^^ support.constant.directive.warning
;                               ^ - support.constant.directive.warning
[warning error=unknown-warning-as-error]
;              ^^^^^^^^^^^^^^^^^^^^^^^^ invalid.illegal
;              ^^^^^^^^^^^^^^^ - support.constant.directive.warning
;                                      ^ - invalid.illegal
[ warning error=unknown-warning-as-error ]
;               ^^^^^^^^^^^^^^^^^^^^^^^^ invalid.illegal
;               ^^^^^^^^^^^^^^^ - support.constant.directive.warning
;                                        ^ - invalid.illegal
 warning all unknown-warning
;^^^^^^^^^^^^^^^^^^^^^^^^^^^ - support.function.directive - support.constant.directive


