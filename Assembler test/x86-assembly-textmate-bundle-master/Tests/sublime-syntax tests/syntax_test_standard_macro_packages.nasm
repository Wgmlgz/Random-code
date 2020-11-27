; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

__USE_ALTREG__
%use altreg 
proc: 
      mov r0l,r3h                    ; mov al,bh 
      ret

__USE_SMARTALIGN__
 alignmode generic, -1
;^^^^^^^^^ support.function
;          ^^^^^^^ support.constant
 ALIGNMODE     nop, -1
;^^^^^^^^^ support.function
;              ^^^ support.constant
 alignmode      k7
;               ^^ support.constant
 alignmode      k8
;               ^^ support.constant
 alignmode      p6
;               ^^ support.constant
 alignmode      p5, 12
;               ^^ invalid.illegal
 __ALIGNMODE__
;^^^^^^^^^^^^^ support.constant
 generic, nop, k7, k8, p6
;^^^^^^^ - support.constant
;         ^^^ - support.constant
;              ^^ - support.constant
;                  ^^ - support.constant
;                      ^^ - support.constant

__USE_FP__
 Inf             __Infinity__ 
;^^^ support.constant
 NaN             __QNaN__ 
;^^^ support.constant
 QNaN            __QNaN__ 
;^^^^ support.constant
 SNaN            __SNaN__ 
;^^^^ support.constant
 float8(x)       __float8__(x) 
;^^^^^^ support.function
 float16(x)      __float16__(x) 
;^^^^^^^ support.function
 float32(x)      __float32__(x) 
;^^^^^^^ support.function
 float64(x)      __float64__(x) 
;^^^^^^^ support.function
 float80m(x)     __float80m__(x) 
;^^^^^^^^ support.function
 float80e(x)     __float80e__(x) 
;^^^^^^^^ support.function
 float128l(x)    __float128l__(x) 
;^^^^^^^^^ support.function
 float128h(x)    __float128h__(x)
;^^^^^^^^^ support.function

__USE_IFUNC__
 ilog2(x)
;^^^^^ support.function
 ilog2e(x)
;^^^^^^ support.function
 ilog2w(x)
;^^^^^^ support.function
 ilog2fw(x)
;^^^^^^^ support.function
 ilog2f(x)
;^^^^^^ support.function
 ilog2cw(x)
;^^^^^^^ support.function
 ilog2c(x)
;^^^^^^ support.function
