;Intel® 64 and IA-32 Architectures Software Developer’s Manual. Vol 1 (2015-01)
;5.1 GENERAL-PURPOSE INSTRUCTIONS
;5.1.1         Data Transfer Instructions
mov|cmove|cmovz|cmovne|cmovnz|cmova|cmovnbe|cmovae|cmovnb|cmovb|cmovnae
cmovbe|cmovna|cmovg|cmovnle|cmovge|cmovnl|cmovl|cmovnge|cmovle|cmovng
cmovc|cmovnc|cmovo|cmovno|cmovs|cmovns|cmovp|cmovpe|cmovnp|cmovpo
xchg|bswap|xadd|cmpxchg|cmpxchg8b
push|pop|pusha|pushad|popa|popad
cwd|cdq|cbw|cwde
movsx|movzx
;5.1.2         Binary Arithmetic Instructions
adcx|adox|add|adc|sub|sbb|imul|mul|idiv|div|inc|dec|neg|cmp|
;5.1.3         Decimal Arithmetic Instructions
daa|das|aaa|aas|aam|aad
;5.1.4 Logical Instructions
and|or|xor|not
;5.1.5         Shift and Rotate Instructions
sar|shr|sal|shl|shrd|shld|ror|rol|rcr|rcl
;5.1.6         Bit and Byte Instructions
bt|bts|btr|btc|bsf|bsr
sete|setz|setne|setnz|seta|setnbe|setae|setnb|setnc|setb|setnae|setc
setbe|setna|setg|setnle|setge|setnl|setl|setnge|setle|setng
sets|setns|seto|setno|setpe|setp|setpo|setnp
test|crc32|popcnt
;5.1.7         Control Transfer Instructions
jmp|je|jz|jne|jnz|ja|jnbe|jae|jnb|jb|jnae|jbe|jna|jg|jnle|jge|jnl|jl|jnge|jle|jng
jc|jnc|jo|jno|js|jns|jpo|jnp|jpe|jp|jcxz|jecxz
loop|loopz|loope|loopnz|loopne
call|ret|iret|int|into|bound|enter|leave
;5.1.8 String Instructions
movs|movsb|movs|movsw|movs|movsd
cmps|cmpsb|cmps|cmpsw|cmps|cmpsd
scas|scasb|scas|scasw|scas|scasd
lods|lodsb|lods|lodsw|lods|lodsd
stos|stosb|stos|stosw|stos|stosd
rep|repe|repz|repne|repnz
;5.1.9 I/O Instructions
in|out|ins|insb|ins|insw|ins|insd|outs|outsb|outs|outsw|outs|outsd
;5.1.10      Enter and Leave Instructions
enter|leave
;5.1.11      Flag Control (EFLAG) Instructions
stc|clc|cmc|cld|std|lahf|sahf|pushf|pushfd|popf|popfd|sti|cli
;5.1.12      Segment Register Instructions
lds|les|lfs|lgs|lss
;5.1.13 Miscellaneous Instructions
lea|nop|ud2|xlat|xlatb|cpuid|movbe|prefetchw|prefetchwt1
;5.1.14      Random Number Generator Instructions
rdrand|rdseed
;5.1.15 BMI1, BMI2
andn|bextr|blsi|blsmsk|blsr|bzhi|lzcnt|mulx|pdep|pext|rorx|sarx|shlx|shrx|tzcnt

;5.2         X87 FPU INSTRUCTIONS
;5.2.1         x87 FPU Data Transfer Instructions
fld|fst|fstp|fild|fist|fistp|fbld|fbstp|fxch
fcmove|fcmovne|fcmovb|fcmovbe|fcmovnb|fcmovnbe|fcmovu|fcmovnu
;5.2.2         x87 FPU Basic Arithmetic Instructions
fadd|faddp|fiadd|fsub|fsubp|fisub|fsubr|fsubrp|fisubr
fmul|fmulp|fimul|fdiv|fdivp|fidiv|fdivr|fdivrp|fidivr
fprem|fprem1|fabs|fchs|frndint|fscale|fsqrt|fxtract
;5.2.3         x87 FPU Comparison Instructions
fcom|fcomp|fcompp|fucom|fucomp|fucompp|ficom|ficomp|fcomi|fucomi|fcomip|fucomip|ftst|fxam
;5.2.4         x87 FPU Transcendental Instructions
fsin|fcos|fsincos|fptan|fpatan|f2xm1|fyl2x|fyl2xp1
;5.2.5         x87 FPU Load Constants Instructions
fld1|fldz|fldpi|fldl2e|fldln2|fldl2t|fldlg2
;5.2.6         x87 FPU Control Instructions
fincstp|fdecstp|ffree|finit|fninit|fclex|fnclex|fstcw|fnstcw
fldcw|fstenv|fnstenv|fldenv|fsave|fnsave|frstor|fstsw|fnstsw
wait|fwait|fnop

;5.3         X87 FPU AND SIMD STATE MANAGEMENT INSTRUCTIONS
fxsave|fxrstor

;5.4 MMX™ INSTRUCTIONS
;5.4.1         MMX Data Transfer Instructions
movd|movq
;5.4.2 MMX Conversion Instructions
packsswb|packssdw|packuswb|punpckhbw|punpckhwd|punpckhdq|punpcklbw|punpcklwd|punpckldq
;5.4.3         MMX Packed Arithmetic Instructions
paddb|paddw|paddd|paddsb|paddsw|paddusb|paddusw
psubb|psubw|psubd|psubsb|psubsw|psubusb|psubusw
pmulhw|pmullw|pmaddwd
;5.4.4         MMX Comparison Instructions
pcmpeqb|pcmpeqw|pcmpeqd|pcmpgtb|pcmpgtw|pcmpgtd
;5.4.5         MMX Logical Instructions
pand|pandn|por|pxor
;5.4.6         MMX Shift and Rotate Instructions
psllw|pslld|psllq|psrlw|psrld|psrlq|psraw|psrad
;5.4.7         MMX State Management Instructions
emms

;5.5 SSE INSTRUCTIONS
;5.5.1         SSE SIMD Single-Precision Floating-Point Instructions
;5.5.1.1        SSE Data Transfer Instructions
movaps|movups|movhps|movhlps|movlps|movlhps|movmskps|movss
;5.5.1.2        SSE Packed Arithmetic Instructions
addps|addss|subps|subss|mulss|mulps|divps|divss
rcpps|rcpss|sqrtps|sqrtss|rsqrtps|rsqrtss
maxps|maxss|minps|minss
;5.5.1.3        SSE Comparison Instructions
cmpps|cmpss|comiss|ucomiss
;5.5.1.4        SSE Logical Instructions
andps|andnps|orps|xorps
;5.5.1.5        SSE Shuffle and Unpack Instructions
shufps|unpckhps|unpcklps
;5.5.1.6        SSE Conversion Instructions
cvtpi2ps|cvtsi2ss|cvtps2pi|cvttps2pi|cvtss2si|cvttss2si
;5.5.2         SSE MXCSR State Management Instructions
ldmxcsr|stmxcsr
;5.5.3         SSE 64-Bit SIMD Integer Instructions
pavgb|pavgw|pextrw|pinsrw|pmaxub|pmaxsw|pminub|pminsw|pmovmskb|pmulhuw|psadbw|pshufw
;5.5.4         SSE Cacheability Control, Prefetch, and Instruction Ordering Instructions
maskmovq|movntps|sfence
prefetchnta|prefetcht0|prefetcht1|prefetcht2|prefetchw|prefetchwt1

