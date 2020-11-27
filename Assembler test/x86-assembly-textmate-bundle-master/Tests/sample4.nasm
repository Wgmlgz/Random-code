;
; nasm -felf32 -g sse4_2StrPcmpistri.asm -l sse4_2StrPcmpistri.lst
; gcc -o sse4_2StrPcmpistri sse4_2StrPcmpistri.o
;
global main 
 
extern printf
extern strlen
extern strcmp
 
section .data
	align 4
	;
	; Fill buf1 with a repeating pattern of ABCD
	;
	buf1:		times 10 dd 0x44434241
	s1:		db "This is a string", 0
	s2:		db "This is a string slightly different string", 0
	s3:		db "This is a str", 0
	fmtStr1:	db "String: %s len: %d", 0x0A, 0
	fmtStr1b:	db "strlen(3): String: %s len: %d", 0x0A, 0
	fmtStr2:	db "s1: =%s= and s2: =%s= compare: %d", 0x0A, 0
	fmtStr2b:	db "strcmp(3): s1: =%s= and s2: =%s= compare: %d", 0x0A, 0
 
;
; Functions will follow the cdecl call convention
;
section .text
	main:			; Using main since we are using gcc to link
 
	sub	esp, -16	; 16 byte align the stack
	sub	esp, 16		; space for four 4 byte parameters
 
	;
	; Null terminate buf1, make it proper C string, length is now 39
	;
	mov	[buf1+39], byte 0x00
 
	lea	eax, [buf1]
	mov	[esp], eax	; Arg1: pointer of string to calculate the length of
	mov	ebx, eax	; Save pointer in ebx since we will use it again
	call	strlenSSE42
	mov	edx, eax	; Copy length of arg1 into edx
 
	mov	[esp+8], edx	; Arg3: length of string
	mov	[esp+4], ebx	; Arg2: pointer to string
	lea	eax, [fmtStr1]
	mov	[esp], eax	; Arg1: pointer to format string
	call	printf		; Call printf(3):
				;	int printf(const char *format, ...);
 
	lea	eax, [buf1]
	mov	[esp], eax	; Arg1: pointer of string to calculate the length of
	mov	ebx, eax	; Save pointer in ebx since we will use it again
	call	strlen		; Call strlen(3):
				;	size_t strlen(const char *s);
	mov	edx, eax	; Copy length of arg1 into edx
 
	mov	[esp+8], edx	; Arg3: length of string
	mov	[esp+4], ebx	; Arg2: pointer to string
	lea	eax, [fmtStr1b]
	mov	[esp], eax	; Arg1: pointer to format string
	call	printf		; Call printf(3):
				;	int printf(const char *format, ...);
 
	lea	eax, [s2]
	mov	[esp+4], eax	; Arg2: pointer to second string to compare
	lea	eax, [s1]
	mov	[esp], eax	; Arg1: pointer to first string to compare
	call	strcmpSSE42
 
	mov	[esp+12], eax	; Arg4: result from strcmpSSE42  
	lea	eax, [s2]
	mov	[esp+8], eax	; Arg3: pointer to second string
	lea	eax, [s1]
	mov	[esp+4], eax	; Arg2: pointer to first string
	lea	eax, [fmtStr2]
	mov	[esp], eax	; Arg1: pointer to format string
	call	printf
 
	lea	eax, [s2]
	mov	[esp+4], eax	; Arg2: pointer to second string to compare
	lea	eax, [s1]
	mov	[esp], eax	; Arg1: pointer to first string to compare
	call	strcmp		; Call strcmp(3):
				;	int strcmp(const char *s1, const char *s2);
 
	mov	[esp+12], eax	; Arg4: result from strcmpSSE42  
	lea	eax, [s2]
	mov	[esp+8], eax	; Arg3: pointer to second string
	lea	eax, [s1]
	mov	[esp+4], eax	; Arg2: pointer to first string
	lea	eax, [fmtStr2b]
	mov	[esp], eax	; Arg1: pointer to format string
	call	printf
 
	lea	eax, [s3]
	mov	[esp+4], eax	; Arg2: pointer to second string to compare
	lea	eax, [s1]
	mov	[esp], eax	; Arg1: pointer to first string to compare
	call	strcmpSSE42
 
	mov	[esp+12], eax	; Arg4: result from strcmpSSE42  
	lea	eax, [s3]
	mov	[esp+8], eax	; Arg3: pointer to second string
	lea	eax, [s1]
	mov	[esp+4], eax	; Arg2: pointer to first string
	lea	eax, [fmtStr2]
	mov	[esp], eax	; Arg1: pointer to format string
	call	printf
 
	lea	eax, [s3]
	mov	[esp+4], eax	; Arg2: pointer to second string to compare
	lea	eax, [s1]
	mov	[esp], eax	; Arg1: pointer to first string to compare
	call	strcmp		; Call strcmp(3):
				;	int strcmp(const char *s1, const char *s2);
 
	mov	[esp+12], eax	; Arg4: result from strcmpSSE42  
	lea	eax, [s3]
	mov	[esp+8], eax	; Arg3: pointer to second string
	lea	eax, [s1]
	mov	[esp+4], eax	; Arg2: pointer to first string
	lea	eax, [fmtStr2b]
	mov	[esp], eax	; Arg1: pointer to format string
	call	printf
 
	call	exit
 
 
