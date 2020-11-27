global  _myfunc 
_myfunc: 
        push    ebp 
        mov     ebp,esp 
        sub     esp,0x40        ; 64 bytes of local stack space 
        mov     ebx,[ebp+8]     ; first parameter to function 
        ; some more code 
        leave                   ; mov esp,ebp / pop ebp 
        ret

extern  _printf 
        ; and then, further down... 
        push    dword [myint]   ; one of my integer variables 
        push    dword mystring  ; pointer into my data segment 
        call    _printf 
        add     esp,byte 8      ; `byte' saves space 
        ; then those data items... 
segment _DATA 
myint       dd   1234 
mystring    db   'This number -> %d <- should be 1234',10,0

          extern _i 
          mov eax,[_i]

          global _j 
_j        dd 0

proc    _proc32 
%$i     arg 
%$j     arg 
        mov     eax,[ebp + %$i] 
        mov     ebx,[ebp + %$j] 
        add     eax,[ebx] 
endproc

extern  _GLOBAL_OFFSET_TABLE_   ; in ELF 
extern  __GLOBAL_OFFSET_TABLE_  ; in BSD a.out

func:   push    ebp 
        mov     ebp,esp 
        push    ebx 
        call    .get_GOT 
.get_GOT: 
        pop     ebx 
        add     ebx,_GLOBAL_OFFSET_TABLE_+$$-.get_GOT wrt ..gotpc 
        ; the function body comes here 
        mov     ebx,[ebp-4] 
        mov     esp,ebp 
        pop     ebp 
        ret

%macro  get_GOT 0 
        call    %%getgot 
  %%getgot: 
        pop     ebx 
        add     ebx,_GLOBAL_OFFSET_TABLE_+$$-%%getgot wrt ..gotpc 
%endmacro

lea     eax,[ebx+myvar wrt ..gotoff]

mov     eax,[ebx+extvar wrt ..got]

global  func:function           ; declare it as a function 
func:   push    ebp 
        ; etc.

global  array:data array.end-array      ; give the size too 
array:  resd    128 
.end:

dataptr:        dd      global_data_item        ; WRONG
dataptr:        dd      global_data_item wrt ..sym

funcptr:        dd      my_function
funcptr:        dd      my_function wrt ..sym