;5.6 SSE2 INSTRUCTIONS
;5.6.1         SSE2 Packed and Scalar Double-Precision Floating-Point Instructions
;5.6.1.1        SSE2 Data Movement Instructions
movapd|movupd|movhpd|movlpd|movmskpd|movsd
;5.6.1.2        SSE2 Packed Arithmetic Instructions
addpd|addsd|subpd|subsd|mulpd|mulsd|divpd|divsd|sqrtpd|sqrtsd|maxpd|maxsd|minpd|minsd
;5.6.1.3        SSE2 Logical Instructions
andpd|andnpd|orpd|xorpd
;5.6.1.4        SSE2 Compare Instructions
cmppd|cmpsd|comisd|ucomisd
;5.6.1.5        SSE2 Shuffle and Unpack Instructions
shufpd|unpckhpd|unpcklpd
;5.6.1.6        SSE2 Conversion Instructions
cvtpd2pi|cvttpd2pi|cvtpi2pd|cvtpd2dq|cvttpd2dq|cvtdq2pd|cvtps2pd|cvtpd2ps|cvtss2sd|cvtsd2ss|cvtsd2si|cvttsd2si|cvtsi2sd
;5.6.2         SSE2 Packed Single-Precision Floating-Point Instructions
cvtdq2ps|cvtps2dq|cvttps2dq
;5.6.3         SSE2 128-Bit SIMD Integer Instructions
movdqa|movdqu|movq2dq|movdq2q|pmuludq|paddq|psubq|pshuflw|pshufhw|pshufd|pslldq|psrldq|punpckhqdq|punpcklqdq
;5.6.4         SSE2 Cacheability Control and Ordering Instructions
clflush|lfence|mfence|pause|maskmovdqu|movntpd|movntdq|movnti

;5.7 SSE3 INSTRUCTIONS
;5.7.1         SSE3 x87-FP Integer Conversion Instruction
fisttp
;5.7.2         SSE3 Specialized 128-bit Unaligned Data Load Instruction
lddqu
;5.7.3         SSE3 SIMD Floating-Point Packed ADD/SUB Instructions
addsubps|addsubpd
;5.7.4         SSE3 SIMD Floating-Point Horizontal ADD/SUB Instructions
haddps|hsubps|haddpd|hsubpd
;5.7.5         SSE3 SIMD Floating-Point LOAD/MOVE/DUPLICATE Instructions
movshdup|movsldup|movddup
;5.7.6         SSE3 Agent Synchronization Instructions
monitor|mwait

;5.8 SUPPLEMENTAL STREAMING SIMD EXTENSIONS 3 (SSSE3) INSTRUCTIONS
;5.8.1 Horizontal Addition/Subtraction
phaddw|phaddsw|phaddd|phsubw|phsubsw|phsubd
;5.8.2         Packed Absolute Values
pabsb|pabsw|pabsd
;5.8.3         Multiply and Add Packed Signed and Unsigned Bytes
pmaddubsw
;5.8.4         Packed Multiply High with Round and Scale
pmulhrsw
;5.8.5         Packed Shuffle Bytes
pshufb
;5.8.6 Packed Sign
psignb|psignw|psignd
;5.8.7         Packed Align Right
palignr

;5.9 SSE4 INSTRUCTIONS

;5.10 SSE4.1 INSTRUCTIONS
;5.10.1      Dword Multiply Instructions
pmulld|pmuldq
;5.10.2      Floating-Point Dot Product Instructions
dppd|dpps
;5.10.3      Streaming Load Hint Instruction
movntdqa
;5.10.4      Packed Blending Instructions
blendpd|blendps|blendvpd|blendvps|pblendvb|pblendw
;5.10.5      Packed Integer MIN/MAX Instructions
pminuw|pminud|pminsb|pminsd|pmaxuw|pmaxud|pmaxsb|pmaxsd
;5.10.6      Floating-Point Round Instructions with Selectable Rounding Mode
roundps|roundpd|roundss|roundsd
;5.10.7      Insertion and Extractions from XMM Registers
extractps|insertps|pinsrb|pinsrd|pinsrq|pextrb|pextrw|pextrd|pextrq
;5.10.8      Packed Integer Format Conversions
pmovsxbw|pmovzxbw|pmovsxbd|pmovzxbd|pmovsxwd|pmovzxwd|pmovsxbq|pmovzxbq|pmovsxwq|pmovzxwq|pmovsxdq|pmovzxdq
;5.10.9      Improved Sums of Absolute Differences (SAD) for 4-Byte Blocks
mpsadbw
;5.10.10 Horizontal Search
phminposuw
;5.10.11 Packed Test
ptest
;5.10.12    Packed Qword Equality Comparisons
pcmpeqq
;5.10.13    Dword Packing With Unsigned Saturation
packusdw

;5.11       SSE4.2 INSTRUCTION SET
;5.11.1      String and Text Processing Instructions
pcmpestri|pcmpestrm|pcmpistri|pcmpistrm
;5.11.2 Packed Comparison SIMD integer Instruction
pcmpgtq

;5.12       AESNI AND PCLMULQDQ
aesdec|aesdeclast|aesenc|aesenclast|aesimc|aeskeygenassist|pclmulqdq

