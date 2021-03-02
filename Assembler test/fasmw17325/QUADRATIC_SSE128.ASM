














QUADRATIC_SSE128:

;calculate one iteration
macro QUADRATIC_SSE128_nR x0,y0,x,y,const_2,t1,t2
{
			movaps	t1,const_2
			 mulpd	t1,y
			 mulpd	y,y
			 mulpd	t1,x
			 mulpd	x,x
			 subpd	x,y
			 addpd	x,x0
			movaps	y,y0
			 addpd	y,t1
}

;calculate one iteration as well as r=x^2+y^2
macro QUADRATIC_SSE128_yR x0,y0,x,y,r,const_2,t1,t2
{
			movaps	t1,const_2
			 mulpd	t1,y
			 mulpd	y,y
			 mulpd	t1,x
			 mulpd	x,x
			movaps	t2,x
			 subpd	x,y
			 addpd	y,t2
			 addpd	x,x0
			movaps	r,y
			movaps	y,y0
			 addpd	y,t1
}

virtual at rbp

  .x01	   dq ?,?    ; x
  .y01	   dq ?,?    ; y
  .x23	   dq ?,?
  .y23	   dq ?,?
  .x45	   dq ?,?
  .y45	   dq ?,?
  .x67	   dq ?,?
  .y67	   dq ?,?
 ; l
  .l01	   dq ?,?
  .l23	   dq ?,?
  .l45	   dq ?,?
  .l67	   dq ?,?
 ; i
  .i01	   dq ?,?
  .i23	   dq ?,?
  .i45	   dq ?,?
  .i67	   dq ?,?
 ; t
  .t01	   dq ?,?
  .t23	   dq ?,?
  .t45	   dq ?,?
  .t67	   dq ?,?

  .const_4	dq ?
  .ITERs	dq ?
  .ThreadNumber dq ?

