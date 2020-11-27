; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

  lock
; ^^^^ storage.modifier
  rep
; ^^^ storage.modifier
  repe
; ^^^^ storage.modifier
  repz
; ^^^^ storage.modifier
  repne
; ^^^^^ storage.modifier
  repnz
; ^^^^^ storage.modifier
  xacquire
; ^^^^^^^^ storage.modifier
  xrelease
; ^^^^^^^^ storage.modifier
  bnd
; ^^^ storage.modifier
  nobnd
; ^^^^^ storage.modifier
  strict
; ^^^^^^ storage.modifier
  a16
; ^^^ storage.modifier
  a32
; ^^^ storage.modifier
  a64
; ^^^ storage.modifier
  o16
; ^^^ storage.modifier
  o32
; ^^^ storage.modifier
  o64
; ^^^ storage.modifier
  near
; ^^^^ storage.modifier
  far
; ^^^ storage.modifier


          jmp     0x1234:0x56789ABC       ; wrong!
          jmp     dword 0x1234:0x56789ABC ; right
          jmp     word 0x8765:0x4321      ; 32 to 16 bit
          mov     eax,offset_into_32_bit_segment_specified_by_fs
          mov     dword [fs:eax],0x11223344
          mov     dword [fs:dword my_offset],0x11223344
          mov     dword [dword fs:my_offset],0x11223344
          mov     word [dword 0x12345678],0x9ABC
          call    dword far [fs:word 0x4321]
  a32     lodsb
  o16     push    ss
  o16     push    ds