;5.13       INTEL® ADVANCED VECTOR EXTENSIONS (INTEL® AVX)
;Table 14-2.  Promoted 256-Bit and 128-bit Arithmetic AVX Instructions
sqrtps, sqrtpd, rsqrtps, rcpps
addps, addpd, subps, subpd
mulps, mulpd, divps, divpd
cvtps2pd, cvtpd2ps
cvtdq2ps, cvtps2dq
cvttps2dq, cvttpd2dq
cvtpd2dq, cvtdq2pd
minps, minpd, maxps, maxpd
haddpd, haddps, hsubpd, hsubps
cmpps, cmppd
addsubpd, addsubps, dpps
roundpd, roundps
;Table 14-3.  Promoted 256-bit and 128-bit Data Movement AVX Instructions
movaps, movapd, movdqa
movups, movupd, movdqu
movmskps, movmskpd
lddqu, movntps, movntpd, movntdq, movntdqa
movshdup, movsldup, movddup
;Table 14-3.  Promoted 256-bit and 128-bit Data Movement AVX Instructions
unpckhpd, unpckhps, unpcklpd
blendps, blendpd
shufpd, shufps, unpcklps
blendvps, blendvpd
ptest, movmskpd, movmskps
xorps, xorpd, orps, orpd
andnpd, andnps, andpd, andps
;Table 14-4.  256-bit AVX Instruction Enhancement
vbroadcastf128|vbroadcastsd|vbroadcastss|vextractf128|vinsertf128|vmaskmovps|vmaskmovpd|vmaskmovps|vmaskmovpd
vpermilpd|vpermilpd|vpermilps|vpermilps|vperm2f128|vtestps|vtestpd|vzeroall|vzeroupper
;Table 14-5.  Promotion of Legacy SIMD ISA to 128-bit Arithmetic AVX instruction
cvtpi2ps, cvtpi2pd, cvtpd2pi
cvttps2pi, cvttpd2pi, cvtps2pi
cvtsi2ss, cvtsi2sd, cvtsd2si
cvttss2si, cvttsd2si, cvtss2si
comisd, rsqrtss, rcpss
ucomiss, ucomisd, comiss
addss, addsd, subss, subsd
mulss, mulsd, divss, divsd
sqrtss, sqrtsd
cvtss2sd, cvtsd2ss
minss, minsd, maxss, maxsd
pand, pandn, por, pxor
pcmpgtb, pcmpgtw, pcmpgtd
pmaddwd, pmaddubsw
pavgb, pavgw, pmuludq
pcmpeqb, pcmpeqw, pcmpeqd
pmullw, pmulhuw, pmulhw
psubsw, paddsw, psadbw
paddusb, paddusw, paddsb
psubusb, psubusw, psubsb
pminub, pminsw
pmaxub, pmaxsw
paddb, paddw, paddd, paddq
psubb, psubw, psubd, psubq
psllw, pslld, psllq, psraw
psrlw, psrld, psrlq, psrad
phsubw, phsubd, phsubsw
phaddw, phaddd, phaddsw
pmulhrsw
psignb, psignw, psignd
pabsb, pabsw, pabsd
dppd
phminposuw, mpsadbw
pmaxsb, pmaxsd, pmaxud
pminsb, pminsd, pminud
pmaxuw, pminuw
pmovsxbw, pmovzxbw, pmovsxbd, pmovzxbd, pmovsxwd, pmovzxwd, pmovsxbq, pmovzxbq, pmovsxwq, pmovzxwq, pmovsxdq, pmovzxdq
pmuldq, pmulld
roundsd, roundss
popcnt
pcmpgtq
crc32
pcmpestri, pcmpestrm
pcmpistri, pcmpistrm
pclmulqdq
aesdec, aesdeclast
aesenc, aesenclast
aesimc, aeskeygenassist
;Table 14-6.  128-bit AVX Instruction Enhancement
vbroadcastss|vmaskmovps|vmaskmovpd|vmaskmovps|vmaskmovpd|vpermilpd|vpermilpd|vpermilps|vpermilps|vtestps|vtestpd
;Table 14-7.  Promotion of Legacy SIMD ISA to 128-bit Non-Arithmetic AVX instruction
movq2dq, movdq2q
ldmxcsr, stmxcsr
movss, movsd, cmpss, cmpsd
movhps, movhpd
movhps, movhpd
movlhps, movhlps
movq, movd
packuswb, packssdw, packsswb
punpckhbw, punpckhwd
punpcklbw, punpcklwd
punpckhdq, punpckldq
punpcklqdq, punpckhqdq
pshufhw, pshuflw, pshufd
pmovmskb, maskmovdqu
pand, pandn, por, pxor
pinsrw, pextrw
palignr, pshufb
extractps, insertps
packusdw, pcmpeqq
pblendvb, pblendw
pextrw, pextrb, pextrd, pextrq
pinsrb, pinsrd, pinsrq

;5.14 16-BIT FLOATING-POINT CONVERSION
vcvtph2ps|vcvtps2ph

;5.15 FUSED-MULTIPLY-ADD (FMA)
;Table 14-15.  FMA Instructions
vfmadd132pd|vfmadd213pd|vfmadd231pd
vfmadd132ps|vfmadd213ps|vfmadd231ps
vfmadd132sd|vfmadd213sd|vfmadd231sd
vfmadd132ss|vfmadd213ss|vfmadd231ss
vfmaddsub132pd|vfmaddsub213pd|vfmaddsub231pd
vfmaddsub132ps|vfmaddsub213ps|vfmaddsub231ps
vfmsubadd132pd|vfmsubadd213pd|vfmsubadd231pd
vfmsubadd132ps|vfmsubadd213ps|vfmsubadd231ps
vfmsub132pd|vfmsub213pd|vfmsub231pd
vfmsub132ps|vfmsub213ps|vfmsub231ps
vfmsub132sd|vfmsub213sd|vfmsub231sd
vfmsub132ss|vfmsub213ss|vfmsub231ss
vfnmadd132pd|vfnmadd213pd|vfnmadd231pd
vfnmadd132ps|vfnmadd213ps|vfnmadd231ps
vfnmadd132sd|vfnmadd213sd|vfnmadd231sd
vfnmadd132ss|vfnmadd213ss|vfnmadd231ss
vfnmsub132pd|vfnmsub213pd|vfnmsub231pd
vfnmsub132ps|vfnmsub213ps|vfnmsub231ps
vfnmsub132sd|vfnmsub213sd|vfnmsub231sd
vfnmsub132ss|vfnmsub213ss|vfnmsub231ss

