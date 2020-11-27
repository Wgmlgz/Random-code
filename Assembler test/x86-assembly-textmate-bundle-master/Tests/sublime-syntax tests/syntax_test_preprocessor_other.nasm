; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%ifdef F1 
    ; do some setup 
%elifdef F2 
    ; do some different setup 
%else 
    %error "Neither F1 nor F2 was defined." 
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^ keyword.control.preprocessor
;          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted
    %error Neither F1 nor F2 was defined.
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^ keyword.control.preprocessor
;          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string
%endif

%ifdef F1 
    ; do some setup 
%elifdef F2 
    ; do some different setup 
%else 
    %warning "Neither F1 nor F2 was defined, assuming F1." 
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^^^ keyword.control.preprocessor
;            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted
    %warning "Neither F1 nor F2 was defined, assuming F1." 
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^^^ keyword.control.preprocessor
;            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string
    %define F1 
%endif

%if foo > 64 
    %assign foo_over foo-64 
    %fatal foo is foo_over bytes too large 
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^ keyword.control.preprocessor
;          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string
    %fatal "foo is foo_over bytes too large"
;   ^ punctuation.definition.keyword.preprocessor
;    ^^^^^ keyword.control.preprocessor
;          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ string.quoted
%endif

%line nnn[+mmm] [filename]
;<- punctuation.definition.keyword.preprocessor
;^^^^ keyword.control.preprocessor
%!variable: not a variable
;<- punctuation.definition.keyword.preprocessor - variable.parameter.preprocessor
;^ punctuation.definition.variable - variable.parameter.preprocessor
; ^^^^^^^^ variable.parameter.preprocessor.environment.unquoted
;         ^^^^^^^^^^^^^^^^ - variable.parameter.preprocessor
%!'also a variable' also not a variable
;<- punctuation.definition.keyword.preprocessor - variable.parameter.preprocessor
;^ punctuation.definition.variable - variable.parameter.preprocessor
; ^^^^^^^^^^^^^^^^^ variable.parameter.preprocessor.environment.quoted
;                   ^^^^^^^^^^^^^^^^^^^ - variable.parameter.preprocessor

%defstr FOO          %!FOO
%defstr C_colon      %!'C:'
%defstr C_colon      %!'C:'
;^^^^^^ - invalid.illegal - string
; '
%defstr blah text %!'c:'
%defstr blah text %!'c:'
;^^^^^^ - invalid.illegal - string
;                   ^^^^ variable.parameter.preprocessor.environment.quoted
; '
%defstr blah text %!'c:' text
%defstr blah text %!'c:' text text text
;^^^^^^ - invalid.illegal
;                   ^^^^ variable.parameter.preprocessor.environment.quoted
;                        ^^^^^^^^^^^^^^ string - invalid.illegal - variable.parameter.preprocessor.environment
%defstr C_colon      %!`C:`
%defstr C_colon      %!`C:`
;^^^^^^ - invalid.illegal - string
;                      ^^^^ variable.parameter.preprocessor.environment.quoted
; `
%defstr blah text %!`c:`
%defstr blah text %!`c:`
;^^^^^^ - invalid.illegal - string
;                   ^^^^ variable.parameter.preprocessor.environment.quoted
; `
%defstr blah text %!'c:' text
%defstr blah text %!`c:` text text text
;^^^^^^ - invalid.illegal
;                   ^^^^ variable.parameter.preprocessor.environment.quoted
;                        ^^^^^^^^^^^^^^ string - invalid.illegal - variable.parameter.preprocessor.environment
%defstr C_colon      %!"C:"
%defstr C_colon      %!"C:"
;^^^^^^ - invalid.illegal - string
; "
%defstr blah text %!"c:"
%defstr blah text %!"c:"
;^^^^^^ - invalid.illegal - string
;                   ^^^^ variable.parameter.preprocessor.environment.quoted
; "
%defstr blah text %!"c:" text
%defstr blah text %!"c:" text text text
;^^^^^^ - invalid.illegal
;                   ^^^^ variable.parameter.preprocessor.environment.quoted
;                        ^^^^^^^^^^^^^^ string - invalid.illegal - variable.parameter.preprocessor.environment

%defstr incfile %!'PROJECTBASEDIR'/%{1}.dec
;^^^^^^ - invalid.illegal
;                 ^^^^^^^^^^^^^^^^ variable.parameter.preprocessor.environment.quoted
;                                 ^^^^^^^^^ string - invalid.illegal - variable.parameter.preprocessor.environment

%macro import 1
    %defstr %%incfile %!PROJECTBASEDIR/%{1}.inc
;^^^^^^^^^^^^^^^^^^^^ - invalid.illegal
;                       ^^^^^^^^^^^^^^ variable.parameter.preprocessor.environment.unquoted
;                                     ^^^^^^^^^ string - invalid.illegal - variable.parameter.preprocessor.environment
    %defstr %%decfile %!'PROJECTBASEDIR'/%{1}.dec
;^^^^^^^^^^^^^^^^^^^^ - invalid.illegal
;                       ^^^^^^^^^^^^^^^^ variable.parameter.preprocessor.environment.quoted
;                                       ^^^^^^^^^ string - invalid.illegal - variable.parameter.preprocessor.environment
    db %%incfile, `\n`
    db %%decfile, `\n`
%endmacro