end virtual

			and  rsp,-32
			sub  rsp,32*64
			mov  rbp,rsp

			mov  [.ThreadNumber],rcx
			mov  rbx,[ppvBits]
			mov  edi,ecx
		       imul  ecx,[Bitmap.x]
			lea  rbx,[rbx+4*rcx]

			mov  r15d,[CoreCount]
			lea  r15d,[4*r15-4]
		       imul  r15d,[Bitmap.x]

			mov  rax,qword[const_f8_4]
			mov  qword[.const_4],rax
			xor  eax,eax
			mov  [.ITERs],rax

	     .l1:	xor  esi,esi
	     .l2:

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




  .startmain:
		; div x coords into 2

		      movsd  xmm0,qword[xcoords+8*rsi+8*0]
		      movsd  xmm1,qword[xcoords+8*rsi+8*1]
		      addsd  xmm1,xmm0
		      mulsd  xmm1,qword[const_f8_1d2]

		      movsd  qword[.x01+8*0],xmm0
		      movsd  qword[.x01+8*1],xmm1
		     movaps  xmm0,dqword[.x01]
		     movaps  dqword[.x23],xmm0
		     movaps  dqword[.x45],xmm0
		     movaps  dqword[.x67],xmm0
		     movaps  xmm2,xmm0
		     movaps  xmm4,xmm0
		     movaps  xmm6,xmm0

	       ; div y coords into 4

		    movddup  xmm8,qword[const_f8_1d2]
		    movddup  xmm1,qword[ycoords+8*rdi+8*0]
		    movddup  xmm9,qword[ycoords+8*rdi+8*1]
		     movaps  xmm5,xmm1
		      addpd  xmm5,xmm9
		      mulpd  xmm5,xmm8
		     movaps  xmm3,xmm1
		      addpd  xmm3,xmm5
		      mulpd  xmm3,xmm8
		     movaps  xmm7,xmm5
		      addpd  xmm7,xmm9
		      mulpd  xmm7,xmm8

		     movaps  dqword[.y01],xmm1
		     movaps  dqword[.y23],xmm3
		     movaps  dqword[.y45],xmm5
		     movaps  dqword[.y67],xmm7

			mov  ecx,[Depth]
		      xorps  xmm8,xmm8
		      xorps  xmm9,xmm9
		      xorps  xmm10,xmm10
		      xorps  xmm11,xmm11
		    movddup  xmm14,qword[const_f8_R]
		    movddup  xmm15,qword[const_f8_2]
		     movapd  dqword[.l01],xmm14
		     movapd  dqword[.l23],xmm14
		     movapd  dqword[.l45],xmm14
		     movapd  dqword[.l67],xmm14

		      align  64
 .mainloop:
		     movaps  dqword[.i01],xmm8
		     movaps  dqword[.i23],xmm9
		     movaps  dqword[.i45],xmm10
		     movaps  dqword[.i67],xmm11

	QUADRATIC_SSE128_yR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm8,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_yR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm9,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_yR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm10,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_yR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm11,xmm15,xmm13,xmm12

		      maxpd  xmm8,dqword[.l01]
		      maxpd  xmm9,dqword[.l23]
		      maxpd  xmm10,dqword[.l45]
		      maxpd  xmm11,dqword[.l67]
		     movaps  dqword[.l01],xmm8
		     movaps  dqword[.l23],xmm9
		     movaps  dqword[.l45],xmm10
		     movaps  dqword[.l67],xmm11

	QUADRATIC_SSE128_nR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm15,xmm13,xmm12

		    cmplepd  xmm8,xmm14
		    cmplepd  xmm9,xmm14
		    cmplepd  xmm10,xmm14
		    cmplepd  xmm11,xmm14

	QUADRATIC_SSE128_nR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm15,xmm13,xmm12

		     movaps  xmm12,xmm8
		       orpd  xmm12,xmm9
		       orpd  xmm12,xmm10
		       orpd  xmm12,xmm11
		   movmskpd  eax,xmm12

	QUADRATIC_SSE128_nR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm15,xmm13,xmm12

		      andps  xmm0,xmm8
		      andps  xmm1,xmm8
		      andps  xmm2,xmm9
		      andps  xmm3,xmm9
		      andps  xmm4,xmm10
		      andps  xmm5,xmm10
		      andps  xmm6,xmm11
		      andps  xmm7,xmm11

		    movddup  xmm13,qword[.const_4]
		      andps  xmm8,xmm13
		      andps  xmm9,xmm13
		      andps  xmm10,xmm13
		      andps  xmm11,xmm13

		      addpd  xmm8,dqword[.i01]
		      addpd  xmm9,dqword[.i23]
		      addpd  xmm10,dqword[.i45]
		      addpd  xmm11,dqword[.i67]

		       test  eax,eax
			 jz  @f
			sub  ecx,1
			jnz  .mainloop
		   @@:

		     movaps  dqword[.i01],xmm8
		     movaps  dqword[.i23],xmm9
		     movaps  dqword[.i45],xmm10
		     movaps  dqword[.i67],xmm11

			sub  ecx,[Depth]
		       imul  ecx,-16*2
			add  [.ITERs],rcx

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; this is very expensive
; not much accuracy is required here
; so cheap alternative should be found

			lea  rdx,[.l01]
			mov  r8d,8
 .logloop:	       fld1
			fld  qword[const_f8_1dlgR]
			fld  qword[rdx]
		      fyl2x
		      fyl2x
		       fchs
		       fstp  qword[rdx+8*16]
			add  rdx,8
			sub  r8d,1
			jnz  .logloop

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		       pxor  xmm7,xmm7
			lea  rdx,[.l01]
			mov  r8d,8
 .colorloop:
		     comisd  xmm14,qword[rdx]
		       pxor  xmm0,xmm0
			jae  .max

    .overflow:	      movsd  xmm4,qword[rdx+8*16]
		      subsd  xmm4,qword[const_f8_1d2]
		   cvtsd2si  eax,qword[rdx+8*8] 	    ; iteration count
		   cvtsd2si  ecx,xmm4
			add  eax,ecx

		   cvtsi2sd  xmm5,ecx
		      movsd  xmm4,qword[rdx+8*16]
		      subsd  xmm4,xmm5
		      mulsd  xmm4,qword[const_f8_256]

			and  eax,256-1
		   cvtsd2si  ecx,xmm4
		       imul  rcx,qword[const_i2x4_1]

		       movq  xmm0,qword[ColorTable+8*rax+8*0]
		       movq  xmm1,qword[ColorTable+8*rax+8*1]
		       movq  xmm2,qword[const_i2x4_256]
		       movq  xmm3,rcx
		      psubq  xmm2,xmm3

		     pmullw  xmm1,xmm3
		     pmullw  xmm0,xmm2
		      paddw  xmm0,xmm1
		      psrlw  xmm0,8

    .max:	      paddw  xmm7,xmm0
			add  rdx,8
			sub  r8d,1
			jnz  .colorloop

		      psrlw  xmm7,3	  ;divide by eight

		   packuswb  xmm7,xmm7