;5.16       INTEL® ADVANCED VECTOR EXTENSIONS 2 (INTEL® AVX2)
;Table 14-18.  Promoted Vector Integer SIMD Instructions in AVX2
punpcklbw|punpcklwd|punpckldq|packsswb|pcmpgtb|pcmpgtw|pcmpgtd|packuswb
punpckhbw|punpckhwd|punpckhdq|packssdw|punpcklqdq|punpckhqdq|movd|movq|movdqa|movdqu
pshufd|pshufhw|pshuflw|pcmpeqb|pcmpeqw|pcmpeqd|movdqa|movdqu|pinsrw|pextrw
psrlw|psrld|psrlq|paddq|pmullw|pmovmskb|psubusb|psubusw|pminub|pand|paddusb|paddusw
pmaxub|pandn|pavgb|psraw|psrad|pavgw|pmulhuw|pmulhw|movntdq|psubsb|psubsw|pminsw
por|paddsb|paddsw|pmaxsw|pxor|lddqu|psllw|pslld|psllq|pmuludq|pmaddwd
psadbw|psubb|psubw|psubd|psubq|paddb|paddw|paddd|phaddw|phaddsw|phaddd
phsubw|phsubsw|phsubd|pmaddubsw|palignr|pshufb|pmulhrsw|psignb|psignw|psignd
pabsb|pabsw|pabsd|movntdqa|mpsadbw|packusdw|pblendvb|pblendw|pcmpeqq
pextrd|pextrq|pextrb|pextrw|phminposuw|pinsrb|pinsrd|pinsrq
pmaxsb|pmaxsd|pmaxud|pmaxuw|pminsb|pminsd|pminud|pminuw
pmovsxbw|pmovzxbw|pmovsxbd|pmovzxbd|pmovsxwd|pmovzxwd|pmovsxbq|pmovzxbq|pmovsxwq|pmovzxwq|pmovsxdq|pmovzxdq
pmuldq|pmulld|ptest|pcmpgtq|pcmpestri|pcmpestrm|pcmpistri|pcmpistrm
aesdec|aesdeclast|aesenc|aesenclast|aesimc|aeskeygenassist|pclmulqdq
;Table 14-19.   VEX-Only SIMD Instructions in AVX and AVX2
vbroadcasti128|vbroadcastf128
vbroadcastsd|vbroadcastsd
vbroadcastss|vbroadcastss
vextracti128|vextractf128
vinserti128|vinsertf128
vpmaskmovd|vmaskmovps
vpmaskmovq|vmaskmovpd
vpermilpd|vpermilps
vperm2i128|vperm2f128
vpermd|vpermps|vpermq|vpermpd
vtestpd|vtestps
vpblendd|vpsllvd|vpsllvq|vpsravd|vpsrlvd|vpsrlvq
vgatherdpd|vgatherdqpd|vgatherdps|vgatherdqps|vpgatherdd|vpgatherqd|vpgatherdq|vpgatherqq
;Table 14-20.  New Primitive in AVX2 Instructions
vpermd|vpermpd|vpermps|vpermq
vpsllvd|vpsllvq|vpsllvd|vpsllvq
vpsravd|vpsrlvd|vpsrlvq|vpsrlvd|vpsrlvq
vgatherdd|vgatherqd|vgatherdd|vgatherqd|vgatherdpd|vgatherqpd|vgatherdpd|vgatherqpd
vgatherdps|vgatherqps|vgatherdps|vgatherqps|vgatherdq|vgatherqq|vgatherdq|vgatherqq

;5.17       INTEL® TRANSACTIONAL SYNCHRONIZATION EXTENSIONS (TSX)
xabort|xacquire|xrelease|xbegin|xend|xtest

;5.18 SYSTEM INSTRUCTIONS
clac|stac|lgdt|sgdt|lldt|sldt|ltr|str|lidt|sidt|mov|lmsw|smsw
clts|arpl|lar|lsl|verr|verw|mov|invd|wbinvd|invlpg|invpcid
lock
hlt|rsm|rdmsr|wrmsr|rdpmc|rdtsc|rdtscp|sysenter|sysexit
xsave|xsaveopt|xrstor|xgetbv|xsetbv|rdfsbase|rdgsbase|wrfsbase|wrgsbase

;5.19 64-BIT MODE INSTRUCTIONS
cdqe|cmpsq|cmpxchg16b|lodsq|movsq|movzx|stosq|swapgs|syscall|sysret

;5.20 VIRTUAL-MACHINE EXTENSIONS
vmptrld|vmptrst|vmclear|vmread|vmwrite|vmlaunch|vmresume|vmxoff|vmxon|invept|invvpid|vmcall|vmfunc

;5.21 SAFER MODE EXTENSIONS
getsec
[capabilities|enteraccs|exitac|senter|sexit|parameters|smctrl|wakeup]

;====================================================================
;Intel® 64 and IA-32 Architectures Software Developer’s Manual. Vol 2 (2015-01)
aaa|aad|aam|aas|adc|adcx|add|addpd|addps|addsd|addss|addsubpd|addsubps|adox
aesdec|aesdeclast|aesenc|aesenclast|aesimc|aeskeygenassist
and|andn|andpd|andps|andnpd|andnps|arpl

blendpd|bextr|blendps|blendvpd|blendvps|blsi|blsmsk|blsr|bound|bsf|bsr|bswap|bt|btc|btr|bts|bzhi

call|cbw|cwde|cdqe|clac|clc|cld|clflush|cli|clts|cmc
cmova|cmovae|cmovb|cmovbe|cmovc|cmove|cmovg|cmovge|cmovl|cmovle
cmovna|cmovnae|cmovnb|cmovnbe|cmovnc|cmovne|cmovng|cmovnge|cmovnl|cmovnle
cmovno|cmovnp|cmovns|cmovnz|cmovo|cmovp|cmovpe|cmovpo|cmovs|cmovz
cmp|cmppd|cmpps|cmps|cmpsb|cmpsw|cmpsd|cmpsq|cmpsd|cmpss|cmpxchg|cmpxchg8b|cmpxchg16b|comisd|comiss|cpuid|crc32
cvtdq2pd|cvtdq2ps|cvtpd2dq|cvtpd2pi|cvtpd2ps|cvtpi2pd|cvtpi2ps|cvtps2dq|cvtps2pd|cvtps2pi|cvtsd2si|cvtsd2ss
cvtsi2sd|cvtsi2ss|cvtss2sd|cvtss2si|cvttpd2dq|cvttpd2pi|cvttps2dq|cvttps2pi|cvttsd2si|cvttss2si|cwd|cdq|cqo

daa|das|dec|div|divpd|divps|divsd|divss|dppd|dpps

emms|enter|extractps

f2xm1|fabs|fadd|faddp|fiadd|fbld|fbstp|fchs|fclex|fnclex
fcmovb|fcmove|fcmovbe|fcmovu|fcmovnb|fcmovne|fcmovnbe|fcmovnu
fcom|fcomp|fcompp|fcomi|fcomip|fucomi|fucomip|fcos|fdecstp|fdiv|fdivp|fidiv|fdivr|fdivrp|fidivr|ffree
ficom|ficomp|fild|fincstp|finit|fninit|fist|fistp|fisttp|fld|fld1|fldl2t|fldl2e|fldpi|fldlg2|fldln2|fldz|fldcw|fldenv
fmul|fmulp|fimul|fnop|fpatan|fprem|fprem1|fptan|frndint|frstor|fsave|fnsave|fscale|fsin|fsincos|fsqrt|fst|fstp
fstcw|fnstcw|fstenv|fnstenv|fstsw|fnstsw|fsub|fsubp|fisub|fsubr|fsubrp|fisubr|ftst|fucom|fucomp|fucompp|fxam|fxch
fxrstor|fxrstor64|fxsave|fxsave64|fxtract|fyl2x|fyl2xp1

haddpd|haddps|hlt|hsubpd|hsubps

idiv|imul|in|inc|ins|insb|insw|insd|insertps|int n|into|int 3|invd|invlpg|invpcid|iret|iretd|iretq

ja|jae|jb|jbe|jc|jcxz|jecxz|jrcxz|je|jg|jge|jl|jle|jna|jnae|jnb|jnbe|jnc|jne|jng|jnge|jnl|jnle|jno|jnp|jns|jnz|jo|jp|jpe|jpo|js|jz
jmp

lahf|lar|lddqu|ldmxcsr|lds|les|lfs|lgs|lss|lea|leave|lfence|lgdt|lidt|lldt|lmsw|lock|lods|lodsb|lodsw|lodsd|lodsq
loop|loope|loopne
lsl|ltr|lzcnt

