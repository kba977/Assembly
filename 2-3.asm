comment /*	3.	将下面C语言程序的代码片段转换为功能等价的汇编语言代码片段；		编写一完整的汇编语言程序验证转换的正确性，其中sum与i均为双		字变量。				（题库第5章简答题4）				sum=0; 		for (i=1;i<=100;i++)    			if (i%2 == 0)					sum=sum+i;				提示：采用div指令求余数
*/

include vcIO.inc

.data
	sum dword 0
	i	dword 1
	frmStr byte '%d',0ah
.code
main proc
	pushad
		mov bx, 2		; // bx 存放除数
	begin:
		mov ecx, i		; // 将被除数暂存在寄存器ecx中
		mov eax, i		; // 除数默认存放在eax中
		cmp eax, 100
		jg done
		xor dx, dx		; // 余数清零
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