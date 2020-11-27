; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

dq 200
;  ^^^ constant.numeric.decimal
dq 0200
;  ^^^^ constant.numeric.decimal
dq 0200d
;  ^^^^^ constant.numeric.decimal
dq 0200t
;  ^^^^^ constant.numeric.decimal
dq 0d200
;  ^^^^^ constant.numeric.decimal
dq 0t200
;  ^^^^^ constant.numeric.decimal
dq 200_000
;  ^^^^^^^ constant.numeric.decimal
dq 0_200d
;  ^^^^^^ constant.numeric.decimal
dq 0_200t
;  ^^^^^^ constant.numeric.decimal
dq 0d200_000
;  ^^^^^^^^^ constant.numeric.decimal
dq 0t200_000
;  ^^^^^^^^^ constant.numeric.decimal
dd 0d3.7282705e+4
;  ^^^^^^^^^^^^^^ constant.numeric.decimal
dd 0t3.7282705e+4
;  ^^^^^^^^^^^^^^ constant.numeric.decimal

dq 0c8h
;  ^^^^ constant.numeric.hex
dq 0d8h
;  ^^^^ constant.numeric.hex
dq 0c8x
;  ^^^^ constant.numeric.hex
dq $0c8
;  ^^^^ constant.numeric.hex
dq $9c8
;  ^^^^ constant.numeric.hex
dq 0xc8
;  ^^^^ constant.numeric.hex
dq 0hc8
;  ^^^^ constant.numeric.hex
dq 0_c8h
;  ^^^^^ constant.numeric.hex
dq 0_c8x
;  ^^^^^ constant.numeric.hex
dq $0_c8
;  ^^^^^ constant.numeric.hex
dq 0x0_c8
;  ^^^^^^ constant.numeric.hex
dq 0h0_c8
;  ^^^^^^ constant.numeric.hex

dq 310q
;  ^^^^ constant.numeric.octal
dq 310o
;  ^^^^ constant.numeric.octal
dq 0o310
;  ^^^^^ constant.numeric.octal
dq 0q310
;  ^^^^^ constant.numeric.octal
dq 0_310q
;  ^^^^^^ constant.numeric.octal
dq 0_310o
;  ^^^^^^ constant.numeric.octal
dq 0o0_310
;  ^^^^^^^ constant.numeric.octal
dq 0q0_310
;  ^^^^^^^ constant.numeric.octal

dq 11001000b
;  ^^^^^^^^^ constant.numeric.binary
dq 11001000y
;  ^^^^^^^^^ constant.numeric.binary
dq 0b11001000
;  ^^^^^^^^^^ constant.numeric.binary
dq 0y11001000
;  ^^^^^^^^^^ constant.numeric.binary
dq 1100_1000b
;  ^^^^^^^^^^ constant.numeric.binary
dq 1100_1000y
;  ^^^^^^^^^^ constant.numeric.binary
dq 0b1100_1000
;  ^^^^^^^^^^^ constant.numeric.binary
dq 0y1100_1000
;  ^^^^^^^^^^^ constant.numeric.binary

dq 0.
;  ^^ constant.numeric.decimal.floating-point
dq 0.0
;  ^^^ constant.numeric.decimal.floating-point
dq -0.
;  ^ keyword.operator
;   ^^ constant.numeric.decimal.floating-point
dq -0.0
;  ^ keyword.operator
;   ^^^ constant.numeric.decimal.floating-point
dq 1.222_222_222
;  ^^^^^^^^^^^^^ constant.numeric.decimal.floating-point
dq 1.e10
;  ^^^^^ constant.numeric.decimal.floating-point
dq 1.e+10
;  ^^^^^^ constant.numeric.decimal.floating-point
dq 1.e-10
;  ^^^^^^ constant.numeric.decimal.floating-point

dq 3.141592653589793238462
;  ^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.decimal.floating-point
dq 0x400921fb54442d18
;  ^^^^^^^^^^^^^^^^^^ constant.numeric.hex
dq 1.e+4000
;  ^^^^^^^^ constant.numeric.decimal.floating-point

dq 12_345_678_901_245_678p 
;  ^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.decimal.packed-bcd
dq -12_345_678_901_245_678p 
;  ^ keyword.operator
;   ^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.decimal.packed-bcd
dq +0p33 
;  ^ keyword.operator
;   ^^^^ constant.numeric.decimal.packed-bcd
dq 33p
;  ^^^ constant.numeric.decimal.packed-bcd

dq 0x1f.
;  ^^^^^ constant.numeric.hex.floating-point
dq 0x1f.ff
;  ^^^^^^^ constant.numeric.hex.floating-point
dq 0x1fp2
;  ^^^^^^ constant.numeric.hex.floating-point
dq 0x1fp+2
;  ^^^^^^^ constant.numeric.hex.floating-point
dq 0x1f.p+2
;  ^^^^^^^^ constant.numeric.hex.floating-point
dq 0x1f.afp+2
;  ^^^^^^^^^^ constant.numeric.hex.floating-point
dq 0x0.123456789abcdef0123456789abcdef012345p-10
;  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.hex.floating-point
dq 0h1f.
;  ^^^^^ constant.numeric.hex.floating-point
dq 0h1f.ff
;  ^^^^^^^ constant.numeric.hex.floating-point
dq 0h1fp2
;  ^^^^^^ constant.numeric.hex.floating-point
dq 0h1fp+2
;  ^^^^^^^ constant.numeric.hex.floating-point
dq 0h1f.p+2
;  ^^^^^^^^ constant.numeric.hex.floating-point
dq 0h1f.afp+2
;  ^^^^^^^^^^ constant.numeric.hex.floating-point
dq $01f.
;  ^^^^^ constant.numeric.hex.floating-point
dq $01f.ff
;  ^^^^^^^ constant.numeric.hex.floating-point
dq $01fp2
;  ^^^^^^ constant.numeric.hex.floating-point
dq $01fp+2
;  ^^^^^^^ constant.numeric.hex.floating-point
dq $01f.p+2
;  ^^^^^^^^ constant.numeric.hex.floating-point
dq $01f.afp+2
;  ^^^^^^^^^^ constant.numeric.hex.floating-point
dq $0.12
;  ^^^^^ constant.numeric.hex.floating-point