maskmovdqu|maskmovq|maxpd|maxps|maxsd|maxss|mfence|minpd|minps|minsd|minss|monitor
mov|movapd|movaps|movbe|movd|movq|movddup|movdqa|movdqu|movdq2q|movhlps|movhpd|movhps|movlhps|movlpd|movlps
movmskpd|movmskps|movntdqa|movntdq|movnti|movntpd|movntps|movntq|movq2dq|movs|movsb|movsw|movsd|movsq
movshdup|movsldup|movss|movsx|movsxd|movupd|movups|movzx|mpsadbw|mul|mulpd|mulps|mulsd|mulss|mulx|mwait

neg|nop|not

or|orpd|orps|out|outs|outsb|outsw|outsd

pabsb|pabsw|pabsd|packsswb|packssdw|packusdw|packuswb|paddb|paddw|paddd|paddq|paddsb|paddsw|paddusb|paddusw
palignr|pand|pandn|pause|pavgb|pavgw|pblendvb|pblendw|pclmulqdq
pcmpeqb|pcmpeqw|pcmpeqd|pcmpeqq|pcmpestri|pcmpestrm|pcmpgtb|pcmpgtw|pcmpgtd|pcmpgtq|pcmpistri|pcmpistrm
pdep|pext|pextrb|pextrd|pextrq|pextrw|phaddw|phaddd|phaddsw|phminposuw|phsubw|phsubd|phsubsw|pinsrb|pinsrd|pinsrq|pinsrw
pmaddubsw|pmaddwd|pmaxsb|pmaxsd|pmaxsw|pmaxub|pmaxud|pmaxuw|pminsb|pminsd|pminsw|pminub|pminud|pminuw|pmovmskb
pmovsxbw|pmovsxbd|pmovsxbq|pmovsxwd|pmovsxwq|pmovsxdq
pmovzxbw|pmovzxbd|pmovzxbq|pmovzxwd|pmovzxwq|pmovzxdq
pmuldq|pmulhrsw|pmulhuw|pmulhw|pmulld|pmullw|pmuludq|pop|popa|popad|popcnt|popf|popfd|popfq|por
prefetcht0|prefetcht1|prefetcht2|prefetchnta|prefetchw|prefetchwt1
psadbw|pshufb|pshufd|pshufhw|pshuflw|pshufw|psignb|psignw|psignd
pslldq|psllw|pslld|psllq|psraw|psrad|psrldq|psrlw|psrld|psrlq
psubb|psubw|psubd|psubq|psubsb|psubsw|psubusb|psubusw|ptest
punpckhbw|punpckhwd|punpckhdq|punpckhqdq|punpcklbw|punpcklwd|punpckldq|punpcklqdq
push|pusha|pushad|pushf|pushfd|pushfq|pxor

rcl|rcr|rol|ror|rcpps|rcpss|rdfsbase|rdgsbase|rdmsr|rdpkru|rdpmc|rdrand|rdseed|rdtsc|rdtscp
rep|repe|repz|repne|repnz|ret|rorx|roundpd|roundps|roundsd|roundss|rsm|rsqrtps|rsqrtss

sahf|sal|sar|shl|shr|sarx|shlx|shrx|sbb|scas|scasb|scasw|scasd|scasq
seta|setae|setb|setbe|setc|sete|setg|setge|setl|setle|seto|setp|setpe|setpo|sets|setz
setna|setnae|setnb|setnbe|setnc|setne|setng|setnge|setnl|setnle|setno|setnp|setns|setnz
sfence|sgdt|shld|shrd|shufpd|shufps|sidt|sldt|smsw|sqrtpd|sqrtps|sqrtsd|sqrtss
stac|stc|std|sti|stmxcsr|stos|stosb|stosw|stosd|stosq|str|sub|subpd|subps|subsd|subss|swapgs|syscall|sysenter|sysexit|sysret

test|tzcnt

ucomisd|ucomiss|ud2|unpckhpd|unpckhps|unpcklpd|unpcklps

vbroadcastss|vbroadcastsd|vbroadcastf128
vcvtph2ps|vcvtps2ph|verr|verw
vextractf128|vextracti128|vfmadd132pd|vfmadd213pd|vfmadd231pd|vfmadd132ps|vfmadd213ps|vfmadd231ps|vfmadd132sd|vfmadd213sd|vfmadd231sd|vfmadd132ss|vfmadd213ss|vfmadd231ss
vfmaddsub132pd|vfmaddsub213pd|vfmaddsub231pd|vfmaddsub132ps|vfmaddsub213ps|vfmaddsub231ps
vfmsubadd132pd|vfmsubadd213pd|vfmsubadd231pd|vfmsubadd132ps|vfmsubadd213ps|vfmsubadd231ps
vfmsub132pd|vfmsub213pd|vfmsub231pd|vfmsub132ps|vfmsub213ps|vfmsub231ps|vfmsub132sd|vfmsub213sd|vfmsub231sd|vfmsub132ss|vfmsub213ss|vfmsub231ss
vfnmadd132pd|vfnmadd213pd|vfnmadd231pd|vfnmadd132ps|vfnmadd213ps|vfnmadd231ps|vfnmadd132sd|vfnmadd213sd|vfnmadd231sd|vfnmadd132ss|vfnmadd213ss|vfnmadd231ss
vfnmsub132pd|vfnmsub213pd|vfnmsub231pd|vfnmsub132ps|vfnmsub213ps|vfnmsub231ps|vfnmsub132sd|vfnmsub213sd|vfnmsub231sd|vfnmsub132ss|vfnmsub213ss|vfnmsub231ss
vgatherdpd|vgatherqpd|vgatherdps|vgatherqps|vpgatherdd|vpgatherqd|vpgatherdq|vpgatherqq
vinsertf128|vinserti128|vmaskmovps|vmaskmovpd|vpblendd
vpbroadcastb|vpbroadcastw|vpbroadcastd|vpbroadcastq|vbroadcasti128
vpermd|vpermpd|vpermps|vpermq|vperm2i128|vpermilpd|vpermilps|vperm2f128|vpmaskmovd|vpmaskmovq
vpsllvd|vpsllvq|vpsravd|vpsrlvd|vpsrlvq|vtestpd|vtestps|vzeroall|vzeroupper

wait|fwait|wbinvd|wrfsbase|wrgsbase|wrmsr|wrpkru

xacquire|xrelease|xabort|xadd|xbegin|xchg|xend|xgetbv|xlat|xlatb|xor|xorpd|xorps
xrstor|xrstor64|xrstors|xrstors64|xsave|xsave64|xsavec|xsavec64|xsaveopt|xsaveopt64|xsaves|xsaves64|xsetbv|xtest

getsec[capabilities]|getsec[enteraccs]|getsec[exitac]|getsec[senter]|getsec[sexit]|getsec[parameters]|getsec[smctrl]|getsec[wakeup]|

