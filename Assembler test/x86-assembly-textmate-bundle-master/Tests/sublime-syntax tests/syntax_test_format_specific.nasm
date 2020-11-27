; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

 org 0x100
;^^^ support.function.directive

section "asdf" align=16
;       ^^^^^^ entity.name.section string.quoted
;              ^^^^^ variable.parameter.directive - string - support.function.directive

 section my_section progbits nobits start=16 vstart=32 follows=.text vfollows=custom nobits
;        ^^^^^^^^^^ entity.name.section string.unquoted
;                   ^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                            ^^^^^^ storage.modifier.directive variable.parameter.directive
;                                   ^^^^^ variable.parameter.directive
;                                            ^^^^^^ variable.parameter.directive
;                                                      ^^^^^^^ variable.parameter.directive
;                                                                    ^^^^^^^^ variable.parameter.directive

 [map all myfile.map]
; ^^^ support.function.directive
;     ^^^ support.constant.directive.map
;         ^^^^^^^^^^ meta.path string.unquoted
 [map brief myfile.map]
;     ^^^^^ support.constant.directive.map
 [map sections myfile.map]
;     ^^^^^^^^ support.constant.directive.map
 [map segments myfile.map]
;     ^^^^^^^^ support.constant.directive.map
 [map symbols myfile.map]
;     ^^^^^^^ support.constant.directive.map
 [map symbols stdout]
;             ^^^^^^ meta.path support.constant.directive.map
 [map symbols stderr]
;             ^^^^^^ meta.path support.constant.directive.map
 [map stdout]
;     ^^^^^^ meta.path support.constant.directive.map
 [map map.pdb]
;     ^^^^^^^ meta.path string.unquoted
 map
;^^^ - support.function.directive
 all brief sections segments symbols stdout stderr
;^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ - support.constant.directive

 segment code
;        ^^^^ entity.name.section string.unquoted support.constant.section
 __NASMDEFSEG
;^^^^^^^^^^^^ support.constant.directive

segment data 
dvar:   dw      1234 

segment code 
function: 
        mov     ax,data         ; get segment address of data 
        mov     ds,ax           ; and move it into DS 
        inc     word [dvar]     ; now this reference will work 
        ret

extern  foo 
        mov     ax,seg foo            ; get preferred segment of foo 
        mov     ds,ax 
        mov     ax,data               ; a different segment 
        mov     es,ax 
        mov     ax,[ds:foo]           ; this accesses `foo' 
        mov     [es:foo wrt data],bx  ; so does this

segment code private align=16 class=my_class overlay=my_overlay ABSOLUTE=0xB800 ;asdf
;            ^^^^^^^ storage.modifier.directive variable.parameter.directive
;                             ^^^^^ variable.parameter.directive
;                                   ^^^^^^^^ entity.name.class string.unquoted
;                                            ^^^^^^^ variable.parameter.directive
;                                                    ^^^^^^^^^^ entity.name.class string.unquoted
;                                                               ^^^^^^^^ variable.parameter.directive

 segment data 
        ; some data 
 segment bss 
        ; some uninitialized data 
 group dgroup data bss
;^^^^^ support.function.directive
;      ^^^^^^ entity.name.section string.unquoted

 uppercase
;^^^^^^^^^ support.function.directive

 import  WSAStartup wsock32.dll
;^^^^^^ support.function.directive
;        ^^^^^^^^^^ entity.name.function
;                   ^^^^^^^^^^^ meta.path string.unquoted
 import  asyncsel   wsock32.dll WSAAsyncSelect
;^^^^^^ support.function.directive
;        ^^^^^^^^ entity.name.function
;                   ^^^^^^^^^^^ meta.path string.unquoted
;                               ^^^^^^^^^^^^^^ variable.function
 import  WSAStartup wsock32.dll; comment
;^^^^^^ support.function.directive
;        ^^^^^^^^^^ entity.name.function
;                   ^^^^^^^^^^^ meta.path string.unquoted
;                              ^^^^^^^^^ comment.line
 import  asyncsel   wsock32.dll WSAAsyncSelect; comment
;^^^^^^ support.function.directive
;        ^^^^^^^^ entity.name.function
;                   ^^^^^^^^^^^ meta.path string.unquoted
;                               ^^^^^^^^^^^^^^ variable.function
;                                             ^^^^^^^^^ comment.line
 import  asyncsel   wsock32.dll WSAAsyncSelect blah; comment
;                                              ^^^^ invalid.illegal
;                                                  ^^^^^^^^^ comment.line

 export  myfunc ;asf
;^^^^^^ support.function.directive
;        ^^^^^^ entity.name.constant
;               ^^^^ comment.line
 export  myfunc TheRealMoreFormalLookingFunctionName ;asdf
;^^^^^^ support.function.directive
;        ^^^^^^ entity.name.constant
;               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ variable.function
;                                                    ^^^^^ comment.line
 export  myfunc myfunc 1234  ; export by ordinal
;^^^^^^ support.function.directive
;        ^^^^^^ entity.name.constant
;               ^^^^^^ variable.function
;                            ^^^^^^^^^^^^^^^^^^^ comment.line
 export  myfunc myfunc resident parm=23 nodata ;asdf
;^^^^^^ support.function.directive
;        ^^^^^^ entity.name.constant
;               ^^^^^^ variable.function
;                      ^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                               ^^^^ variable.parameter.directive
;                                       ^^^^^^ storage.modifier.directive variable.parameter.directive
;                                              ^^^^^ comment.line
%imacro mymacro 1+
    [export %1]
;   ^^^^^^^^^^^ meta.preprocessor.macro
%endmacro

 ..start
;^^^^^^^ support.constant

extern  foo

mov     ax,seg foo      ; get preferred segment base 
mov     es,ax           ; move it into ES 
mov     ax,[es:foo]     ; and use offset `foo' from it
mov     ax,[foo wrt dgroup]
extern  foo:wrt dgroup

