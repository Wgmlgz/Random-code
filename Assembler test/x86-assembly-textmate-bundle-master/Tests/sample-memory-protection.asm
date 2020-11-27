bndcl bnd0, [rax]
bndcu bnd0, [rax+3] ; operand size is 4
mov dword ptr [rax], rbx ; RBX has the data to be written to the buffer

mov ecx, dword ptr [esi] ; store the pointer value in the index register ECX
mov eax, esi ; store the pointer in the base register EAX
bndstx dword ptr [eax+ecx], bnd0 ; perform address translation from the linear address of the base EAX and store bounds and pointer value ECX onto a bound table entry

mov eax, dword ptr [ebx]
bndldx bnd0, dword ptr [ebx+eax]; perform address translation from the linear address of the base EBX, and loads bounds and pointer value from a bound table entry
