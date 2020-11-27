; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

; `` allow c-style escaping
db `These escape sequences are supported:`
db `single quote (\')`
db `double quote (\")`
db `back quote (\`)`
db `backslash (\\)`
db `question mark (\?)`
db `ascii non-printing characters (\a, \b, \t, \n, \v, \f, \r, \e)`
db `octal bytes (\377, but not \899 or \1243)`
db `hex bytes (\xa, \x0f or \xFA, but not \x1234)`
db `2 or 4-byte unicode (\u1234, \U12345678, but not \u123, \u12345678, \U1234, etc)`
db `also # and ; shouldn't be treated as comment`

; '' and "" are treated verbatim
db 'These escape sequences are supported:'
db 'double quote (\")'
db 'back quote (\`)'
db 'backslash (\\)'
db 'question mark (\?)'
db 'ascii non-printing characters (\a, \b, \t, \n, \v, \f, \r, \e)'
db 'octal bytes (\377, but not \899 or \1243)'
db 'hex bytes (\xa, \x0f or \xFA, but not \x1234)'
db '2 or 4-byte unicode (\u1234, \U12345678, but not \u123, \u12345678, \U1234, etc)'
db 'also # and ; should not be treated as comment'

db "These escape sequences are supported:"
db "single quote (\')"
db "back quote (\`)"
db "backslash (\\)"
db "question mark (\?)"
db "ascii non-printing characters (\a, \b, \t, \n, \v, \f, \r, \e)"
db "octal bytes (\377, but not \899 or \1243)"
db "hex bytes (\xa, \x0f or \xFA, but not \x1234)"
db "2 or 4-byte unicode (\u1234, \U12345678, but not \u123, \u12345678, \U1234, etc)"
db "also # and ; shouldn't be treated as comment"

; quote balancing
db "double quote can't be closed with single (') or back (`) quote"
db 'single quote can not be closed with double (") or back (`) quote'
db `back quote can't be closed with single ('), double (") or escaped back (\`) quote`

; tests
db `\'\"\`\\\?\a\b\t\n\v\f\r\e`
;   ^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.character.escape
db `octal bytes (\377, but not \899 or \1243)`
;                ^^^^ constant.character.escape
;                              ^^ invalid.illegal.constant.character.escape
;                                      ^^^^ constant.character.escape
db `hex bytes (\xa, \x0f or \xFA, but not \x1234)`
;              ^^^ constant.character.escape
;                   ^^^^ constant.character.escape
;                           ^^^^ constant.character.escape
;                                         ^^^^ constant.character.escape
db `2 or 4-byte unicode (\u1234, \U12345678, but not \u123, \u12345678, \U1234, etc)`
;                        ^^^^^^ constant.character.escape
;                                ^^^^^^^^^^ constant.character.escape
;                                                    ^^ invalid.illegal.constant.character.escape
;                                                           ^^^^^^ constant.character.escape
;                                                                       ^^ invalid.illegal.constant.character.escape

db `text \377 \899 ' " ; \``
;  ^ string.quoted.other punctuation.definition.string.begin
;   ^^^^^ string.quoted.other
;        ^^^^ string.quoted.other constant.character.escape
;             ^^ string.quoted.other invalid.illegal
;                  ^^^^^^ string.quoted.other
;                        ^^ string.quoted.other constant.character.escape
;                          ^ string.quoted.other punctuation.definition.string.end
db "text \n ' ` ?"
;  ^ string.quoted.double punctuation.definition.string.begin
;   ^^^^^^^^^^^^^ string.quoted.double
;                ^ string.quoted.double punctuation.definition.string.end
db 'text \t " ` ;'
;  ^ string.quoted.single punctuation.definition.string.begin
;   ^^^^^^^^^^^^^ string.quoted.single
;                ^ string.quoted.single punctuation.definition.string.end