;====================================================================
;Intel® Architecture Instruction Set Extensions Programming Reference (2014-10)
;6 OPMASK
;6.1 MASK INSTRUCTIONS
kaddw|kaddb|kaddq|kaddd
kandw|kandb|kandq|kandd
kandnw|kandnb|kandnq|kandnd
kmovw|kmovb|kmovq|kmovd
kunpckbw|kunpckwd|kunpckdq
knotw|knotb|knotq|knotd
korw|korb|korq|kord
kortestw|kortestb|kortestq|kortestd
kshiftlw|kshiftlb|kshiftlq|kshiftld
kshiftrw|kshiftrb|kshiftrq|kshiftrd
kxnorw|kxnorb|kxnorq|kxnord
ktestw|ktestb|ktestq|ktestd
kxorw|kxorb|kxorq|kxord

;7 ADDITIONAL 512-BIT INSTRUCTION EXTENSIONS
;7.2 INSTRUCTION SET REFERENCE
vexp2pd|vexp2ps
vrcp28pd|vrcp28sd|vrcp28ps|vrcp28ss
vrsqrt28pd|vrsqrt28sd|vrsqrt28ps|vrsqrt28ss
vgatherpf0dps|vgatherpf0qps|vgatherpf0dpd|vgatherpf0qpd
vgatherpf1dps|vgatherpf1qps|vgatherpf1dpd|vgatherpf1qpd
vscatterpf0dps|vscatterpf0qps|vscatterpf0dpd|vscatterpf0qpd
vscatterpf1dps|vscatterpf1qps|vscatterpf1dpd|vscatterpf1qpd

;8 INTEL® SHA EXTENSIONS
;8.3         SHA EXTENSIONS REFERENCE
sha1rnds4|sha1nexte|sha1msg1|sha1msg2
sha256rnds2|sha256msg1|sha256msg2

;9 INTEL® MEMORY PROTECTION EXTENSIONS
;9.4         INTEL MPX INSTRUCTION REFERENCE
bndmk|bndcl|bndcu|bndcn|bndmov|bndldx|bndstx

;10 ADDITIONAL NEW INSTRUCTIONS
prefetchwt1

;11 MEMORY INSTRUCTIONS
;11.4 INSTRUCTION SET REFERENCE
clflushopt|clwb|pcommit

;====================================================================
;AMD64 Architecture Programmer’s Manual Volume 2: System Programming (2011-12)
;6         System-Management Instructions
arpl|clgi|cli|clts|hlt|int3|invd|invlpg|invlpga
iret|iret|iretw|iretd|iretq
lar|lgdt|lidt|lldt|lmsw|lsl|ltr|monitor|mwait|rdfsbase|rdgsbase|rdmsr|rdpmc|rdtsc|rdtscp|rsm|sgdt|sidt|skinit|sldt
smsw|sti|stgi|str|swapgs|syscall|sysenter|sysexit|sysret|ud2|verr|verw|vmload|vmmcall|vmrun|vmsave|wbinvd|wrfsbase|wrgsbase|wrmsr
;7         Memory System
;7.5.2  Write Combining
movntsd|movntss
;7.6.3  Cache and Memory Management Instructions
prefetch|prefetchw

;====================================================================
;AMD64 Architecture Programmer’s Manual Volume 3: General-Purpose and System Instructions (2015-06)
;3 General-Purpose Instruction Reference
aaa|aad|aam|aas|adc|add|and|andn
bextr|blcfill|blci|blcic|blcmsk|blcs|blsfill|blsi|blsic|blsmsk|blsr|bound|bsf|bsr|bswap|bt|btc|btr|bts|bzhi
call|cbw|cwde|cdqe|cwd|cdq|cqo|clc|cld|clflush|cmc
cmovo|cmovno|cmovb|cmovc|cmovnae|cmovnb|cmovnc|cmovae|cmovz|cmove|cmovnz|cmovne|cmovbe|cmovna|cmovnbe
cmova|cmovs|cmovns|cmovp|cmovpe|cmovnp|cmovpo|cmovl|cmovnge|cmovnl|cmovge|cmovle|cmovng|cmovnle|cmovg
cmp|cmps|cmpsb|cmpsw|cmpsd|cmpsq|cmpxchg|cmpxchg8b|cmpxchg16b|cpuid|crc32
daa|das|dec|div
enter
idiv|imul|in|inc|ins|insb|insw|insd|int|into
jo|jno|jb|jc|jnae|jnb|jnc|jae|jz|je|jnz|jne|jbe|jna|jnbe|ja|js|jns|jp|jpe|jnp|jpo|jl|jnge|jnl|jge|jle|jng|jnle|jg|jcxz|jecxz|jrcxz|jmp
lahf|lds|les|lfs|lgs|lss|lea|leave|lfence|llwpcb|lods|lodsb|lodsw|lodsd|lodsq|loop|loope|loopne|loopnz|loopz|lwpins|lwpval|lzcnt
mfence|mov|movbe|movd|movmskpd|movmskps|movnti|movs|movsb|movsw|movsd|movsq|movsx|movsxd|movzx|mul|mulx
neg|nop|not
or|out|outs|outsb|outsw|outsd
pause|pdep|pext|pop|popa|popad|popcnt|popf|popfd|popfq|prefetch|prefetchw|prefetchnta|prefetcht0|prefetcht1|prefetcht2|push|pusha|pushad|pushf|pushfd|pushfq
rcl|rcr|rdfsbase|rdgsbase|rdrand|ret|rol|ror|rorx
sahf|sal|shl|sar|sarx|sbb|scas|scasb|scasw|scasd|scasq
seto|setno|setb|setc|setnae|setnb|setnc|setae|setz|sete|setnz|setne|setbe|setna|setnbe|seta|sets|setns|setp|setpe|setnp|setpo|setl|setnge|setnl|setge|setle|setng|setnle|setg
sfence|shl|shld|shlx|shr|shrd|shrx|slwpcb|stc|std|stos|stosb|stosw|stosd|stosq|sub
t1mskc|test|tzcnt|tzmsk
wrfsbase|wrgsbase
xadd|xchg|xlat|xlatb|xor

;4 System Instruction Reference
arpl|clgi|cli|clts|hlt|int 3|invd|invlpg|invlpga|iret|iretd|iretq|lar|lgdt|lidt|lldt|lmsw|lsl|ltr
monitor|monitorx|mov crn|mov drn|mwait|mwaitx|rdmsr|rdpmc|rdtsc|rdtscp|rsm
sgdt|sidt|skinit|sldt|smsw|sti|stgi|str|swapgs|syscall|sysenter|sysexit|sysret
ud2|verr|verw|vmload|vmmcall|vmrun|vmsave|wbinvd|wrmsr

; Zen Architecture
clzero

;====================================================================
;AMD64 Architecture Programmer’s Manual Volume 4: 128-Bit and 256-Bit Media Instructions (2013-05)
addpd|vaddpd|addps|vaddps|addsd|vaddsd|addss|vaddss|addsubpd|vaddsubpd|addsubps|vaddsubps
aesdec|vaesdec|aesdeclast|vaesdeclast|aesenc|vaesenc|aesenclast|vaesenclast|aesimc|vaesimc
aeskeygenassist|vaeskeygenassist|andnpd|vandnpd|andnps|vandnps|andpd|vandpd|andps|vandps