;
; size_t strlen(const char *s);
;
strlenSSE42:
	push	ebp
	mov	ebp, esp
 
	mov	edx, [ebp+8]	; Arg1: copy s(pointer to string) to edx 
	;
	; We are looking for null terminating char, so set xmm0 to zero
	;
	pxor	xmm0, xmm0
	mov	eax, -16	; Avoid extra jump in main loop
 
strlenLoop:
	add	eax, 16
	;
	; IMM8[1:0]	= 00b
	;	Src data is unsigned bytes(16 packed unsigned bytes)
	; IMM8[3:2]	= 10b
	; 	We are using Equal Each aggregation
	; IMM8[5:4]	= 00b
	;	Positive Polarity, IntRes2	= IntRes1
	; IMM8[6]	= 0b
	;	ECX contains the least significant set bit in IntRes2
	;
	pcmpistri	xmm0,[edx+eax], 0001000b
	;
	; Loop while ZF != 0, which means none of bytes pointed to by edx+eax
	; are zero.
	;
	jnz	strlenLoop
 
	;
	; ecx will contain the offset from edx+eax where the first null
	; terminating character was found.
	;
	add	eax, ecx
	pop	ebp
	ret
 
;
; int strcmp(const char *s1, const char *s2);
;
strcmpSSE42:
	push	ebp
	mov	ebp, esp
 
	mov	eax, [ebp+8]	; Arg1: copy s1(pointer to string) to eax
	mov	edx, [ebp+12]	; Arg2: copy s2(pointer to string) to edx
	;
	; Subtract s2(edx) from s1(eax). This admititedly looks odd, but we
	; can now use edx to index into s1 and s2. As we adjust edx to move
	; forward into s2, we can then add edx to eax and this will give us
	; the comparable offset into s1 i.e. if we take edx + 16 then:
	;
	;	edx 	= edx + 16		= edx + 16
	;	eax+edx	= eax -edx + edx + 16	= eax + 16
	;
	; therefore edx points to s2 + 16 and eax + edx points to s1 + 16.
	; We thus only need one index, convoluted but effective.
	;
	sub	eax, edx
	sub	edx, 16		; Avoid extra jump in main loop
 
strcmpLoop:
	add	edx, 16
	movdqu	xmm0, [edx]
	;
	; IMM8[1:0]	= 00b
	;	Src data is unsigned bytes(16 packed unsigned bytes)
	; IMM8[3:2]	= 10b
	; 	We are using Equal Each aggregation
	; IMM8[5:4]	= 01b
	;	Negative Polarity, IntRes2	= -1 XOR IntRes1
	; IMM8[6]	= 0b
	;	ECX contains the least significant set bit in IntRes2
	;
	pcmpistri	xmm0, [edx+eax], 0011000b
	;
	; Loop while ZF=0 and CF=0:
	;
	;	1) We find a null in s1(edx+eax) ZF=1
	;	2) We find a char that does not match CF=1
	;
	ja	strcmpLoop
 
	;
	; Jump if CF=1, we found a mismatched char
	;
	jc	strcmpDiff
 
	;
	; We terminated loop due to a null character i.e. CF=0 and ZF=1
	;
	xor	eax, eax	; They are equal so return zero
	jmp	exitStrcmp
 
strcmpDiff:
	add	eax, edx	; Set offset into s1 to match s2
	;
	; ecx is offset from current poition where two strings do not match,
	; so copy the respective non-matching byte into eax and edx and fill
	; in remaining bits w/ zero.
	;
	movzx	eax, byte[eax+ecx]
	movzx	edx, byte[edx+ecx]
	;
	; If s1 is less than s2 return integer less than zero, otherwise return
	; integer greater than zero.
	;
	sub	eax, edx
 
exitStrcmp:
	pop	ebp
	ret
 
exit:
				;
				; Call exit(3) syscall
				;	void exit(int status)
				;
	mov	ebx, 0		; Arg one: the status
	mov	eax, 1		; Syscall number:
	int 	0x80