comment /*
	 4.	���дһ�������ĳ���ͳ���ַ���msg�еĿո�ĸ�����Сд��ĸ�ĸ�����
		���ֱ����Ǵ���space��Ԫ��char��Ԫ�в������������5��Ӧ����5��

		�㷨����
		  1. space=lowercase=0;
		  2. for i=0 to n-1 do
			2.1 if a[i]==' '  then space++;
			2.2 if 'a'<= a[i] <='z' then lowercase++;
		�������Ĵ���:����loopѭ����ecx=lengthof msg-1 
		space=eax=0��lowercase=ebx=0��esi=offset msg����ָ��
*/

include vcIO.inc
.data
	msg byte 'hElLo wor l d', 13, 10 ,0
	space dword ?
	lowercase dword ?
	frmStr byte 'space=%d, lowercase=%d', 13, 10, 0
.code
main proc
	mov ecx, lengthof msg - 1
	xor eax, eax
	xor ebx, ebx
	mov esi, offset msg			; // ָ��msg���׵�ַ 

again:	
	mov dl, [esi]
	cmp dl, ' '
	jnz letter					; // һ����ת�������á��ǡ�, �����ǿո�����ת
	inc eax				; // space++
letter:
	cmp dl, 'a'
	jb next						; // PS: ���� a[i]<'a'
	cmp dl, 'z'
	ja next						; // PS: ���� a[i]>'z'
	inc ebx				; // lowercase++
next:
	inc esi						; // ָ����һ���ַ�
	loop again
	
	mov space, eax
	mov lowercase, ebx 

	invoke printf, offset frmStr, space, lowercase
	invoke _getch
	ret
main endp
end main