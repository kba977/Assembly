comment /*
	7.	���дһ�������ĳ���,���2��100֮��������������������Ǵ���Prime�����У�		�����ĸ����������Pcounter�С� 		Ŀ��:
			ѧϰ�����������ת��ָ�������ѭ���ṹ,����ѭ���Ĺ��췽����
		�㷨����:				0. Pcounter=0;				1. i=2 to 100 do					1.1  if  i is prime number then Prime[Pcounter++]=i					ϸ�� 1.1 ���£�					1.1 j=2 to i��2 do						1.1.1 if i mod j=0 then goto next i						1.1.2 Prime[Pcounter++]=i						�������Ĵ�����esi=0��esi��������������������Prime�±ꣻ  		���ô��������ӵ����Ѱַ�������顣		i=ebx, j=ecx, edxeax��������,ecx��������
*/

include vcIO.inc
.data
	Prime dword 100 dup (?)
	Pcounter dword ?
	flag byte ?
	frmStr byte '%5d', 0
	spaceline byte ' ',13,10,0
	frmStr1 byte 'counter: %d', 13, 10, 0
.code
main proc
	xor esi, esi					; // esi ��������������prime�±�
	;mov esi, offset Prime
	mov ecx, 2						; // ѭ�����Ʊ��� i

	.while (ecx<=100)
		push offset flag			; // flag�ĵ�ַ��ջ�� ����ַ
		push ecx					; // ecx ��ջ�� ��ֵ
		call prime
		cmp flag, 1
		jne next
		mov Prime[esi*4], ecx
		inc esi
	;//	pushad
	;//		invoke printf, offset frmStr, ecx
	;//	popad
	next:
		inc ecx
	.endw
	mov Pcounter, esi

	;// ��ӡ����
	xor esi, esi
	;mov esi, offset Prime

	mov ebx, 10

	.while(esi<Pcounter)
		mov eax, esi
		xor edx, edx
		div ebx
		cmp edx, 0
		jnz next_num
		invoke printf, offset spaceline
next_num:
		invoke printf, offset frmStr, Prime[esi*4]	
		inc esi
		
	.endw
	pushad
		invoke printf, offset spaceline
		invoke printf, offset frmStr1, Pcounter
	popad
	invoke _getch
	ret
main endp

prime proc
comment /*
	Function: �ж�һ���޷������� x �Ƿ�������
	Receives: ��ջ��ȡ�޷������� x ����־���� flag �ĵ�ַ
	Returns�� ��� x ������, �� flag=1, ���� flag=0 
	PS: [ebp+8] �����һ��ѹ��ջ�еĲ���
		��[ebp+8]Ϊ��׼, ��ջ�л�ȡ�����Ĳ���
	Algorithm:
		1.	flag = 1;
		2.	for i=x��2 downto 2 do
				if x mod i=0 then
					flag = 0;
					break;	
	edx, eax ��������, ebx=flag �ĵ�ַ, edi=x �����ݴ� x
*/
	push ebp
	mov ebp, esp					; // ��������ջ������ָ���׼
	push eax						; // �����ӳ�����Ҫʹ�õļĴ���
	push ebx
	push ecx
	push edx
	push edi
	mov ebx, [ebp+12]				; // ���� flag �ĵ�ַ
	mov byte ptr [ebx], 1			; // flag = 1
	mov eax, [ebp+8]				; // eax = x
	mov edi, eax					; // edi = x, �ݴ�x
	mov ecx, eax
	shr ecx, 1						; // ecx = x / 2 , shr ����
	.while (ecx>=2)
		mov eax, edi				; // eax = x
		xor edx, edx	
		div ecx						; // eax=��, edx=����
		cmp edx, 0					; // cmp edx, 0
		jnz next					; // if eax mod ecx != 0 then goto next
		mov byte ptr [ebx], 0		; // flag = 0
		jmp restore
	next:
		dec ecx
	.endw
	restore:
		pop edi						; // �ָ��ӳ�����ʹ�ù��ļĴ���
		pop edx
		pop ecx
		pop ebx
		pop eax
		pop ebp
		ret 2*4						; // ����ջ�еĲ���
prime endp
end main