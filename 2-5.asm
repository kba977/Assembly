comment /*
5.	����������������ת��ָ���while��do whileѭ���ṹ��	������������������sum��n(sum, nΪ˫��)��                                                                                                       sum=1+2+3+��.+n ;n=100	˼����: ����sum Ϊ˫���޷����������ںͲ�����������	���n�����ֵ; ���sum��n��ֵ��
*/

include vcIO.inc

.data
	sum	dword	?
	n	dword	100
	frmStr byte '%d',13,10,0
.code
main proc
	pushad
		mov eax, 0
		mov ecx, n
	s:	add eax, ecx
		loop s
		mov sum, eax
	popad
	invoke printf, offset frmStr, sum
	invoke _getch
	ret
main endp
end main