dq 0b10.
;  ^^^^^ constant.numeric.binary.floating-point
dq 0b10.01
;  ^^^^^^^ constant.numeric.binary.floating-point
dq 0b10p2
;  ^^^^^^ constant.numeric.binary.floating-point
dq 0b10p+2
;  ^^^^^^^ constant.numeric.binary.floating-point
dq 0b10.p+2
;  ^^^^^^^^ constant.numeric.binary.floating-point
dq 0b10.01p+2
;  ^^^^^^^^^^ constant.numeric.binary.floating-point
dq 0y10.
;  ^^^^^ constant.numeric.binary.floating-point
dq 0y10.01
;  ^^^^^^^ constant.numeric.binary.floating-point
dq 0y10p2
;  ^^^^^^ constant.numeric.binary.floating-point
dq 0y10p+2
;  ^^^^^^^ constant.numeric.binary.floating-point
dq 0y10.p+2
;  ^^^^^^^^ constant.numeric.binary.floating-point
dq 0y10.01p+2
;  ^^^^^^^^^^ constant.numeric.binary.floating-point

dq 0o17.
;  ^^^^^ constant.numeric.octal.floating-point
dq 0o17.71
;  ^^^^^^^ constant.numeric.octal.floating-point
dq 0o17p9
;  ^^^^^^ constant.numeric.octal.floating-point
dq 0o17p+9
;  ^^^^^^^ constant.numeric.octal.floating-point
dq 0o17.p+9
;  ^^^^^^^^ constant.numeric.octal.floating-point
dq 0o17.71p+9
;  ^^^^^^^^^^ constant.numeric.octal.floating-point
dq 0q17.
;  ^^^^^ constant.numeric.octal.floating-point
dq 0q17.71
;  ^^^^^^^ constant.numeric.octal.floating-point
dq 0q17p9
;  ^^^^^^ constant.numeric.octal.floating-point
dq 0q17p+9
;  ^^^^^^^ constant.numeric.octal.floating-point
dq 0q17.p+9
;  ^^^^^^^^ constant.numeric.octal.floating-point
dq 0q17.71p+9
;  ^^^^^^^^^^ constant.numeric.octal.floating-point


; NOT A NUMBER TESTS

dq $a0
;  ^^^ - constant.numeric
dq $ff
;  ^^^ - constant.numeric

dq .0
;  ^^ - constant.numeric
;   ^ entity.name.constant
dq -.0
;   ^^ - constant.numeric
;  ^ keyword.operator
;    ^ entity.name.constant
   .e10
;   ^^^ entity.name.constant
   .e-10
;   ^ entity.name.constant
;    ^ keyword.operator
;     ^^ constant.numeric.decimal

dq 0x1p+1a
;  ^^^^^^^ - constant.numeric
dq 0b12.01
;  ^^^^^^^ - constant.numeric
dq 0b10.12
;  ^^^^^ constant.numeric.binary.floating-point
;       ^^ constant.numeric.decimal
dq 0o89.01
;  ^^^^^^^ - constant.numeric
dq 0o10.19
;  ^^^^^ constant.numeric.octal.floating-point
;       ^^ constant.numeric.decimal

; NASM TESTS

dd 0x1234_5678
;  ^^^^^^^^^^^ constant.numeric.hex
dd 305_419_896        ; Same number as above it
;  ^^^^^^^^^^^ constant.numeric.decimal
dd 0x1e16        ; NOT a floating-point number!
;  ^^^^^^ constant.numeric.hex - constant.numeric.hex.floating-point - constant.numeric.decimal.floating-point
dd 1e16h        ; NOT a floating-point number!
;  ^^^^^ constant.numeric.hex - constant.numeric.hex.floating-point - constant.numeric.decimal.floating-point
dd 1e16_h        ; NOT a floating-point number!
;  ^^^^^^ constant.numeric.hex - constant.numeric.hex.floating-point - constant.numeric.decimal.floating-point
dd $1e16        ; NOT a floating-point number!
;  ^^^^^ constant.numeric.hex - constant.numeric.hex.floating-point - constant.numeric.decimal.floating-point
dd $1e+16        ; NOT a floating-point number!
;  ^^^ constant.numeric.hex
;     ^ keyword.operator.arithmetic
;      ^^ constant.numeric.decimal
;  ^^^^^^ - constant.numeric.hex.floating-point - constant.numeric.decimal.floating-point
dd 1e16            ; THIS is a floating-point number!
;  ^^^^ constant.numeric.decimal.floating-point
dd 1e+16
;  ^^^^^ constant.numeric.decimal.floating-point
dd 1.e+16
;  ^^^^^^ constant.numeric.decimal.floating-point
dd 1e+1_6
;  ^^^^^^ constant.numeric.decimal.floating-point
dd 1e1_6
;  ^^^^^ constant.numeric.decimal.floating-point
dd 1.0e16
;  ^^^^^^ constant.numeric.decimal.floating-point
dd 1_0e16        ; This is 1e17, not 1e16!
;  ^^^^^^ constant.numeric.decimal.floating-point

