; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

label
label:
la12bel
la12bel:
la_$#@~.?bel_?
la_$#@~.?bel_?:
.local_label
.local_label:
.123
.1234:

  label
; ^^^^^ entity.name.constant
  label:
; ^^^^^ entity.name.constant
;      ^ punctuation.separator
  la12bel
; ^^^^^^^ entity.name.constant
  la12bel:
; ^^^^^^^ entity.name.constant
;        ^ punctuation.separator
  la_$#@~.?bel_?
; ^^^^^^^^^^^^^^ entity.name.constant
  la_$#@~.?bel_?:
; ^^^^^^^^^^^^^^ entity.name.constant
;               ^ punctuation.separator
  .local_label
; ^ punctuation.separator storage.modifier
;  ^^^^^^^^^^^ entity.name.constant
  .local_label:
; ^ punctuation.separator storage.modifier
;  ^^^^^^^^^^^ entity.name.constant
;             ^ punctuation.separator
  ..@special_label
; ^^^ punctuation.separator storage.modifier
;    ^^^^^^^^^^^^^ entity.name.constant
  ..@special_label:
; ^^^ punctuation.separator storage.modifier
;    ^^^^^^^^^^^^^ entity.name.constant
;                 ^ punctuation.separator
  .123
; ^ punctuation.separator storage.modifier
;  ^^^ entity.name.constant
  .123:
; ^ punctuation.separator storage.modifier
;  ^^^ entity.name.constant
;     ^ punctuation.separator

  ..start
; ^^^^^^^ support.constant
  ..imagebase
; ^^^^^^^^^^^ support.constant
  ..tlvp
; ^^^^^^ support.constant
  ..gotpcrel
; ^^^^^^^^^^ support.constant
  ..gotpc
; ^^^^^^^ support.constant
  ..gotoff
; ^^^^^^^^ support.constant
  ..got
; ^^^^^ support.constant
  ..plt
; ^^^^^ support.constant
  ..sym
; ^^^^^ support.constant
  ..tlsie
; ^^^^^^^ support.constant
  ..gottpoff
; ^^^^^^^^^^ support.constant


  0asdlfh
  @not_a_label:
  ~not_a_label:
  #not_a_label:
  $not_a_label:
  $variable
  ..not_a_label:
  ..not_a_label


  mov ax, bx
; ^^^ keyword.operator.word.mnemonic
;     ^^ constant.language.register
;         ^^ constant.language.register
