














QUADRATIC_4FMA256:

;calculate one iteration
macro QUADRATIC_4FMA256_nR x0,y0,x,y,const_2,t1,t2
{
			vmulpd	t1,y,const_2
			vmulpd	t2,x,x
			vmulpd	y,y,y
			vmulpd	t1,t1,x
			vsubpd	x,t2,y
			vaddpd	y,t1,y0
			vaddpd	x,x,x0
}

;calculate one iteration as well as r=x^2+y^2
macro QUADRATIC_4FMA256_yR x0,y0,x,y,r,const_2,t1,t2
{
			vmulpd	t1,y,const_2
			vmulpd	r,x,x
			vmulpd	y,y,y
			vmulpd	t1,t1,x
			vsubpd	x,r,y
			vaddpd	r,r,y
			vaddpd	y,t1,y0
			vaddpd	x,x,x0
}

virtual at rbp

  .x0123     dq ?,?,?,?    ; x
  .y0123     dq ?,?,?,?    ; y
  .x4567     dq ?,?,?,?
  .y4567     dq ?,?,?,?
  .x89AB     dq ?,?,?,?
  .y89AB     dq ?,?,?,?
  .xCDEF     dq ?,?,?,?
  .yCDEF     dq ?,?,?,?
 ; l
  .l0123     dq ?,?,?,?
  .l4567     dq ?,?,?,?
  .l89AB     dq ?,?,?,?
  .lCDEF     dq ?,?,?,?
 ; i
  .i0123     dq ?,?,?,?
  .i4567     dq ?,?,?,?
  .i89AB     dq ?,?,?,?
  .iCDEF     dq ?,?,?,?
 ; t
  .t0123     dq ?,?,?,?
  .t4567     dq ?,?,?,?
  .t89AB     dq ?,?,?,?
  .tCDEF     dq ?,?,?,?

 ; const
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

	     .l1:	xor  esi,esi
	     .l2:

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




  .startmain:
		; div x coords into 4

		     vmovsd  xmm0,qword[xcoords+8*rsi+8*0]
		     vmovsd  xmm4,qword[xcoords+8*rsi+8*1]
		     vaddsd  xmm2,xmm0,xmm4
		     vmulsd  xmm2,xmm2,qword[const_f8_1d2]
		     vaddsd  xmm1,xmm0,xmm2
		     vmulsd  xmm1,xmm1,qword[const_f8_1d2]
		     vaddsd  xmm3,xmm2,xmm4
		     vmulsd  xmm3,xmm3,qword[const_f8_1d2]

		     vmovsd  qword[.x0123+8*0],xmm0
		     vmovsd  qword[.x0123+8*1],xmm1
		     vmovsd  qword[.x0123+8*2],xmm2
		     vmovsd  qword[.x0123+8*3],xmm3
		    vmovapd  ymm0,qqword[.x0123]
		    vmovapd  qqword[.x4567],ymm0
		    vmovapd  qqword[.x89AB],ymm0
		    vmovapd  qqword[.xCDEF],ymm0
		    vmovapd  ymm2,ymm0
		    vmovapd  ymm4,ymm0
		    vmovapd  ymm6,ymm0

	       ; div y coords into 4

	       vbroadcastsd  ymm8,qword[const_f8_1d2]
	       vbroadcastsd  ymm1,qword[ycoords+8*rdi+8*0]
	       vbroadcastsd  ymm9,qword[ycoords+8*rdi+8*1]
		     vaddpd  ymm5,ymm1,ymm9
		     vmulpd  ymm5,ymm5,ymm8
		     vaddpd  ymm3,ymm1,ymm5
		     vmulpd  ymm3,ymm3,ymm8
		     vaddpd  ymm7,ymm5,ymm9
		     vmulpd  ymm7,ymm7,ymm8

		    vmovapd  qqword[.y0123],ymm1
		    vmovapd  qqword[.y4567],ymm3
		    vmovapd  qqword[.y89AB],ymm5
		    vmovapd  qqword[.yCDEF],ymm7

			mov  ecx,[Depth]
		     vxorpd  ymm8,ymm8,ymm8
		     vxorpd  ymm9,ymm9,ymm9
		     vxorpd  ymm10,ymm10,ymm10
		     vxorpd  ymm11,ymm11,ymm11
	       vbroadcastsd  ymm14,qword[const_f8_R]
	       vbroadcastsd  ymm15,qword[const_f8_2]
		    vmovapd  qqword[.l0123],ymm14
		    vmovapd  qqword[.l4567],ymm14
		    vmovapd  qqword[.l89AB],ymm14
		    vmovapd  qqword[.lCDEF],ymm14

		      align  64
 .mainloop:
		    vmovapd  qqword[.i0123],ymm8
		    vmovapd  qqword[.i4567],ymm9
		    vmovapd  qqword[.i89AB],ymm10
		    vmovapd  qqword[.iCDEF],ymm11

       QUADRATIC_4FMA256_yR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm8,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_yR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm9,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_yR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm10,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_yR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm11,ymm15,ymm13,ymm12

		     vmaxpd  ymm8,ymm8,qqword[.l0123]
		     vmaxpd  ymm9,ymm9,qqword[.l4567]
		     vmaxpd  ymm10,ymm10,qqword[.l89AB]
		     vmaxpd  ymm11,ymm11,qqword[.lCDEF]
		    vmovapd  qqword[.l0123],ymm8
		    vmovapd  qqword[.l4567],ymm9
		    vmovapd  qqword[.l89AB],ymm10
		    vmovapd  qqword[.lCDEF],ymm11

       QUADRATIC_4FMA256_nR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm15,ymm13,ymm12

		   vcmplepd  ymm8,ymm8,ymm14
		   vcmplepd  ymm9,ymm9,ymm14
		   vcmplepd  ymm10,ymm10,ymm14
		   vcmplepd  ymm11,ymm11,ymm14

       QUADRATIC_4FMA256_nR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm15,ymm13,ymm12

		      vorpd  ymm12,ymm8,ymm9
		      vorpd  ymm12,ymm12,ymm10
		      vorpd  ymm12,ymm12,ymm11
		  vmovmskpd  eax,ymm12

       QUADRATIC_4FMA256_nR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm15,ymm13,ymm12

		     vandpd  ymm0,ymm0,ymm8
		     vandpd  ymm1,ymm1,ymm8
		     vandpd  ymm2,ymm2,ymm9
		     vandpd  ymm3,ymm3,ymm9
		     vandpd  ymm4,ymm4,ymm10
		     vandpd  ymm5,ymm5,ymm10
		     vandpd  ymm6,ymm6,ymm11
		     vandpd  ymm7,ymm7,ymm11

	       vbroadcastsd  ymm13,qword[const_f8_4]
		     vandpd  ymm8,ymm8,ymm13
		     vandpd  ymm9,ymm9,ymm13
		     vandpd  ymm10,ymm10,ymm13
		     vandpd  ymm11,ymm11,ymm13

		     vaddpd  ymm8,ymm8,qqword[.i0123]
		     vaddpd  ymm9,ymm9,qqword[.i4567]
		     vaddpd  ymm10,ymm10,qqword[.i89AB]
		     vaddpd  ymm11,ymm11,qqword[.iCDEF]

		       test  eax,eax
			 jz  @f
			sub  ecx,1
			jnz  .mainloop
		   @@:

		    vmovapd  qqword[.i0123],ymm8
		    vmovapd  qqword[.i4567],ymm9
		    vmovapd  qqword[.i89AB],ymm10
		    vmovapd  qqword[.iCDEF],ymm11

			sub  ecx,[Depth]
		       imul  ecx,-16*4
			add  [.ITERs],rcx

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; this is very expensive
; not much accuracy is required here
; so cheap alternative should be found

			lea  rdx,[.l0123]
			mov  r8d,16
 .logloop:	       fld1
			fld  qword[const_f8_1dlgR]
			fld  qword[rdx]
		      fyl2x
		      fyl2x
		       fchs
		       fstp  qword[rdx+8*32]
			add  rdx,8
			sub  r8d,1
			jnz  .logloop

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		      vpxor  xmm7,xmm7,xmm7
			lea  rdx,[.l0123]
			mov  r8d,16
 .colorloop:
		    vcomisd  xmm14,qword[rdx]
		      vpxor  xmm0,xmm0,xmm0
			jae  .max

    .overflow:	     vmovsd  xmm4,qword[rdx+8*32]
		     vsubsd  xmm4,xmm4,qword[const_f8_1d2]
		  vcvtsd2si  eax,qword[rdx+4*32]
		  vcvtsd2si  ecx,xmm4
			add  eax,ecx

		  vcvtsi2sd  xmm5,xmm5,ecx
		     vmovsd  xmm4,qword[rdx+8*32]
		     vsubsd  xmm4,xmm4,xmm5
		     vmulsd  xmm4,xmm4,qword[const_f8_256]

			and  eax,256-1
		  vcvtsd2si  ecx,xmm4
		       imul  rcx,qword[const_i2x4_1]

		      vmovq  xmm0,qword[ColorTable+8*rax+8*0]
		      vmovq  xmm1,qword[ColorTable+8*rax+8*1]
		      vmovq  xmm2,qword[const_i2x4_256]
		      vmovq  xmm3,rcx
		     vpsubq  xmm2,xmm2,xmm3

		    vpmullw  xmm1,xmm1,xmm3
		    vpmullw  xmm0,xmm0,xmm2
		     vpaddw  xmm0,xmm0,xmm1
		     vpsrlw  xmm0,xmm0,8

    .max:	     vpaddw  xmm7,xmm7,xmm0
			add  rdx,8
			sub  r8d,1
			jnz  .colorloop

		     vpsrlw  xmm7,xmm7,4

		  vpackuswb  xmm7,xmm7,xmm7

