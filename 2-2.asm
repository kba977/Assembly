comment /*	2.	������C���Գ���Ĵ���Ƭ��ת��Ϊ���ܵȼ۵Ļ������		����Ƭ�Σ���дһ�����Ļ�����Գ�����֤ת������ȷ�ԣ�		����ch1��caps��Ϊ�ֽڱ�����������5�¼����3��			if (ch1> =��a�� && ch1< =��z��)			caps=0;        if (ch1> =��A�� && ch1< =��Z��) 	        caps=1;
*/
include vcIO.inc

.data
	chl dword 'A'
	caps dword ?
	frmStr byte '%d',0ah
.code
main proc
	pushad
		mov eax, chl
		cmp eax, 'a'
		jb next			; // jump if below 
		cmp eax, 'z'
		ja next			; // jump if above
		mov caps, 0
	next:
		cmp eax, 'A'
		jb done
		cmp eax, 'Z'
		ja done
		mov caps, 1
	done:
	popad

	invoke printf, offset frmStr, caps
	invoke _getch
	ret
main endp
end main