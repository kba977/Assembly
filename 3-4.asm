comment /*
	 4.	编程写一个完整的程序统计字符串msg中的空格的个数与小写字母的个数，
		并分别将它们存入space单元与char单元中并输出。（题库第5章应用题5）

		算法描述
		  1. space=lowercase=0;
		  2. for i=0 to n-1 do
			2.1 if a[i]==' '  then space++;
			2.2 if 'a'<= a[i] <='z' then lowercase++;
		合理分配寄存器:采用loop循环，ecx=lengthof msg-1 
		space=eax=0，lowercase=ebx=0，esi=offset msg，做指针
*/

include vcIO.inc
.data
	msg byte 'hElLo wor l d', 13, 10 ,0
	space dword ?
	lowercase dword ?
	frmStr byte 'space=%d, lowercase=%d', 13, 10, 0
.code
main proc
	mov ecx, lengthof msg - 1
	xor eax, eax
	xor ebx, ebx
	mov esi, offset msg			; // 指向msg的首地址 

again:	
	mov dl, [esi]
	cmp dl, ' '
	jnz letter					; // 一般跳转的条件用“非”, 即不是空格则跳转
	inc eax				; // space++
letter:
	cmp dl, 'a'
	jb next						; // PS: 测试 a[i]<'a'
	cmp dl, 'z'
	ja next						; // PS: 测试 a[i]>'z'
	inc ebx				; // lowercase++
next:
	inc esi						; // 指向下一个字符
	loop again
	
	mov space, eax
	mov lowercase, ebx 

	invoke printf, offset frmStr, space, lowercase
	invoke _getch
	ret
main endp
end main