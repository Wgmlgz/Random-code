; SYNTAX TEST "Packages/User/x86_64 Assembly.tmbundle/Syntaxes/Nasm Assembly.sublime-syntax"

%pragma
%pragma bluttan
%pragma bluttan blej
%pragma "Hej tomtegubbar"
%define PR asm foobar
%pragma PR
%pragma preproc
%pragma preproc tjo fidelittan preproc
%pragma dbg tjo fidelittan output
%pragma dbgdbg tjo fidelittan debug format
%pragma Dbg Tjo Fidelittan Output
%pragma Dbgdbg Tjo Fidelittan Debug Format

; opmask 
    VDIVPD zmm0{k1}{z}, zmm1, zmm3  ; conditional vector operation 
; broadcasting 
    VDIVPS zmm4, zmm5, [rbx]{1to16} ; load single-precision float and 
; embedded rounding 
    VCVTSI2SD xmm6, xmm7, {rz-sae}, rax ; round toward zero. note that it 
                                      ; is used as if a separate operand. 
                                      ; it comes after the last SIMD operand

     mov eax,[nosplit eax]       ; eax as base register 
     mov eax,[nosplit eax*1]     ; eax as index register

{k7}
{z}
{rn-sae}
{ru-sae}
{rd-sae}
{rz-sae}
{1to8}
{1to16}
{sae}
{k1}