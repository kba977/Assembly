comment /*
	6.	编写程序,求10到10000之间所有回文数并输出, 要求每行输出10个数。(题库第5章应用题9)		提示:	采用div指令把一个整数N的每一位分离出来。		注意:	此时得到的是N的各个位的逆序序列，将这个逆序序列再组合				成一个新的整数M，若M=N，则N是回文数
		算法描述			1. ecx=10 to 1000 do				1.1 eax=ecx			; 被除数 					ebx=10			; 除数					esi=0			; 新生成的数的初值				1.2 while eax != 0 do					1.2.1  edx=0  						   div ebx						   esi=esi*10+edx				1.3 if ecx=esi then print esi
*/

include vcIO.inc
.data
	counter dword 10
	frmStr byte '%5d', 0
	spaceline byte ' ', 13, 10, 0
.code
main proc
	mov ecx, 10
	mov ebx, ecx				; // ebx=10 除数
	.repeat
		xor esi, esi			; // esi=0 是新生成的数的初值
		mov eax, ecx			; // eax 被除数
		.while (eax!=0)
			xor edx, edx		; // 被除数高32位
			div ebx
			imul esi, 10
			add esi, edx		; // 逆序生成新数 esi=esi*10+edx
		.endw
		cmp ecx, esi
		jnz next
		
		; // 打印: 每行 10 个
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