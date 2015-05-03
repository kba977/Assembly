comment /*
5.	采用无条件和条件转移指令构造while和do while循环结构，	完成下面的求和任务并输出sum和n(sum, n为双字)。                                                                                                       sum=1+2+3+….+n ;n=100	思考题: 假设sum 为双字无符号整数，在和不溢出的情况下	求出n的最大值; 输出sum和n的值。
*/

include vcIO.inc

.data
	sum	dword	?
	n	dword	100
	frmStr byte '%d',13,10,0
.code
main proc
	pushad
		mov eax, 0
		mov ecx, n
	s:	add eax, ecx
		loop s
		mov sum, eax
	popad
	invoke printf, offset frmStr, sum
	invoke _getch
	ret
main endp
end main