blendpd|vblendpd|blendps|vblendps|blendvpd|vblendvpd|blendvps|vblendvps

cmppd|vcmppd|cmpps|vcmpps|cmpsd|vcmpsd|cmpss|vcmpss|comisd|vcomisd|comiss|vcomiss
cvtdq2pd|vcvtdq2pd|cvtdq2ps|vcvtdq2ps|cvtpd2dq|vcvtpd2dq|cvtpd2ps|vcvtpd2ps|cvtps2dq|vcvtps2dq
cvtps2pd|vcvtps2pd|cvtsd2si|vcvtsd2si|cvtsd2ss|vcvtsd2ss|cvtsi2sd|vcvtsi2sd|cvtsi2ss|vcvtsi2ss
cvtss2sd|vcvtss2sd|cvtss2si|vcvtss2si|cvttpd2dq|vcvttpd2dq|cvttps2dq|vcvttps2dq|cvttsd2si|vcvttsd2si|cvttss2si|vcvttss2si

divpd|vdivpd|divps|vdivps|divsd|vdivsd|divss|vdivss|dppd|vdppd|dpps|vdpps

extractps|vextractps|extrq

haddpd|vhaddpd|haddps|vhaddps|hsubpd|vhsubpd|hsubps|vhsubps

insertps|vinsertps|insertq

lddqu|vlddqu|ldmxcsr|vldmxcsr

maskmovdqu|vmaskmovdqu|maxpd|vmaxpd|maxps|vmaxps|maxsd|vmaxsd|maxss|vmaxss|minpd|vminpd|minps|vminps|minsd|vminsd|minss|vminss
movapd|vmovapd|movaps|vmovaps|movd|vmovd|movddup|vmovddup|movdqa|vmovdqa|movdqu|vmovdqu|movhlps|vmovhlps
movhpd|vmovhpd|movhps|vmovhps|movlhps|vmovlhps|movlpd|vmovlpd|movlps|vmovlps|movmskpd|vmovmskpd|movmskps|vmovmskps
movntdq|vmovntdq|movntdqa|vmovntdqa|movntpd|vmovntpd|movntps|vmovntps|movntsd|movntss|movq|vmovq|movsd|vmovsd
movshdup|vmovshdup|movsldup|vmovsldup|movss|vmovss|movupd|vmovupd|movups|vmovups|mpsadbw|vmpsadbw
mulpd|vmulpd|mulps|vmulps|mulsd|vmulsd|mulss|vmulss

orpd|vorpd|orps|vorps

pabsb|vpabsb|pabsd|vpabsd|pabsw|vpabsw|packssdw|vpackssdw|packsswb|vpacksswb|packusdw|vpackusdw|packuswb|vpackuswb
paddb|vpaddb|paddd|vpaddd|paddq|vpaddq|paddsb|vpaddsb|paddsw|vpaddsw|paddusb|vpaddusb|paddusw|vpaddusw|paddw|vpaddw
palignr|vpalignr|pand|vpand|pandn|vpandn|pavgb|vpavgb|pavgw|vpavgw
pblendvb|vpblendvb|pblendw|vpblendw|pclmulqdq|vpclmulqdq
pcmpeqb|vpcmpeqb|pcmpeqd|vpcmpeqd|pcmpeqq|vpcmpeqq|pcmpeqw|vpcmpeqw|pcmpestri|vpcmpestri|pcmpestrm|vpcmpestrm
pcmpgtb|vpcmpgtb|pcmpgtd|vpcmpgtd|pcmpgtq|vpcmpgtq|pcmpgtw|vpcmpgtw|pcmpistri|vpcmpistri|pcmpistrm|vpcmpistrm
pextrb|vpextrb|pextrd|vpextrd|pextrq|vpextrq|pextrw|vpextrw|phaddd|vphaddd|phaddsw|vphaddsw|phaddw|vphaddw
phminposuw|vphminposuw|phsubd|vphsubd|phsubsw|vphsubsw|phsubw|vphsubw|pinsrb|vpinsrb|pinsrd|vpinsrd|pinsrq|vpinsrq|pinsrw|vpinsrw
pmaddubsw|vpmaddubsw|pmaddwd|vpmaddwd|pmaxsb|vpmaxsb|pmaxsd|vpmaxsd|pmaxsw|vpmaxsw|pmaxub|vpmaxub|pmaxud|vpmaxud|pmaxuw|vpmaxuw
pminsb|vpminsb|pminsd|vpminsd|pminsw|vpminsw|pminub|vpminub|pminud|vpminud|pminuw|vpminuw|pmovmskb|vpmovmskb
pmovsxbd|vpmovsxbd|pmovsxbq|vpmovsxbq|pmovsxbw|vpmovsxbw|pmovsxdq|vpmovsxdq|pmovsxwd|vpmovsxwd|pmovsxwq|vpmovsxwq
pmovzxbd|vpmovzxbd|pmovzxbq|vpmovzxbq|pmovzxbw|vpmovzxbw|pmovzxdq|vpmovzxdq|pmovzxwd|vpmovzxwd|pmovzxwq|vpmovzxwq
pmuldq|vpmuldq|pmulhrsw|vpmulhrsw|pmulhuw|vpmulhuw|pmulhw|vpmulhw|pmulld|vpmulld|pmullw|vpmullw|pmuludq|vpmuludq
por|vpor|psadbw|vpsadbw|pshufb|vpshufb|pshufd|vpshufd|pshufhw|vpshufhw|pshuflw|vpshuflw|psignb|vpsignb|psignd|vpsignd|psignw|vpsignw
pslld|vpslld|pslldq|vpslldq|psllq|vpsllq|psllw|vpsllw|psrad|vpsrad|psraw|vpsraw|psrld|vpsrld|psrldq|vpsrldq|psrlq|vpsrlq|psrlw|vpsrlw
psubb|vpsubb|psubd|vpsubd|psubq|vpsubq|psubsb|vpsubsb|psubsw|vpsubsw|psubusb|vpsubusb|psubusw|vpsubusw|psubw|vpsubw|ptest|vptest
punpckhbw|vpunpckhbw|punpckhdq|vpunpckhdq|punpckhqdq|vpunpckhqdq|punpckhwd|vpunpckhwd
punpcklbw|vpunpcklbw|punpckldq|vpunpckldq|punpcklqdq|vpunpcklqdq|punpcklwd|vpunpcklwd|pxor|vpxor

rcpps|vrcpps|rcpss|vrcpss|roundpd|vroundpd|roundps|vroundps|roundsd|vroundsd|roundss|vroundss|rsqrtps|vrsqrtps|rsqrtss|vrsqrtss

