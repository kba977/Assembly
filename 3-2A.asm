comment /*
	2. Fibonacci numbers�Ķ��壺		f1 = 1,		f2 = 1, 		fn = fn-1 + fn-2    (n>=3)      		������Fibonacci numbers��ǰ20�	˼���⣺�ڲ���������������n�����ֵ�Ƕ��٣�
*/

include vcIO.inc

.data
	f1 dword 1
	f2 dword 1
	fn dword ?
	frmStr byte '%5d', 13, 10, 0
.code
main proc
		mov ecx, 18
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
	invoke _getch
	ret
main endp
end main