common  nearvar 2:near   ; `nearvar' is a near common 
common  farvar  10:far   ; and `farvar' is far
common  c_5by2  10:far 5        ; two five-byte elements 
common  c_2by5  10:far 2        ; five two-byte elements
common  c_5by2  10:5            ; two five-byte elements 
common  c_2by5  10:2            ; five two-byte elements
common  foo     10:wrt dgroup 
common  bar     16:far 2:wrt data 
common  baz     24:wrt data:6

section .text code text data bss rdata info align=16
;             ^^^^ storage.modifier.directive variable.parameter.directive
;                  ^^^^ storage.modifier.directive variable.parameter.directive
;                       ^^^^ storage.modifier.directive variable.parameter.directive
;                            ^^^ storage.modifier.directive variable.parameter.directive
;                                ^^^^^ storage.modifier.directive variable.parameter.directive
;                                      ^^^^ storage.modifier.directive variable.parameter.directive
;                                           ^^^^^ variable.parameter.directive
section .text    code  align=16 
section .data    data  align=4 
section .rdata   rdata align=8
;       ^^^^^^ support.constant.section
section .bss     bss   align=4

 $@feat.00 equ 1
;^^^^^^^^^ variable.language.sseh
 safeseh myhandler
;^^^^^^^ support.function.directive

section .text 
extern  _MessageBoxA@16 
%if     __NASM_VERSION_ID__ >= 0x02030000 
safeseh handler         ; register handler as "safe handler" 
%endif 
handler: 
        push    DWORD 1 ; MB_OKCANCEL 
        push    DWORD caption 
        push    DWORD text 
        push    DWORD 0 
        call    _MessageBoxA@16 
        sub     eax,1   ; incidentally suits as return value 
                        ; for exception handler 
        ret 
global  _main 
_main: 
        push    DWORD handler 
        push    DWORD [fs:0] 
        mov     DWORD [fs:0],esp ; engage exception handler 
        xor     eax,eax 
        mov     eax,DWORD[eax]   ; cause exception 
        pop     DWORD [fs:0]     ; disengage exception handler 
        add     esp,4 
        ret 
text:   db      'OK to rethrow, CANCEL to generate core dump',0 
caption:db      'SEGV',0 

section .drectve info 
        db      '/defaultlib:user32.lib /defaultlib:msvcrt.lib '

        lea     rbx,[rel dsptch] 
        mov     eax,[rbx+rax*4] 
        sub     rbx,dsptch wrt ..imagebase 
        add     rbx,rax 
        jmp     rbx 
        ... 
