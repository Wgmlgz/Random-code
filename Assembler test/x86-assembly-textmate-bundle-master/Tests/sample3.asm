.data
	.align 16
        v1: .float 1.1, 2.2, 3.3, 4.4
        v2: .float 5.5, 6.6, 7.7, 8.8
        v3: .float 0, 0, 0, 0
 
.text
.global _start 
_start:   
        movaps  v1,%xmm0        # load v1 into xmm0 to xmm6
        movaps  v1,%xmm1	# using movaps since v1 is 16 byte aligned
        movaps  v1,%xmm2
        movaps  v1,%xmm3
        movaps  v1,%xmm4
        movaps  v1,%xmm5
        movaps  v1,%xmm6
 
        shufps $0x1b, %xmm0, %xmm0 # reverse order of the 4 floats
        shufps $0x00, %xmm1, %xmm1 # Broadcast least significant element to all elements
        shufps $0x55, %xmm2, %xmm2 # Broadcast second element to all elements
        shufps $0xAA, %xmm3, %xmm3 # Broadcast third element to all elements
        shufps $0xFF, %xmm4, %xmm4 # Broadcast most significant element to all elements
        shufps $0x39, %xmm5, %xmm5 # Rotate elements right
        shufps $0x93, %xmm6, %xmm6 # Rotate elements left 
 
        movups  %xmm0,v3        # store v1 in v3
        ret