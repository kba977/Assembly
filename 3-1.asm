comment /*
	 1.	���дһ�������ĳ���,������array�е�Ԫ�ذ������ţ�
	*/

include vcIO.inc

.data
	array dword 12,4,168,122,-33,56,78,99,345,66,-5
	;count dword lengthof array
	frmStr byte '%4d',0
.code
main proc

	mov esi, 0						; // left ָ��
	mov edi, lengthof array -1		; // right ָ��
	.while (esi<edi)
		mov eax, array[esi*4]		; // ������β����
		xchg eax, array[edi*4]
		mov array[esi*4], eax
		inc esi						; // ָ������ƶ�
		dec edi						; // ָ����ǰ�ƶ�
	.endw
		
		mov ecx, lengthof array
		mov esi, offset array

	again:
		mov eax, [esi]
		pushad						; // printf Ӱ�� eax �� ecx ��ֵ�������ڴ�ӡ֮ǰ�ȱ�������		
			invoke printf ,offset frmStr, eax
		popad
		add esi, 4
		loop again
	
	invoke _getch
	ret
main endp
end main