dsptch: dd      case0 wrt ..imagebase 
        dd      case1 wrt ..imagebase

        dd      label wrt ..imagebase           ; ok 
        dq      label wrt ..imagebase           ; bad 
        mov     eax,label wrt ..imagebase       ; ok 
        mov     rax,label wrt ..imagebase       ; bad

default rel 
section .text 
extern  MessageBoxA 
handler: 
        sub     rsp,40 
        mov     rcx,0 
        lea     rdx,[text] 
        lea     r8,[caption] 
        mov     r9,1    ; MB_OKCANCEL 
        call    MessageBoxA 
        sub     eax,1   ; incidentally suits as return value 
                        ; for exception handler 
        add     rsp,40 
        ret 
global  main 
main: 
        xor     rax,rax 
        mov     rax,QWORD[rax]  ; cause exception 
        ret 
main_end: 
text:   db      'OK to rethrow, CANCEL to generate core dump',0 
caption:db      'SEGV',0 

section .pdata  rdata align=4 
;       ^^^^^^ support.constant.section
        dd      main wrt ..imagebase 
        dd      main_end wrt ..imagebase 
        dd      xmain wrt ..imagebase 
section .xdata  rdata align=8 
;       ^^^^^^ support.constant.section
xmain:  db      9,0,0,0 
        dd      handler wrt ..imagebase 
section .drectve info 
        db      '/defaultlib:user32.lib /defaultlib:msvcrt.lib '

function: 
        mov     rax,rsp         ; copy rsp to volatile register 
        push    r15             ; save non-volatile registers 
        push    rbx 
        push    rbp 
        mov     r11,rsp         ; prepare variable stack frame 
        sub     r11,rcx 
        and     r11,-64 
        mov     QWORD[r11],rax  ; check for exceptions 
        mov     rsp,r11         ; allocate stack frame 
        mov     QWORD[rsp],rax  ; save original rsp value 
magic_point: 
        ... 
        mov     r11,QWORD[rsp]  ; pull original rsp value 
        mov     rbp,QWORD[r11-24] 
        mov     rbx,QWORD[r11-16] 
        mov     r15,QWORD[r11-8] 
        mov     rsp,r11         ; destroy frame 
        ret

section .text
;       ^^^^^  support.constant.section
section .rodata
;       ^^^^^^^  support.constant.section
section .data
;       ^^^^^  support.constant.section
section .bss
;       ^^^^  support.constant.section
SECTION __TEXT
;       ^^^^^^  support.constant.section
SECTION __CONST
;       ^^^^^^^  support.constant.section
SECTION __DATA
;       ^^^^^^  support.constant.section
SECTION __BSS
;       ^^^^^  support.constant.section
section __text
;       ^^^^^^  support.constant.section
section __const
;       ^^^^^^^  support.constant.section
section __data
;       ^^^^^^  support.constant.section
section __bss
;       ^^^^^  support.constant.section

section macho data text mixed bss zerofill no_dead_strip live_support strip_static_syms align=16
;             ^^^^ storage.modifier.directive variable.parameter.directive
;                  ^^^^ storage.modifier.directive variable.parameter.directive
;                       ^^^^^ storage.modifier.directive variable.parameter.directive
;                             ^^^ storage.modifier.directive variable.parameter.directive
;                                 ^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                          ^^^^^^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                                        ^^^^^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                                                     ^^^^^^^^^^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                                                                       ^^^^^ variable.parameter.directive



 ..tlvp ; is used to specify access to thread-local storage.
;^^^^^^ support.constant
 ..gotpcrel ; is used to specify references to the Global Offset Table. The GOT is supported in the macho64 format only.
;^^^^^^^^^^ support.constant

 subsections_via_symbols
;^^^^^^^^^^^^^^^^^^^^^^^ support.function.directive.macho
 no_dead_strip
;^^^^^^^^^^^^^ support.function.directive.macho

 osabi
;^^^^^ support.function.directive

