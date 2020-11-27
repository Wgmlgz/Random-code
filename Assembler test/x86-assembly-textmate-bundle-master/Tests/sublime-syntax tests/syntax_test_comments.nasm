; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

    ; single-line comment /* */
;   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
;   ^ punctuation.definition.comment

    # also single-line comment
;   ^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line
;   ^ punctuation.definition.comment

    /**/
;   ^^^^ punctuation.definition.comment
;   ^^^^ comment.block

    /* single-line block */ mov ax, bx
;   ^^ punctuation.definition.comment
;                        ^^ punctuation.definition.comment
;   ^^^^^^^^^^^^^^^^^^^^^^^ comment.block
;                           ^^^ keyword.operator.word.mnemonic

    /*/*
;   ^^ punctuation.definition.comment
;   ^^^^ comment.block
    /**
;^^^^^^ comment.block
     ; multi-line comment
;^^^^^^^^^^^^^^^^^^^^^^^^ comment.block
     **/ mov ax, bx
;^^^^^^^ comment.block
;     ^^ punctuation.definition.comment
;        ^^^ keyword.operator.word.mnemonic
