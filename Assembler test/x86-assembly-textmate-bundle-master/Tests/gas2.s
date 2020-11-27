        .file   "hello2.c"
        .def    ___main;        .scl    2;      .type   32;     .endef
        .text
LC0:
        .ascii "Hello, world!\12\0"
.globl _main
        .def    _main;  .scl    2;      .type   32;     .endef
_main:
        pushl   %ebp
        movl    %esp, %ebp
        subl    $4, %esp
        andl    $-16, %esp
        movl    $0, %eax
        movl    %eax, -16(%ebp)
        movl    -16(%ebp), %eax
        call    __alloca
        call    ___main
        movl    $LC0, -4(%ebp)
        movl    $-11, (%esp)
        call    _GetStdHandle@4
        subl    $4, %esp
        movl    %eax, -12(%ebp)
        movl    $0, 16(%esp)
        leal    -8(%ebp), %eax
        movl    %eax, 12(%esp)
        movl    $14, 8(%esp)
        movl    -4(%ebp), %eax
        movl    %eax, 4(%esp)
        movl    -12(%ebp), %eax
        movl    %eax, (%esp)
        call    _WriteFile@20
        subl    $20, %esp
        movl    $0, %eax
        leave
        ret