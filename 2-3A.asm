comment /*	3.	������C���Գ���Ĵ���Ƭ��ת��Ϊ���ܵȼ۵Ļ�����Դ���Ƭ�Σ�		��дһ�����Ļ�����Գ�����֤ת������ȷ�ԣ�����sum��i��Ϊ˫		�ֱ�����				������5�¼����4��				sum=0; 		for (i=1;i<=100;i++)    			if (i%2 == 0)					sum=sum+i;				��ʾ������divָ��������
*/

include vcIO.inc

.data
	sum dword 0
	i	dword 1
	frmStr byte '%d',0ah
.code
main proc
	pushad
		mov bx, 2		; // bx ��ų���
	begin:
		mov ecx, i		; // ���������ݴ��ڼĴ���ecx��
		mov eax, i		; // ����Ĭ�ϴ����eax��
		cmp eax, 100
		jg done
		xor dx, dx		; // ��������
		div bx
		cmp dx, 0
		jnz label1
		add sum, ecx
		inc i
		jmp begin
	label1:
		inc i
		jmp begin
	done:	
	
	popad
	invoke printf, offset frmStr, sum
	invoke _getch
	ret
main endp
end main