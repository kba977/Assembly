comment /*
	5.	��һ���׵�ַΪstring���ַ��� ���޳�string�����еĿո��ַ���
*/

include vcIO.inc
.data
	msg byte ' Hel l o, wo rl D ', 13, 10, 0
.code
main proc

	invoke printf, offset msg

	mov edi, lengthof msg - 2		; // βָ��tailP
	mov esi, edi						; // ���������ɨ��ָ��scanP
	.while	sdword ptr esi > 0		; // sdword �� esi �����з�����
		cmp msg[esi], 20h			; // ����Ƿ�Ϊ�ո� �ո��Ascii��Ϊ20
		jnz next
		lea ebx, [esi+1]				; // �ƶ�ָ��moveP=scanP+1
		.while ebx <= edi
			mov al, msg[ebx]
			mov msg[ebx-1], al
			inc ebx
		.endw
		dec edi						; // βָ����ǰ�ƶ�һ��λ��
	next:
		dec esi						; // ɨ��ָ����ǰ�ƶ�һ��λ��
	.endw

	mov byte ptr msg[edi+1], 0
	
	invoke printf, offset msg
	
	invoke _getch
	ret
main endp
end main