; write to ppvBits right here
    .write:	      vmovd  dword[rbx],xmm7
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







QUADRATIC_4FMA256_noAA:


virtual at rbp

  .x0123     dq ?,?,?,?    ; x
  .y0123     dq ?,?,?,?    ; y
  .x4567     dq ?,?,?,?
  .y4567     dq ?,?,?,?
  .x89AB     dq ?,?,?,?
  .y89AB     dq ?,?,?,?
  .xCDEF     dq ?,?,?,?
  .yCDEF     dq ?,?,?,?
 ; l
  .l0123     dq ?,?,?,?
  .l4567     dq ?,?,?,?
  .l89AB     dq ?,?,?,?
  .lCDEF     dq ?,?,?,?
 ; i
  .i0123     dq ?,?,?,?
  .i4567     dq ?,?,?,?
  .i89AB     dq ?,?,?,?
  .iCDEF     dq ?,?,?,?
 ; t
  .t0123     dq ?,?,?,?
  .t4567     dq ?,?,?,?
  .t89AB     dq ?,?,?,?
  .tCDEF     dq ?,?,?,?
 ; const
  .ITERs     dq ?

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

			xor  eax,eax
			mov  [.ITERs],rax

	     .l1:	xor  esi,esi
	     .l2:

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		; div x coords into 4

		    vmovapd  ymm0,qqword[xcoords+8*rsi+8*0]
		    vmovapd  ymm2,qqword[xcoords+8*rsi+8*4]
		    vmovapd  ymm4,qqword[xcoords+8*rsi+8*8]
		    vmovapd  ymm6,qqword[xcoords+8*rsi+8*12]
		    vmovapd  qqword[.x0123],ymm0
		    vmovapd  qqword[.x4567],ymm2
		    vmovapd  qqword[.x89AB],ymm4
		    vmovapd  qqword[.xCDEF],ymm6

	       ; same y coords

	       vbroadcastsd  ymm1,qword[ycoords+8*rdi+8*0]
		    vmovapd  ymm3,ymm1
		    vmovapd  ymm5,ymm1
		    vmovapd  ymm7,ymm1
		    vmovapd  qqword[.y0123],ymm1
		    vmovapd  qqword[.y4567],ymm3
		    vmovapd  qqword[.y89AB],ymm5
		    vmovapd  qqword[.yCDEF],ymm7

			mov  ecx,[Depth]
		     vxorpd  ymm8,ymm8,ymm8
		     vxorpd  ymm9,ymm9,ymm9
		     vxorpd  ymm10,ymm10,ymm10
		     vxorpd  ymm11,ymm11,ymm11
	       vbroadcastsd  ymm14,qword[const_f8_R]
	       vbroadcastsd  ymm15,qword[const_f8_2]
		    vmovapd  qqword[.l0123],ymm14
		    vmovapd  qqword[.l4567],ymm14
		    vmovapd  qqword[.l89AB],ymm14
		    vmovapd  qqword[.lCDEF],ymm14

		      align  64
 .mainloop:
		    vmovapd  qqword[.i0123],ymm8
		    vmovapd  qqword[.i4567],ymm9
		    vmovapd  qqword[.i89AB],ymm10
		    vmovapd  qqword[.iCDEF],ymm11

       QUADRATIC_4FMA256_yR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm8,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_yR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm9,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_yR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm10,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_yR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm11,ymm15,ymm13,ymm12

		     vmaxpd  ymm8,ymm8,qqword[.l0123]
		     vmaxpd  ymm9,ymm9,qqword[.l4567]
		     vmaxpd  ymm10,ymm10,qqword[.l89AB]
		     vmaxpd  ymm11,ymm11,qqword[.lCDEF]
		    vmovapd  qqword[.l0123],ymm8
		    vmovapd  qqword[.l4567],ymm9
		    vmovapd  qqword[.l89AB],ymm10
		    vmovapd  qqword[.lCDEF],ymm11

       QUADRATIC_4FMA256_nR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm15,ymm13,ymm12

		   vcmplepd  ymm8,ymm8,ymm14
		   vcmplepd  ymm9,ymm9,ymm14
		   vcmplepd  ymm10,ymm10,ymm14
		   vcmplepd  ymm11,ymm11,ymm14

       QUADRATIC_4FMA256_nR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm15,ymm13,ymm12

		      vorpd  ymm12,ymm8,ymm9
		      vorpd  ymm12,ymm12,ymm10
		      vorpd  ymm12,ymm12,ymm11
		  vmovmskpd  eax,ymm12

       QUADRATIC_4FMA256_nR  qqword[.x0123],qqword[.y0123],ymm0,ymm1,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x4567],qqword[.y4567],ymm2,ymm3,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.x89AB],qqword[.y89AB],ymm4,ymm5,ymm15,ymm13,ymm12
       QUADRATIC_4FMA256_nR  qqword[.xCDEF],qqword[.yCDEF],ymm6,ymm7,ymm15,ymm13,ymm12


	       vbroadcastsd  ymm13,qword[const_f8_4]
		     vandpd  ymm8,ymm8,ymm13
		     vandpd  ymm9,ymm9,ymm13
		     vandpd  ymm10,ymm10,ymm13
		     vandpd  ymm11,ymm11,ymm13

		     vaddpd  ymm8,ymm8,qqword[.i0123]
		     vaddpd  ymm9,ymm9,qqword[.i4567]
		     vaddpd  ymm10,ymm10,qqword[.i89AB]
		     vaddpd  ymm11,ymm11,qqword[.iCDEF]

		       test  eax,eax
			 jz  @f
			sub  ecx,1
			jnz  .mainloop
		   @@:

		    vmovapd  qqword[.i0123],ymm8
		    vmovapd  qqword[.i4567],ymm9
		    vmovapd  qqword[.i89AB],ymm10
		    vmovapd  qqword[.iCDEF],ymm11

			sub  ecx,[Depth]
		       imul  ecx,-16*4
			add  [.ITERs],rcx

 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			lea  rdx,[.l0123]
			mov  r8d,16
 .colorloop:
		      vpxor  xmm7,xmm7,xmm7
		    vcomisd  xmm14,qword[rdx]
		      vpxor  xmm0,xmm0,xmm0
			jae  .max

    .overflow:
		  vcvtsd2si  eax,qword[rdx+8*16]
			and  eax,256-1
		      vmovq  xmm0,qword[ColorTable+8*rax+8*0]
		  vpackuswb  xmm7,xmm0,xmm0
    .max:

; write to ppvBits right here
		      vmovd  dword[rbx],xmm7
			add  rbx,4

			add  rdx,8
			sub  r8d,1
			jnz  .colorloop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			add  esi,16
			cmp  esi,[Bitmap.x]
			 jb  .l2


			add  rbx,r15

			add  edi,dword[CoreCount]
			cmp  edi,[Bitmap.y]
			 jb  .l1

			mov  rax,[.ITERs]
		   lock add  [ITERs],rax

		     invoke  ExitThread,0
