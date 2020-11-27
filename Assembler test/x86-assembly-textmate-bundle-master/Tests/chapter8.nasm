segment code 
..start: 
        mov     ax,data 
        mov     ds,ax 
        mov     ax,stack 
        mov     ss,ax 
        mov     sp,stacktop

        mov     dx,hello 
        mov     ah,9 
        int     0x21

        mov     ax,0x4c00 
        int     0x21

segment data 
hello:  db      'hello, world', 13, 10, '$'

segment stack stack 
        resb 64 
stacktop:



        org 100h 
section .text 
start: 
        ; put your code here 
section .data 
        ; put data items here 
section .bss 
        ; put uninitialized data here


%macro  cglobal 1 
  global  _%1 
  %define %1 _%1 
%endmacro 

%macro  cextern 1 
  extern  _%1 
  %define %1 _%1 
%endmacro

cextern printf

extern  _printf 
%define printf _printf



global  _myfunc 
_myfunc: 
        push    bp 
        mov     bp,sp 
        sub     sp,0x40         ; 64 bytes of local stack space 
        mov     bx,[bp+4]       ; first parameter to function 
        ; some more code 
        mov     sp,bp           ; undo "sub sp,0x40" above 
        pop     bp 
        ret

extern  _printf 
      ; and then, further down... 
      push    word [myint]        ; one of my integer variables 
      push    word mystring       ; pointer into my data segment 
      call    _printf 
      add     sp,byte 4           ; `byte' saves space 
      ; then those data items... 
segment _DATA 
myint         dw    1234 
mystring      db    'This number -> %d <- should be 1234',10,0

      push    word [myint] 
      push    word seg mystring   ; Now push the segment, and... 
      push    word mystring       ; ... offset of "mystring" 
      call    far _printf 
      add    sp,byte 6


extern _i 
        mov ax,[_i]

global  _j 
_j      dw      0


proc    _nearproc 
%$i     arg 
%$j     arg 
        mov     ax,[bp + %$i] 
        mov     bx,[bp + %$j] 
        add     ax,[bx] 
endproc

%define FARCODE 
proc    _farproc 
%$i     arg 
%$j     arg     4 
        mov     ax,[bp + %$i] 
        mov     bx,[bp + %$j] 
        mov     es,[bp + %$j + 2] 
        add     ax,[bx] 
endproc



global  myfunc 
myfunc: push    bp 
        mov     bp,sp 
        sub     sp,0x40         ; 64 bytes of local stack space 
        mov     bx,[bp+8]       ; first parameter to function 
        mov     bx,[bp+6]       ; second parameter to function 
        ; some more code 
        mov     sp,bp           ; undo "sub sp,0x40" above 
        pop     bp 
        retf    4               ; total size of params is 4

extern  SomeFunc 
       ; and then, further down... 
       push   word seg mystring   ; Now push the segment, and... 
       push   word mystring       ; ... offset of "mystring" 
       push   word [myint]        ; one of my variables 
       call   far SomeFunc


%define PASCAL 
proc    _pascalproc 
%$j     arg 4 
%$i     arg 
        mov     ax,[bp + %$i] 
        mov     bx,[bp + %$j] 
        mov     es,[bp + %$j + 2] 
        add     ax,[bx] 
endproc