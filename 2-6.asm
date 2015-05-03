comment /*
    6.从键盘上输入3个有符号的双字整数，编写一完整的程序按照又大到小的顺序输出这3个数。	  提示：采用xchg指令交换两个变量的值，伪代码描述如下：        1. read a,b,c		2. if  (a<b) then exchage( a,b)        3. if  (a<c) then exchage( a,c)        4. if  (b<c) then exchage( b,c)        5. print a,b,c
*/

include vcIO.inc

.data
	numa dword 0
	numb dword 0
	numc dword 0
	frmStr byte '%d', 0
	outfrm byte '%d', 10, 0
	prompt byte 'Please input three number: ',13,10,0
.code
main proc
	pushad
		invoke printf, offset prompt
		invoke scanf, offset frmStr, offset numa
		invoke scanf, offset frmStr, offset numb
		invoke scanf, offset frmStr, offset numc

		mov eax, numa
		mov ebx, numb
		mov ecx, numc

		cmp eax, ebx
		jnl label1
		mov edx, eax
		xchg ebx, edx
		mov eax, edx
	label1:
		cmp eax, ecx
		jnl label2
		mov edx, eax
		xchg ecx, edx
		mov eax, edx
	label2:
		cmp ebx, ecx
		jnl done
		mov edx, ebx
		xchg ebx, edx
		mov ebx, edx
	done: 
		mov numa, eax			; // printf 会影响 eax和 ecx的值， 
		mov numb, ebx			; // 故在printf 之前赋值给内存变量
		mov numc, ecx
	popad
		invoke printf, offset outfrm, numa      
		invoke printf, offset outfrm, numb
		invoke printf, offset outfrm, numc
	
		invoke _getch
		ret
main endp
end main