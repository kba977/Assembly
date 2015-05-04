comment /*
	1.	将下面C语言程序的代码片段转换为功能等价的汇编语言代码片段；
		编写一完整的汇编语言程序验证转换的正确性，其中sign与sinte
		ger均为双字变量。        （题库第5章简答题2）
	伪代码: 
		if  (sinteger == 0)
	  		sign = 0;
		else if ( sinteger > 0)	 
			sign = 1;  
		else	 
	        sign = －1;
		提示：注意总结转换的规律并熟记！
*/

include vcIO.inc

.data
	sign  dword 3
	sinteger dword -3
	frmStr  byte  '%d',0ah
.code
main proc
	pushad
		mov eax, sinteger
		cmp eax, 0
		jne label1
		mov sign, 0
		jmp done
	label1:
		cmp eax, 0
		jl label2
		mov sign, 1
		jmp done
	label2:
		mov sign, -1
	done:
	popad
	invoke printf, offset frmStr, sign
	invoke _getch
	ret
main endp
end main					;//end of assembly
