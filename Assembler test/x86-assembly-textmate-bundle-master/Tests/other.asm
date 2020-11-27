; one-line comment

#if
#elif
#endif

%if 0
%endif

#error \sdf\123
#warning wer

#define asdf = 123


word dword qword tword yword
db dw dd dq dt do dy
res resb resw resd resq rest reso resy
incbin equ times

/* multiline
   comment
   block */

.data
.bss
.text
section test

label1:
	test	ax, bx
label2: jmp label1

db 'some string'
db "another string\0"
