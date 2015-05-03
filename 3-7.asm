comment /*
	7.	编程写一个完整的程序,求出2～100之间的所有素数，并将它们存入Prime数组中，		素数的个数存入变量Pcounter中。 		目的:
			学习如何利用条件转移指令构造条件循环结构,多重循环的构造方法。
		算法描述:				0. Pcounter=0;				1. i=2 to 100 do					1.1  if  i is prime number then Prime[Pcounter++]=i					细化 1.1 如下：					1.1 j=2 to i÷2 do						1.1.1 if i mod j=0 then goto next i						1.1.2 Prime[Pcounter++]=i						合理分配寄存器，esi=0，esi素数个数计数器，兼做Prime下标；  		采用带比例因子的相对寻址处理数组。		i=ebx, j=ecx, edxeax做被除数,ecx做除数。
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
	xor esi, esi					; // esi 素数个数，兼做prime下标
	;mov esi, offset Prime
	mov ecx, 2						; // 循环控制变量 i

	.while (ecx<=100)
		push offset flag			; // flag的地址进栈， 传地址
		push ecx					; // ecx 进栈， 传值
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

	;// 打印数组
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
	Function: 判断一个无符号整数 x 是否是素数
	Receives: 从栈获取无符号整数 x 及标志变量 flag 的地址
	Returns： 如果 x 是素数, 则 flag=1, 否则 flag=0 
	PS: [ebp+8] 是最后一个压入栈中的参数
		以[ebp+8]为基准, 从栈中获取其他的参数
	Algorithm:
		1.	flag = 1;
		2.	for i=x÷2 downto 2 do
				if x mod i=0 then
					flag = 0;
					break;	
	edx, eax 做被除数, ebx=flag 的地址, edi=x 用来暂存 x
*/
	push ebp
	mov ebp, esp					; // 建立访问栈参数的指针基准
	push eax						; // 保护子程序中要使用的寄存器
	push ebx
	push ecx
	push edx
	push edi
	mov ebx, [ebp+12]				; // 变量 flag 的地址
	mov byte ptr [ebx], 1			; // flag = 1
	mov eax, [ebp+8]				; // eax = x
	mov edi, eax					; // edi = x, 暂存x
	mov ecx, eax
	shr ecx, 1						; // ecx = x / 2 , shr 右移
	.while (ecx>=2)
		mov eax, edi				; // eax = x
		xor edx, edx	
		div ecx						; // eax=商, edx=余数
		cmp edx, 0					; // cmp edx, 0
		jnz next					; // if eax mod ecx != 0 then goto next
		mov byte ptr [ebx], 0		; // flag = 0
		jmp restore
	next:
		dec ecx
	.endw
	restore:
		pop edi						; // 恢复子程序中使用过的寄存器
		pop edx
		pop ecx
		pop ebx
		pop eax
		pop ebp
		ret 2*4						; // 清理栈中的参数
prime endp
end main