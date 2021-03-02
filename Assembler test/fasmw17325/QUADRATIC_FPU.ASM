



macro QUADRATIC_FPU_yR x,y,A,B,C,R,_2
{
			fld  _2
		       fmul  st0,A
		       fmul  st0,B
		       fadd  y
		       fxch  A
		       fmul  st0,st0
		       fxch  B
		       fmul  st0,st0
			fld  st0
		       fadd  st0,C
		       fstp  R
		       fadd  x
		     fsubrp  B,st0


}


macro QUADRATIC_FPU_nR x,y,A,B,C
{
			fld  A
		       fmul  st0,C
		       fadd  st0,st0
		       fadd  y
		       fxch  B
		       fmul  st0,st0
		       fxch  C
		       fmul  st0,st0
		       fadd  x
		     fsubrp  C,st0
}





QUADRATIC_FPU:


virtual at rbp
  .X0	    dq ?
  .Y0	    dq ?
  .X1	    dq ?
  .Y1	    dq ?
  .X2	    dq ?
  .Y2	    dq ?
  .X3	    dq ?
  .Y3	    dq ?

  .x0	    dq ?
  .y0	    dq ?
  .x1	    dq ?
  .y1	    dq ?
  .x2	    dq ?
  .y2	    dq ?
  .x3	    dq ?
  .y3	    dq ?

  .r0	    dq ?
  .r1	    dq ?
  .r2	    dq ?
  .r3	    dq ?

  .l0	    dq ?
  .i0	    dd ?
  .t0	    dd ?

  .l1	    dq ?
  .i1	    dd ?
  .t1	    dd ?

  .l2	    dq ?
  .i2	    dd ?
  .t2	    dd ?

  .l3	    dq ?
  .i3	    dd ?
  .t3	    dd ?

  .const_2	dq ?
  .const_R	dq ?
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

			xor  eax,eax
			mov  [.ITERs],rax

		       fld1
		       fadd  st0,st0
		       fstp  qword[.const_2]

			fld  qword[const_f8_R]
		       fstp  qword[.const_R]
		      movsd  xmm14,qword[const_f8_R]

	  .loop1:	xor  esi,esi
	   .loop2:

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  .startmain:
			xor  eax,eax
			mov  qword[.l0],rax
			mov  qword[.i0],rax
			mov  qword[.l1],rax
			mov  qword[.i1],rax
			mov  qword[.l2],rax
			mov  qword[.i2],rax
			mov  qword[.l3],rax
			mov  qword[.i3],rax

			fld  qword[xcoords+8*rsi+8*0]
			fst  qword[.X0]
		       fstp  qword[.x0]
			fld  qword[ycoords+8*rdi+8*0]
			fst  qword[.Y0]
		       fstp  qword[.y0]

			fld  qword[xcoords+8*rsi+8*0]
			fst  qword[.X1]
		       fstp  qword[.x1]
			fld  qword[ycoords+8*rdi+8*0]
		       fadd  qword[ycoords+8*rdi+8*1]
		       fdiv  qword[.const_2]
			fst  qword[.Y1]
		       fstp  qword[.y1]

			fld  qword[xcoords+8*rsi+8*0]
		       fadd  qword[xcoords+8*rsi+8*1]
		       fdiv  qword[.const_2]
			fst  qword[.X2]
		       fstp  qword[.x2]
			fld  qword[ycoords+8*rdi]
			fst  qword[.Y2]
		       fstp  qword[.y2]

			fld  qword[xcoords+8*rsi+8*0]
		       fadd  qword[xcoords+8*rsi+8*1]
		       fdiv  qword[.const_2]
			fst  qword[.X3]
		       fstp  qword[.x3]
			fld  qword[ycoords+8*rdi+8*0]
		       fadd  qword[ycoords+8*rdi+8*1]
		       fdiv  qword[.const_2]
			fst  qword[.Y3]
		       fstp  qword[.y3]

			mov  ecx,dword[Depth]
			 or  r8,-1
			 or  r9,-1
			 or  r10,-1
			 or  r11,-1

		      align  16
 .mainloop:
			fld  qword[.X1]
			fld  qword[.Y1]
			fld  qword[.X0]
			fld  qword[.Y0]
	   QUADRATIC_FPU_yR  qword[.x0],qword[.y0],st1,st2,st3,qword[.r0],qword[.const_2]
		      movsd  xmm0,qword[.r0]
		      maxsd  xmm0,qword[.l0]
		      movsd  qword[.l0],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i0],eax
			and  r8,rax
	   QUADRATIC_FPU_yR  qword[.x1],qword[.y1],st3,st4,st5,qword[.r1],qword[.const_2]
		      movsd  xmm0,qword[.r1]
		      maxsd  xmm0,qword[.l1]
		      movsd  qword[.l1],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i1],eax
			and  r9,rax
	   QUADRATIC_FPU_nR  qword[.x0],qword[.y0],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x1],qword[.y1],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x0],qword[.y0],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x1],qword[.y1],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x0],qword[.y0],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x1],qword[.y1],st2,st3,st4
		       fstp  qword[.Y0]
		       fstp  qword[.X0]
		       fstp  qword[.Y1]
		       fstp  qword[.X1]
			and  qword[.Y0],r8
			and  qword[.X0],r8
			and  qword[.Y1],r9
			and  qword[.X1],r9

			fld  qword[.X3]
			fld  qword[.Y3]
			fld  qword[.X2]
			fld  qword[.Y2]
	   QUADRATIC_FPU_yR  qword[.x2],qword[.y2],st1,st2,st3,qword[.r2],qword[.const_2]
		      movsd  xmm0,qword[.r2]
		      maxsd  xmm0,qword[.l2]
		      movsd  qword[.l2],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i2],eax
			mov  dword[.t2],eax
			and  r10,rax
	   QUADRATIC_FPU_yR  qword[.x3],qword[.y3],st3,st4,st5,qword[.r3],qword[.const_2]
		      movsd  xmm0,qword[.r3]
		      maxsd  xmm0,qword[.l3]
		      movsd  qword[.l3],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i3],eax
			and  r11,rax
	   QUADRATIC_FPU_nR  qword[.x2],qword[.y2],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x3],qword[.y3],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x2],qword[.y2],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x3],qword[.y3],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x2],qword[.y2],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x3],qword[.y3],st2,st3,st4
		       fstp  qword[.Y2]
		       fstp  qword[.X2]
		       fstp  qword[.Y3]
		       fstp  qword[.X3]
			and  qword[.Y2],r10
			and  qword[.X2],r10
			and  qword[.Y3],r11
			and  qword[.X3],r11

			mov  eax,r8d
			 or  eax,r9d
			 or  eax,r10d
			 or  eax,r11d
			 jz  @f
			sub  ecx,1
			jnz  .mainloop
		  @@:

			mov  dword[.t0],r8d
			mov  dword[.t1],r9d
			mov  dword[.t2],r10d
			mov  dword[.t3],r11d

			sub  ecx,[Depth]
		       imul  ecx,-16
			add  [.ITERs],rcx


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


			xor  edx,edx
		       pxor  xmm7,xmm7


 .colorloop:	       pxor  xmm0,xmm0
			mov  eax,dword[.t0+rdx]
		       test  eax,eax
			jnz  .max


		       fld1
			fld  qword[const_f8_1dlgR]
			fld  qword[.l0+rdx]
		      fyl2x
		      fyl2x
		       fchs
		       fstp  qword[.l0+rdx]

    .overflow:	      movsd  xmm4,qword[.l0+rdx]
		      subsd  xmm4,qword[const_f8_1d2]
		       imul  eax,dword[.i0+rdx],4
		   cvtsd2si  ecx,xmm4
			add  eax,ecx

		   cvtsi2sd  xmm5,ecx
		      movsd  xmm4,qword[.l0+rdx]
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
			add  edx,16
			cmp  edx,16*4
			 jb  .colorloop

