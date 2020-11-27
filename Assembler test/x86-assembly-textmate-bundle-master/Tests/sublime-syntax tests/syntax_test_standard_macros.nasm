; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%clear
;<- punctuation.definition.keyword.preprocessor
;^^^^^ keyword.control.preprocessor

 __NASM_MAJOR__
;^^^^^^^^^^^^^ support.function
 __NASM_MINOR__
;^^^^^^^^^^^^^^ support.function
 __NASM_SUBMINOR__
;^^^^^^^^^^^^^^^^^ support.function
 ___NASM_PATCHLEVEL__
;^^^^^^^^^^^^^^^^^^^^ support.function
 __NASM_SNAPSHOT__
;^^^^^^^^^^^^^^^^^ support.function
 __NASM_VERSION_ID__
;^^^^^^^^^^^^^^^^^^^ support.function
 __NASM_VER__
;^^^^^^^^^^^^ support.function
 __FILE__
;^^^^^^^^ support.function
 __LINE__
;^^^^^^^^ support.function
 __BITS__
;^^^^^^^^ support.function
 __OUTPUT_FORMAT__
;^^^^^^^^^^^^^^^^^ support.function
 __DATE__
;^^^^^^^^ support.function
 __TIME__
;^^^^^^^^ support.function
 __DATE_NUM__
;^^^^^^^^^^^^ support.function
 __TIME_NUM__
;^^^^^^^^^^^^ support.function
 __UTC_DATE__
;^^^^^^^^^^^^ support.function
 __UTC_TIME__
;^^^^^^^^^^^^ support.function
 __UTC_DATE_NUM__
;^^^^^^^^^^^^^^^^ support.function
 __UTC_TIME_NUM__
;^^^^^^^^^^^^^^^^ support.function
 __POSIX_TIME__
;^^^^^^^^^^^^^^ support.function

__USE_package__
 __USE_ALTREG__
;^^^^^^^^^^^^^^ support.function
 __USE_SMARTALIGN__
;^^^^^^^^^^^^^^^^^^ support.function
 __USE_FP__
;^^^^^^^^^^ support.function
 __USE_IFUNC__
;^^^^^^^^^^^^^ support.function

 __PASS__
;^^^^^^^^ invalid.deprecated

%macro  notdeadyet 0 
        push    eax 
        mov     eax,__LINE__ 
        call    stillhere 
        pop     eax 
%endmacro

%ifidn __OUTPUT_FORMAT__, win32 
 %define NEWLINE 13, 10 
%elifidn __OUTPUT_FORMAT__, elf32 
 %define NEWLINE 10 
%endif

__DATE__             "2010-01-01" 
__TIME__             "00:00:42" 
__DATE_NUM__         20100101 
__TIME_NUM__         000042 
__UTC_DATE__         "2009-12-31" 
__UTC_TIME__         "21:00:42" 
__UTC_DATE_NUM__     20091231 
__UTC_TIME_NUM__     210042 
__POSIX_TIME__       1262293242