comment /*
	2. Fibonacci numbers�Ķ��壺
*/

include vcIO.inc

.data
	f1 dword 1
	f2 dword 1
	fn dword ?
	frmStr byte '%5d',13, 10, 0
.code
main proc
	;pushad
		mov ecx, 18
		;mov eax, f1
		;add eax, f2
	again:	
		mov eax, f1
		add eax, f2
		mov ebx, f2
		mov f1, ebx
		mov f2, eax
		pushad
			invoke printf, offset frmStr, eax
		popad
		loop again
		
		;mov fn, eax

		;invoke printf, offset frmStr, fn
	;popad  
	invoke _getch
	ret
main endp
end main