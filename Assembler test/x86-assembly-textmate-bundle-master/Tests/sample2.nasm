global _start
 
section .data
    v1: dd 1.1, 2.2, 3.3, 4.4    ;first set of 4 numbers
    v2: dd 5.5, 6.6, 7.7, 8.8    ;second set
 
section .bss
    v3: resd 4    ;result
 
section .text
    _start:
 
    movups xmm0, [v1]   ;load v1 into xmm0
    movups xmm1, [v2]   ;load v2 into xmm1
 
    addps xmm0, xmm1    ;add the 4 numbers in xmm1 (from v2) to the 4 numbers in xmm0 (from v1), store in xmm0. for the first float the result will be 5.5+1.1=6.6
    mulps xmm0, xmm1    ;multiply the four numbers in xmm1 (from v2, unchanged) with the results from the previous calculation (in xmm0), store in xmm0. for the first float the result will be 5.5*6.6=36.3
    subps xmm0, xmm1    ;subtract the four numbers in v2 (in xmm1, still unchanged) from result from previous calculation (in xmm1). for the first float, the result will be 36.3-5.5=30.8
 
    movups [v3], xmm0   ;store v1 in v3
 
    ;end program