section elf alloc exec write progbits align=8 tls 
;           ^^^^^ storage.modifier.directive variable.parameter.directive
;                 ^^^^ storage.modifier.directive variable.parameter.directive
;                      ^^^^^ storage.modifier.directive variable.parameter.directive
;                            ^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                     ^^^^^ variable.parameter.directive
;                                             ^^^ storage.modifier.directive variable.parameter.directive
section elf noalloc noexec nowrite nobits
;           ^^^^^^^ storage.modifier.directive variable.parameter.directive
;                   ^^^^^^ storage.modifier.directive variable.parameter.directive
;                          ^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                  ^^^^^^ storage.modifier.directive variable.parameter.directive

section .text    progbits  alloc   exec    nowrite  align=16 
;       ^^^^^ support.constant.section
section .rodata  progbits  alloc   noexec  nowrite  align=4 
;       ^^^^^^^ support.constant.section
section .lrodata progbits  alloc   noexec  nowrite  align=4 
;       ^^^^^^^^ support.constant.section
section .data    progbits  alloc   noexec  write    align=4 
;       ^^^^^ support.constant.section
section .ldata   progbits  alloc   noexec  write    align=4 
;       ^^^^^^ support.constant.section
section .bss     nobits    alloc   noexec  write    align=4 
;       ^^^^ support.constant.section
section .lbss    nobits    alloc   noexec  write    align=4 
;       ^^^^^ support.constant.section
section .tdata   progbits  alloc   noexec  write    align=4    tls 
;       ^^^^^^ support.constant.section
section .tbss    nobits    alloc   noexec  write    align=4    tls 
;       ^^^^^ support.constant.section
section .comment progbits  noalloc noexec  nowrite  align=1 
;       ^^^^^^^^ support.constant.section
section other    progbits  alloc   noexec  nowrite  align=1
;       ^^^^^ - support.constant.section

 ..gotpc
;^^^^^^^ support.constant
 ..gotoff
;^^^^^^^^ support.constant
 ..got
;^^^^^ support.constant
 ..plt
;^^^^^ support.constant
 ..sym
;^^^^^ support.constant
 _GLOBAL_OFFSET_TABLE_
;^^^^^^^^^^^^^^^^^^^^^ support.constant.directive
 __GLOBAL_OFFSET_TABLE_
;^^^^^^^^^^^^^^^^^^^^^^ support.constant.directive
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

 ..tlsie
;^^^^^^^ support.constant
 ..gottpoff
;^^^^^^^^^^ support.constant
       mov  eax,[tid wrt ..tlsie] 
       mov  [gs:eax],ebx

       mov   rax,[rel tid wrt ..gottpoff] 
       mov   rcx,[fs:rax]

global   hashlookup:function, hashtable:data default internal hidden protected
;                   ^^^^^^^^ storage.type.directive
;                                       ^^^^ storage.type.directive
;                                            ^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                                    ^^^^^^^^ storage.modifier.directive variable.parameter.directive
;                                                             ^^^^^^ storage.modifier.directive variable.parameter.directive
;                                                                    ^^^^^^^^^ storage.modifier.directive variable.parameter.directive

global  hashtable:data (hashtable.end - hashtable)
hashtable: 
        db this,that,theother  ; some data here 
.end:

common  dwordarray 128:4
[warning +gnu-elf-extensions]
;         ^^^^^^^^^^^^^^^^^^ support.constant.directive.warning

 library  mylib.rdl ;
;^^^^^^^ support.function.directive
;         ^^^^^^^^^ meta.path string.unquoted

 module  mymodname
;^^^^^^ support.function.directive
;        ^^^^^^^^^ entity.name.namespace
 module  $kernel.core
;^^^^^^ support.function.directive
;        ^^^^^^^^^^^^ entity.name.namespace

global  sys_open:export proc data
;                ^^^^^^ storage.type.directive
;                       ^^^^ storage.modifier.directive variable.parameter.directive
;                            ^^^^ storage.modifier.directive variable.parameter.directive

    library $libc 
    extern  _open:import 
;                 ^^^^^^ storage.type.directive
    extern  _printf:import proc 
;                          ^^^^ storage.modifier.directive variable.parameter.directive
    extern  _errno:import data
;                         ^^^^ storage.modifier.directive variable.parameter.directive

