comment /*
	6.	��д����,��10��10000֮�����л����������, Ҫ��ÿ�����10������(����5��Ӧ����9)		��ʾ:	����divָ���һ������N��ÿһλ���������		ע��:	��ʱ�õ�����N�ĸ���λ���������У�������������������				��һ���µ�����M����M=N����N�ǻ�����
		�㷨����			1. ecx=10 to 1000 do				1.1 eax=ecx			; ������ 					ebx=10			; ����					esi=0			; �����ɵ����ĳ�ֵ				1.2 while eax != 0 do					1.2.1  edx=0  						   div ebx						   esi=esi*10+edx				1.3 if ecx=esi then print esi
*/

include vcIO.inc
.data
	counter dword 10
	frmStr byte '%5d', 0
	spaceline byte ' ', 13, 10, 0
.code
main proc
	mov ecx, 10
	mov ebx, ecx				; // ebx=10 ����
	.repeat
		xor esi, esi			; // esi=0 �������ɵ����ĳ�ֵ
		mov eax, ecx			; // eax ������
		.while (eax!=0)
			xor edx, edx		; // ��������32λ
			div ebx
			imul esi, 10
			add esi, edx		; // ������������ esi=esi*10+edx
		.endw
		cmp ecx, esi
		jnz next
		
		; // ��ӡ: ÿ�� 10 ��
		mov eax, counter
		cmp eax, 0
		jnz next_num
		pushad
			invoke printf, offset spaceline
		popad
		mov eax, 9
		mov counter, eax
		jmp print
	
	next_num:
		dec eax
		mov counter, eax
	print:
		pushad
			invoke printf, offset frmStr, ecx
		popad
			
	next:
		inc ecx
	.until(ecx>10000)
	invoke _getch
	ret
main endp
end main