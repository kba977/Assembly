comment /*
	1.	������C���Գ���Ĵ���Ƭ��ת��Ϊ���ܵȼ۵Ļ�����Դ���Ƭ�Σ�
*/

include vcIO.inc

.data
	sign  dword 3
	sinteger dword -3
	frmStr  byte  '%d',0ah
.code
main proc
	pushad
		mov eax, sinteger
		cmp eax, 0
		jne label1
		mov sign, 0
		jmp done
	label1:
		cmp eax, 0
		jl label2
		mov sign, 1
		jmp done
	label2:
		mov sign, -1
	done:
	popad
	invoke printf, offset frmStr, sign
	invoke _getch
	ret
main endp
end main											;//end of assembly