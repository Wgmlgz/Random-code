%define THIS_VERY_LONG_MACRO_NAME_IS_DEFINED_TO \ 
        THIS_VALUE

%define ctrl    0x1F &
%define param(a,b) ((a)+(a)*(b))
        mov     byte [param(2,ebx)], ctrl 'D'

%xidefine isTrue  1
%xdefine isFalse isTrue
%xidefine isTrue  0
val1:    db      isFalse
%xidefine isTrue  1
val2:    db      isFalse

%define BDASTART 400h                ; Start of BIOS data area
struc   tBIOSDA                      ; its structure
        .COM1addr       RESW    1
        .COM2addr       RESW    1
        ; ..and so on
endstruc
        mov     ax,BDASTART + tBIOSDA.COM1addr
        mov     bx,BDASTART + tBIOSDA.COM2addr

%define BDA(x)  BDASTART + tBIOSDA. %+ x
        mov     ax,BDA(COM1addr)
        mov     bx,BDA(COM2addr)

%define foo bar
%undef  foo
        mov     eax, foo

%assign i i+1

%strlen charcnt 'my string'
%define sometext 'my string'
%strlen charcnt sometext

%substr mychar  'xyz' 1         ; equivalent to %define mychar 'x'
%substr mychar  'xyz' 2         ; equivalent to %define mychar 'y'
%substr mychar  'xyz' 3         ; equivalent to %define mychar 'z'

%macro  prologue 1
        push    ebp
        mov     ebp,esp
        sub     esp,%1
%endmacro
myfunc:   prologue 12
myfunc: push    ebp
        mov     ebp,esp
        sub     esp,12

%macro  silly 2
    %2: db      %1
%endmacro
        silly 'a', letter_a             ; letter_a:  db 'a'
        silly 'ab', string_ab           ; string_ab: db 'ab'
        silly {13,10}, crlf             ; crlf:      db 13,10

%macro  prologue 0
        push    ebp
        mov     ebp,esp
%endmacro

%macro  push 2
        push    %1
        push    %2
%endmacro

%macro  retz 0
        jnz     %%skip
        ret
    %%skip:
%endmacro

%macro  writefile 2+
        jmp     %%endstr
  %%str:        db      %2
  %%endstr:
        mov     dx,%%str
        mov     cx,%%endstr-%%str
        mov     bx,%1
        mov     ah,0x40
        int     0x21
%endmacro
        writefile [filehandle], {"hello, world",13,10}

%macro  die 0-1 "Painful program death has occurred."
        writefile 2,%1
        mov     ax,0x4c01
        int     0x21
%endmacro
%macro foobar 1-3 eax,[ebx+2]

%macro  multipush 1-*
  %rep  %0
        push    %1
  %rotate 1
  %endrep
%endmacro

%macro  multipop 1-*
  %rep %0
  %rotate -1
        pop     %1
  %endrep
%endmacro

%macro keytab_entry 2
    keypos%1    equ     $-keytab
                db      %2
%endmacro
keytab:
          keytab_entry F1,128+1
          keytab_entry F2,128+2
          keytab_entry Return,13

%macro  retc 1
        j%-1    %%skip
        ret
  %%skip:
%endmacro

%macro foo 1.nolist
%macro bar 1-5+.nolist a,b,c,d,e,f,g,h

%if<condition>
    ; some code which only appears if <condition> is met
%elif<condition2>
    ; only appears if <condition> is not met but <condition2> is
%else
    ; this appears if neither <condition> nor <condition2> was met
%endif

          ; perform some function
%ifdef DEBUG
          writefile 2,"Function performed successfully",13,10
%endif
          ; go and do something else

%ifmacro MyMacro 1-3
     %error "MyMacro 1-3" causes a conflict with an existing macro.
%else
     %macro MyMacro 1-3
             ; insert code to define the macro
     %endmacro
%endif

%macro  pushparam 1
  %ifidni %1,ip
        call    %%label
  %%label:
  %else
        push    %1
  %endif
%endmacro

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

%ifdef SOME_MACRO
    ; do some setup
%elifdef SOME_OTHER_MACRO
    ; do some different setup
%else
    %error Neither SOME_MACRO nor SOME_OTHER_MACRO was defined.
%endif

%assign i 0
%rep    64
        inc     word [table+2*i]
%assign i i+1
%endrep

fibonacci:
%assign i 0
%assign j 1
%rep 100
%if j > 65535
    %exitrep
%endif
        dw j
%assign k j+i
%assign i j
%assign j k
%endrep

%include "macros.mac"

%ifndef MACROS_MAC
    %define MACROS_MAC
    ; now define some macros
%endif

%push    foobar

%macro repeat 0
    %push   repeat
    %$begin:
%endmacro

%macro until 1
        j%-1    %$begin
    %pop
%endmacro

%define %$localmac 3

%pop
%push   newname

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

%macro notdeadyet 0
        push    eax
        mov     eax, __LINE__
        call    stillhere
        pop     eax
%endmacro

        struc   mytype
mt_long:        resd 1
mt_word:        resw 1
mt_byte:        resb 1
mt_str:         resb 32
        endstruc

        struc   mytype
.long:  resd 1
.word:  resw 1
.byte:  resb 1
.str:   resb 32
        endstruc

mystruc:        istruc  mytype
        at mt_long, dd 123456
        at mt_word, dw 1024
        at mt_byte, db 'x'
        at mt_str,  db 'hello, world', 13, 10, 0
                iend
        at mt_str, db 123,134,145,156,167,178,189
        db 190,100,0
        at mt_str
        db 'hello, world'
        db 13,10,0

        align 4                 ; align on 4-byte boundary
        align 16                ; align on 16-byte boundary
        align 16,nop            ; equivalent to previous line
        align 8,db 0            ; pad with 0s rather than NOPs
        align 4,resb 1          ; align to 4 in the BSS
        alignb 4                ; equivalent to previous line                        

        struc   mytype2
mt_byte:        resb 1
                alignb 2
mt_word:        resw 1
                alignb 4
mt_long:        resd 1
mt_str:         resb 32
        endstruc        