; write to ppvBits right here
    .write:	       movd  dword[rbx],xmm7
    .done:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			add  rbx,4
			add  esi,1
			cmp  esi,[Bitmap.x]
			 jb  .l2


			add  rbx,r15

			add  edi,dword[CoreCount]
			cmp  edi,[Bitmap.y]
			 jb  .l1

			mov  rax,[.ITERs]
		   lock add  [ITERs],rax

		     invoke  ExitThread,0







QUADRATIC_SSE128_noAA:


virtual at rbp

  .x01	   dq ?,?    ; x
  .y01	   dq ?,?    ; y
  .x23	   dq ?,?
  .y23	   dq ?,?
  .x45	   dq ?,?
  .y45	   dq ?,?
  .x67	   dq ?,?
  .y67	   dq ?,?
 ; l
  .l01	   dq ?,?
  .l23	   dq ?,?
  .l45	   dq ?,?
  .l67	   dq ?,?
 ; i
  .i01	   dq ?,?
  .i23	   dq ?,?
  .i45	   dq ?,?
  .i67	   dq ?,?
 ; t
  .t01	   dq ?,?
  .t23	   dq ?,?
  .t45	   dq ?,?
  .t67	   dq ?,?

  .const_4	dq ?
  .ITERs	dq ?
  .ThreadNumber dq ?

