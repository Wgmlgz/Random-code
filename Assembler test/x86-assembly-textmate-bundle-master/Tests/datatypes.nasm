; samples from Chapter 3: The NASM Language

        fadd    st1             ; this sets st0 := st0 + st1 
        fadd    st0,st1         ; so does this 

        fadd    st1,st0         ; this sets st1 := st1 + st0 
        fadd    to st1          ; so does this

db, dw, dd, dq, dt, do, dy, dz

      db    0x55                ; just the byte 0x55 
      db    0x55,0x56,0x57      ; three bytes in succession 
      db    'a',0x55            ; character constants are OK 
      db    'hello',13,10,'$'   ; so are string constants 
      dw    0x1234              ; 0x34 0x12 
      dw    'a'                 ; 0x61 0x00 (it's just a number) 
      dw    'ab'                ; 0x61 0x62 (character constant) 
      dw    'abc'               ; 0x61 0x62 0x63 0x00 (string) 
      dd    0x12345678          ; 0x78 0x56 0x34 0x12 
      dd    1.234567e20         ; floating-point constant 
      dq    0x123456789abcdef0  ; eight byte constant 
      dq    1.234567e20         ; double-precision float 
      dt    1.234567e20         ; extended-precision float

resb, resw, resd, resq, rest, reso, resy, resz

buffer:         resb    64              ; reserve 64 bytes 
wordvar:        resw    1               ; reserve a word 
realarray       resq    10              ; array of ten reals 
ymmval:         resy    1               ; one YMM register 
zmmvals:        resz    32              ; 32 ZMM registers

    incbin  "file.dat"             ; include the whole file 
    incbin  "file.dat",1024        ; skip the first 1024 bytes 
    incbin  "file.dat",1024,512    ; skip the first 1024, and 
                                   ; actually include at most 512

message         db      'hello, world' 
msglen          equ     $-message

zerobuf:        times 64 db 0

buffer: db      'hello, world' 
        times 64-$+buffer db ' '

        times 100 movsb

wordvar dw      123 
        mov     ax,[wordvar] 
        mov     ax,[wordvar+1] 
        mov     ax,[es:wordvar+bx]

        mov     eax,[ebx*2+ecx+offset] 
        mov     ax,[bp+di+8]

    mov     eax,[ebx*5]             ; assembles as [ebx*4+ebx] 
    mov     eax,[label1*2-label2]   ; ie [label1+(label1-label2)]

     mov eax,[ebx+8,ecx*4]   ; ebx=base, ecx=index, 4=scale, 8=disp

     ; bndstx 
     ; next 5 lines are parsed same 
     ; base=rax, index=rbx, scale=1, displacement=3 
     bndstx [rax+0x3,rbx], bnd0      ; NASM - split EA 
     bndstx [rbx*1+rax+0x3], bnd0    ; GAS - '*1' indecates an index reg 
     bndstx [rax+rbx+3], bnd0        ; GAS - without hints 
     bndstx [rax+0x3], bnd0, rbx     ; ICC-1 
     bndstx [rax+0x3], rbx, bnd0     ; ICC-2

     vdivps zmm4, zmm5, dword [rbx]{1to16}   ; single-precision float 
     vdivps zmm4, zmm5, zword [rbx]          ; packed 512 bit memory

        mov     ax,200          ; decimal 
        mov     ax,0200         ; still decimal 
        mov     ax,0200d        ; explicitly decimal 
        mov     ax,0d200        ; also decimal 
        mov     ax,0c8h         ; hex 
        mov     ax,$0c8         ; hex again: the 0 is required 
        mov     ax,0xc8         ; hex yet again 
        mov     ax,0hc8         ; still hex 
        mov     ax,310q         ; octal 
        mov     ax,310o         ; octal again 
        mov     ax,0o310        ; octal yet again 
        mov     ax,0q310        ; octal yet again 
        mov     ax,11001000b    ; binary 
        mov     ax,1100_1000b   ; same binary constant 
        mov     ax,1100_1000y   ; same binary constant once more 
        mov     ax,0b1100_1000  ; same binary constant yet again 
        mov     ax,0y1100_1000  ; same binary constant yet again

      db `\u263a`            ; UTF-8 smiley face 
      db `\xe2\x98\xba`      ; UTF-8 smiley face 
      db 0E2h, 098h, 0BAh    ; UTF-8 smiley face

          mov eax,'abcd'

      db    'hello'               ; string constant 
      db    'h','e','l','l','o'   ; equivalent character constants

      dd    'ninechars'           ; doubleword string constant 
      dd    'nine','char','s'     ; becomes three doublewords 
      db    'ninechars',0,0,0     ; and really looks like this

__utf16__, __utf16le__, __utf16be__, __utf32__, __utf32le__, __utf32be__
__float8__, __float16__, __float32__, __float64__, __float80m__, __float80e__, __float128l__, __float128h__
__Infinity__, __QNaN__, __NaN__, __SNaN__

%define u(x) __utf16__(x) 
%define w(x) __utf32__(x) 
      dw u('C:\WINDOWS'), 0       ; Pathname in UTF-16 
      dd w(`A + B = \u206a`), 0   ; String in UTF-32

      db    -0.2                    ; "Quarter precision" 
      dw    -0.5                    ; IEEE 754r/SSE5 half precision 
      dd    1.2                     ; an easy one 
      dd    1.222_222_222           ; underscores are permitted 
      dd    0x1p+2                  ; 1.0x2^2 = 4.0 
      dq    0x1p+32                 ; 1.0x2^32 = 4 294 967 296.0 
      dq    1.e10                   ; 10 000 000 000.0 
      dq    1.e+10                  ; synonymous with 1.e10 
      dq    1.e-10                  ; 0.000 000 000 1 
      dt    3.141592653589793238462 ; pi 
      do    1.e+4000                ; IEEE 754r quad precision

mov    rax,__float64__(3.141592653589793238462)
mov    rax,0x400921fb54442d18

%define Inf __Infinity__ 
%define NaN __QNaN__ 
      dq    +1.5, -Inf, NaN         ; Double-precision constants

      dt 12_345_678_901_245_678p 
      dt -12_345_678_901_245_678p 
      dt +0p33 
      dt 33p

        mov     ax,seg symbol 
        mov     es,ax 
        mov     bx,symbol

        mov     ax,weird_seg        ; weird_seg is a segment base 
        mov     es,ax 
        mov     bx,symbol wrt weird_seg

        call    (seg procedure):procedure 
        call    weird_seg:(procedure wrt weird_seg)

        dw      symbol, seg symbol

        push dword 33
        push strict dword 33

        times (label-$) db 0 
label:  db      'Where am I?'

        times (label-$+1) db 0 
label:  db      'NOW where am I?'

label1  ; some code 
.loop 
        ; some more code 
        jne     .loop 
        ret 
label2  ; some code 
.loop 
        ; some more code 
        jne     .loop 
        ret

label3  ; some more code 
        ; and some more 
        jmp label1.loop

label1:                         ; a non-local label 
.local:                         ; this is really label1.local 
..@foo:                         ; this is a special symbol 
label2:                         ; another non-local label 
.local:                         ; this is really label2.local 
        jmp     ..@foo          ; this will jump three lines up

; non-nasm signed types

sbyte sword sdword sqword