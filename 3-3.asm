comment /*
	3.	�ܱ�4���������ܱ�100�����������걻400��������������ꡣ
*/

include vcIO.inc
.data
	Lyear dword 100 dup(?)
	Lcounter dword 0
	frmStr byte '%5d',13, 10, 0
.code
	main proc
		xor esi, esi			; //esi ��������������� ����Lyear �±�
		mov ecx, 2012		; //ecx ��ݼ�����
		.while (ecx<2100)
			mov eax, ecx
			xor dx, dx
			mov bx, 400
			div bx
			cmp dx, 0
			jz leap			; //if year mod 400=0 then goto leap

			mov eax, ecx
			xor dx, dx
			mov bx, 4
			div bx
			cmp dx, 0
			jnz next			; //if year mod 4!=0 then goto next

			mov eax, ecx
			xor dx, dx
			mov bx, 100
			div bx
			cmp dx, 0
			jz next			; //if year mod 100=0 then goto next
		leap:
			mov Lyear[esi*4], ecx
			inc esi
			mov eax, ecx	
			pushad
				invoke printf, offset frmStr, eax
			popad
		next:
			inc ecx
		.endw
		mov Lcounter, esi
		mov eax, esi
		pushad
			invoke printf, offset frmStr, eax
		popad			
		invoke _getch
		ret
	main endp
	end main