shufpd|vshufpd|shufps|vshufps|sqrtpd|vsqrtpd|sqrtps|vsqrtps|sqrtsd|vsqrtsd|sqrtss|vsqrtss|stmxcsr|vstmxcsr|subpd|vsubpd|subps|vsubps|subsd|vsubsd|subss|vsubss

ucomisd|vucomisd|ucomiss|vucomiss|unpckhpd|vunpckhpd|unpckhps|vunpckhps|unpcklpd|vunpcklpd|unpcklps|vunpcklps

vbroadcastf128|vbroadcastsd|vbroadcastss|vcvtph2ps|vcvtps2ph|vextractf128
vfmaddpd|vfmadd132pd|vfmadd213pd|vfmadd231pd|vfmaddps|vfmadd132ps|vfmadd213ps|vfmadd231ps
vfmaddsd|vfmadd132sd|vfmadd213sd|vfmadd231sd|vfmaddss|vfmadd132ss|vfmadd213ss|vfmadd231ss
vfmaddsubpd|vfmaddsub132pd|vfmaddsub213pd|vfmaddsub231pd|vfmaddsubps|vfmaddsub132ps|vfmaddsub213ps|vfmaddsub231ps
vfmsubaddpd|vfmsubadd132pd|vfmsubadd213pd|vfmsubadd231pd|vfmsubaddps|vfmsubadd132ps|vfmsubadd213ps|vfmsubadd231ps
vfmsubpd|vfmsub132pd|vfmsub213pd|vfmsub231pd|vfmsubps|vfmsub132ps|vfmsub213ps|vfmsub231ps
vfmsubsd|vfmsub132sd|vfmsub213sd|vfmsub231sd|vfmsubss|vfmsub132ss|vfmsub213ss|vfmsub231ss
vfnmaddpd|vfnmadd132pd|vfnmadd213pd|vfnmadd231pd|vfnmaddps|vfnmadd132ps|vfnmadd213ps|vfnmadd231ps
vfnmaddsd|vfnmadd132sd|vfnmadd213sd|vfnmadd231sd|vfnmaddss|vfnmadd132ss|vfnmadd213ss|vfnmadd231ss
vfnmsubpd|vfnmsub132pd|vfnmsub213pd|vfnmsub231pd|vfnmsubps|vfnmsub132ps|vfnmsub213ps|vfnmsub231ps
vfnmsubsd|vfnmsub132sd|vfnmsub213sd|vfnmsub231sd|vfnmsubss|vfnmsub132ss|vfnmsub213ss|vfnmsub231ss
vfrczpd|vfrczps|vfrczsd|vfrczss|vinsertf128|vmaskmovpd|vmaskmovps
vpcmov|vpcomb|vpcomd|vpcomq|vpcomub|vpcomud|vpcomuq|vpcomuw|vpcomw
vperm2f128|vpermil2pd|vpermil2ps|vpermilpd|vpermilps
vphaddbd|vphaddbq|vphaddbw|vphadddq|vphaddubd|vphaddubq|vphaddubw|vphaddudq|vphadduwd|vphadduwq|vphaddwd|vphaddwq
vphsubbw|vphsubdq|vphsubwd|vpmacsdd|vpmacsdqh|vpmacsdql|vpmacssdd|vpmacssdqh|vpmacssdql|vpmacsswd|vpmacssww|vpmacswd|vpmacsww
vpmadcsswd|vpmadcswd|vpperm|vprotb|vprotd|vprotq|vprotw|vpshab|vpshad|vpshaq|vpshaw|vpshlb|vpshld|vpshlq|vpshlw
vtestpd|vtestps|vzeroall|vzeroupper

xgetbv|xorpd|vxorpd|xorps|vxorps|xrstor|xsave|xsaveopt|xsetbv

;AMD64 Architecture Programmer’s Manual Volume 5: 64-Bit Media and x87 Floating-Point Instructions (2013-05)
;1 64-Bit Media Instruction Reference
cvtpd2pi|cvtpi2pd|cvtpi2ps|cvtps2pi|cvttpd2pi|cvttps2pi
emms|femms
frstor|fsave|fnsave|fxrstor|fxsave
maskmovq|movd|movdq2q|movntq|movq|movq2dq
packssdw|packsswb|packuswb

paddb|paddd|paddq|paddsb|paddsw|paddusb|paddusw|paddw|pand|pandn|pavgb|pavgusb|pavgw
pcmpeqb|pcmpeqd|pcmpeqw|pcmpgtb|pcmpgtd|pcmpgtw
pextrw
pf2id|pf2iw|pfacc|pfadd|pfcmpeq|pfcmpge|pfcmpgt|pfmax|pfmin|pfmul|pfnacc|pfpnacc|pfrcp|pfrcpit1|pfrcpit2|pfrsqit1|pfrsqrt|pfsub|pfsubr
pi2fd|pi2fw|pinsrw|pmaddwd|pmaxsw|pmaxub|pminsw|pminub|pmovmskb|pmulhrw|pmulhuw|pmulhw|pmullw|pmuludq|por|psadbw|pshufw
pslld|psllq|psllw|psrad|psraw|psrld|psrlq|psrlw|psubb|psubd|psubq|psubsb|psubsw|psubusb|psubusw|psubw|pswapd
punpckhbw|punpckhdq|punpckhwd|punpcklbw|punpckldq|punpcklwd|pxor

;2 x87 Floating-Point Instruction Reference
f2xm1|fabs|fadd|faddp|fiadd|fbld|fbstp|fchs|fclex|fnclex
fcmovb|fcmovbe|fcmove|fcmovnb|fcmovnbe|fcmovne|fcmovnu|fcmovu
fcom|fcomp|fcompp|fcomi|fcomip|fcos|fdecstp|fdiv|fdivp|fidiv|fdivr|fdivrp|fidivr|ffree|ficom|ficomp|fild|fincstp|finit|fninit
fist|fistp|fisttp|fld|fld1|fldcw|fldenv|fldl2e|fldl2t|fldlg2|fldln2|fldpi|fldz|fmul|fmulp|fimul|fnop|fpatan|fprem|fprem1|fptan
frndint|frstor|fsave|fnsave|fscale|fsin|fsincos|fsqrt|fst|fstp|fstcw|fnstcw|fstenv|fnstenv|fstsw|fnstsw
fsub|fsubp|fisub|fsubr|fsubrp|fisubr|ftst|fucom|fucomp|fucompp|fucomi|fucomip|fwait|wait|fxam|fxch|fxrstor|fxsave|fxtract|fyl2x|fyl2xp1

;====================================================================
;legacy
retn|retf

;undocumented
icebp
int1
smi
int03			; Instead of INT3
ud1			; No documented mnemonic for this one

sqrtps xmm0,[ebx+10]	; SSE opcode
paddsiw mm0,[ebx+10]	; Cyrix opcode with the same byte seq.

;====================================================================
;old samples
label:	vaddpd xmm10, [rax+r15*4]
		vaddps ymm1, ymm2, yword [rax]
lock	add st0, mm1

.text
		db 'test\0'