end virtual

			and  rsp,-32
			sub  rsp,32*64
			mov  rbp,rsp


			mov  rbx,[ppvBits]
			mov  edi,ecx
		       imul  ecx,[Bitmap.x]
			lea  rbx,[rbx+4*rcx]

			mov  r15d,[CoreCount]
			lea  r15d,[4*r15-4]
		       imul  r15d,[Bitmap.x]

			mov  rax,qword[const_f8_4]
			mov  qword[.const_4],rax
			xor  eax,eax
			mov  [.ITERs],rax

	     .l1:	xor  esi,esi
	     .l2:

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		; take 8 x coors

		     movaps  xmm0,dqword[xcoords+8*rsi+8*0]
		     movaps  xmm2,dqword[xcoords+8*rsi+8*2]
		     movaps  xmm4,dqword[xcoords+8*rsi+8*4]
		     movaps  xmm6,dqword[xcoords+8*rsi+8*6]
		     movaps  dqword[.x01],xmm0
		     movaps  dqword[.x23],xmm2
		     movaps  dqword[.x45],xmm4
		     movaps  dqword[.x67],xmm6

	       ; same y coords

		    movddup  xmm1,qword[ycoords+8*rdi+8*0]
		     movaps  xmm3,xmm1
		     movaps  xmm5,xmm1
		     movaps  xmm7,xmm1
		     movaps  dqword[.y01],xmm1
		     movaps  dqword[.y23],xmm3
		     movaps  dqword[.y45],xmm5
		     movaps  dqword[.y67],xmm7

			mov  ecx,[Depth]
		      xorps  xmm8,xmm8
		      xorps  xmm9,xmm9
		      xorps  xmm10,xmm10
		      xorps  xmm11,xmm11
		    movddup  xmm14,qword[const_f8_R]
		    movddup  xmm15,qword[const_f8_2]
		     movapd  dqword[.l01],xmm14
		     movapd  dqword[.l23],xmm14
		     movapd  dqword[.l45],xmm14
		     movapd  dqword[.l67],xmm14

		      align  64
 .mainloop:
		     movaps  dqword[.i01],xmm8
		     movaps  dqword[.i23],xmm9
		     movaps  dqword[.i45],xmm10
		     movaps  dqword[.i67],xmm11

	QUADRATIC_SSE128_yR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm8,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_yR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm9,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_yR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm10,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_yR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm11,xmm15,xmm13,xmm12

		      maxpd  xmm8,dqword[.l01]
		      maxpd  xmm9,dqword[.l23]
		      maxpd  xmm10,dqword[.l45]
		      maxpd  xmm11,dqword[.l67]
		     movaps  dqword[.l01],xmm8
		     movaps  dqword[.l23],xmm9
		     movaps  dqword[.l45],xmm10
		     movaps  dqword[.l67],xmm11

	QUADRATIC_SSE128_nR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm15,xmm13,xmm12

		    cmplepd  xmm8,xmm14
		    cmplepd  xmm9,xmm14
		    cmplepd  xmm10,xmm14
		    cmplepd  xmm11,xmm14

	QUADRATIC_SSE128_nR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm15,xmm13,xmm12

		     movaps  xmm12,xmm8
		       orpd  xmm12,xmm9
		       orpd  xmm12,xmm10
		       orpd  xmm12,xmm11
		   movmskpd  eax,xmm12

	QUADRATIC_SSE128_nR  dqword[.x01],dqword[.y01],xmm0,xmm1,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x23],dqword[.y23],xmm2,xmm3,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x45],dqword[.y45],xmm4,xmm5,xmm15,xmm13,xmm12
	QUADRATIC_SSE128_nR  dqword[.x67],dqword[.y67],xmm6,xmm7,xmm15,xmm13,xmm12

		    movddup  xmm13,qword[.const_4]
		      andps  xmm8,xmm13
		      andps  xmm9,xmm13
		      andps  xmm10,xmm13
		      andps  xmm11,xmm13

		      addpd  xmm8,dqword[.i01]
		      addpd  xmm9,dqword[.i23]
		      addpd  xmm10,dqword[.i45]
		      addpd  xmm11,dqword[.i67]

		       test  eax,eax
			 jz  @f
			sub  ecx,1
			jnz  .mainloop
		   @@:

		     movaps  dqword[.i01],xmm8
		     movaps  dqword[.i23],xmm9
		     movaps  dqword[.i45],xmm10
		     movaps  dqword[.i67],xmm11

			sub  ecx,[Depth]
		       imul  ecx,-16*2
			add  [.ITERs],rcx


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			lea  rdx,[.l01]
			mov  r8d,8
 .colorloop:
		       pxor  xmm7,xmm7
		     comisd  xmm14,qword[rdx]
		       pxor  xmm0,xmm0
			jae  .max


    .overflow:
		   cvtsd2si  eax,qword[rdx+8*8]
			and  eax,256-1
		       movq  xmm7,qword[ColorTable+8*rax+8*0]
		   packuswb  xmm7,xmm7

    .max:

; write to ppvBits right here
		       movd  dword[rbx],xmm7
			add  rbx,4

			add  rdx,8
			sub  r8d,1
			jnz  .colorloop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			add  esi,8
			cmp  esi,[Bitmap.x]
			 jb  .l2


			add  rbx,r15

			add  edi,dword[CoreCount]
			cmp  edi,[Bitmap.y]
			 jb  .l1

			mov  rax,[.ITERs]
		   lock add  [ITERs],rax

		     invoke  ExitThread,0