; write to ppvBits right here
		      psrlw  xmm7,2
		   packuswb  xmm7,xmm7
		       movd  dword[rbx],xmm7
			add  rbx,4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			add  esi,1
			cmp  esi,[Bitmap.x]
			 jb  .loop2


			add  rbx,r15

			add  edi,dword[CoreCount]
			cmp  edi,[Bitmap.y]
			 jb  .loop1

			mov  rax,[.ITERs]
		   lock add  [ITERs],rax

		     invoke  ExitThread,0







QUADRATIC_FPU_noAA:


virtual at rbp
  .X0	    dq ?
  .Y0	    dq ?
  .X1	    dq ?
  .Y1	    dq ?
  .X2	    dq ?
  .Y2	    dq ?
  .X3	    dq ?
  .Y3	    dq ?

  .x0	    dq ?
  .y0	    dq ?
  .x1	    dq ?
  .y1	    dq ?
  .x2	    dq ?
  .y2	    dq ?
  .x3	    dq ?
  .y3	    dq ?

  .r0	    dq ?
  .r1	    dq ?
  .r2	    dq ?
  .r3	    dq ?

  .l0	    dq ?
  .i0	    dd ?
  .t0	    dd ?

  .l1	    dq ?
  .i1	    dd ?
  .t1	    dd ?

  .l2	    dq ?
  .i2	    dd ?
  .t2	    dd ?

  .l3	    dq ?
  .i3	    dd ?
  .t3	    dd ?

  .const_2	dq ?
  .const_R	dq ?
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

			xor  eax,eax
			mov  [.ITERs],rax

		       fld1
		       fadd  st0,st0
		       fstp  qword[.const_2]

			fld  qword[const_f8_R]
		       fstp  qword[.const_R]
		      movsd  xmm14,qword[const_f8_R]

	  .loop1:	xor  esi,esi
	   .loop2:

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  .startmain:
			xor  eax,eax
			mov  qword[.l0],rax
			mov  qword[.i0],rax
			mov  qword[.l1],rax
			mov  qword[.i1],rax
			mov  qword[.l2],rax
			mov  qword[.i2],rax
			mov  qword[.l3],rax
			mov  qword[.i3],rax

			fld  qword[xcoords+8*rsi+8*0]
			fst  qword[.X0]
		       fstp  qword[.x0]
			fld  qword[ycoords+8*rdi]
			fst  qword[.Y0]
		       fstp  qword[.y0]

			fld  qword[xcoords+8*rsi+8*1]
			fst  qword[.X1]
		       fstp  qword[.x1]
			fld  qword[ycoords+8*rdi]
			fst  qword[.Y1]
		       fstp  qword[.y1]

			fld  qword[xcoords+8*rsi+8*2]
			fst  qword[.X2]
		       fstp  qword[.x2]
			fld  qword[ycoords+8*rdi]
			fst  qword[.Y2]
		       fstp  qword[.y2]

			fld  qword[xcoords+8*rsi+8*3]
			fst  qword[.X3]
		       fstp  qword[.x3]
			fld  qword[ycoords+8*rdi]
			fst  qword[.Y3]
		       fstp  qword[.y3]

			mov  ecx,dword[Depth]
			 or  r8,-1
			 or  r9,-1
			 or  r10,-1
			 or  r11,-1

		      align  16
 .mainloop:
			fld  qword[.X1]
			fld  qword[.Y1]
			fld  qword[.X0]
			fld  qword[.Y0]
	   QUADRATIC_FPU_yR  qword[.x0],qword[.y0],st1,st2,st3,qword[.r0],qword[.const_2]
		      movsd  xmm0,qword[.r0]
		      maxsd  xmm0,qword[.l0]
		      movsd  qword[.l0],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i0],eax
			and  r8,rax
	   QUADRATIC_FPU_yR  qword[.x1],qword[.y1],st3,st4,st5,qword[.r1],qword[.const_2]
		      movsd  xmm0,qword[.r1]
		      maxsd  xmm0,qword[.l1]
		      movsd  qword[.l1],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i1],eax
			and  r9,rax
	   QUADRATIC_FPU_nR  qword[.x0],qword[.y0],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x1],qword[.y1],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x0],qword[.y0],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x1],qword[.y1],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x0],qword[.y0],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x1],qword[.y1],st2,st3,st4
		       fstp  qword[.Y0]
		       fstp  qword[.X0]
		       fstp  qword[.Y1]
		       fstp  qword[.X1]
			and  qword[.Y0],r8
			and  qword[.X0],r8
			and  qword[.Y1],r9
			and  qword[.X1],r9

			fld  qword[.X3]
			fld  qword[.Y3]
			fld  qword[.X2]
			fld  qword[.Y2]
	   QUADRATIC_FPU_yR  qword[.x2],qword[.y2],st1,st2,st3,qword[.r2],qword[.const_2]
		      movsd  xmm0,qword[.r2]
		      maxsd  xmm0,qword[.l2]
		      movsd  qword[.l2],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i2],eax
			mov  dword[.t2],eax
			and  r10,rax
	   QUADRATIC_FPU_yR  qword[.x3],qword[.y3],st3,st4,st5,qword[.r3],qword[.const_2]
		      movsd  xmm0,qword[.r3]
		      maxsd  xmm0,qword[.l3]
		      movsd  qword[.l3],xmm0
		     comisd  xmm0,xmm14
			sbb  rax,rax
			sub  dword[.i3],eax
			and  r11,rax
	   QUADRATIC_FPU_nR  qword[.x2],qword[.y2],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x3],qword[.y3],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x2],qword[.y2],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x3],qword[.y3],st2,st3,st4
	   QUADRATIC_FPU_nR  qword[.x2],qword[.y2],st0,st1,st2
	   QUADRATIC_FPU_nR  qword[.x3],qword[.y3],st2,st3,st4
		       fstp  qword[.Y2]
		       fstp  qword[.X2]
		       fstp  qword[.Y3]
		       fstp  qword[.X3]
			and  qword[.Y2],r10
			and  qword[.X2],r10
			and  qword[.Y3],r11
			and  qword[.X3],r11

			mov  eax,r8d
			 or  eax,r9d
			 or  eax,r10d
			 or  eax,r11d
			 jz  @f
			sub  ecx,1
			jnz  .mainloop
		  @@:

			mov  dword[.t0],r8d
			mov  dword[.t1],r9d
			mov  dword[.t2],r10d
			mov  dword[.t3],r11d

			sub  ecx,[Depth]
		       imul  ecx,-16
			add  [.ITERs],rcx

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


			xor  edx,edx

 .colorloop:
		       pxor  xmm7,xmm7

			mov  eax,dword[.t0+rdx]
		       test  eax,eax
			jnz  .max

    .overflow:
		       imul  eax,dword[.i0+rdx],4
			and  eax,256-1
		       movq  xmm7,qword[ColorTable+8*rax+8*0]
		   packuswb  xmm7,xmm7

    .max:

; write to ppvBits right here
		       movd  dword[rbx],xmm7
			add  rbx,4

			add  rdx,16
			cmp  rdx,16*4
			 jb  .colorloop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			add  esi,4
			cmp  esi,[Bitmap.x]
			 jb  .loop2


			add  rbx,r15

			add  edi,dword[CoreCount]
			cmp  edi,[Bitmap.y]
			 jb  .loop1

			mov  rax,[.ITERs]
		   lock add  [ITERs],rax

		     invoke  ExitThread,0
