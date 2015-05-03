comment /*	2.	将下面C语言程序的代码片段转换为功能等价的汇编语言		代码片段；编写一完整的汇编语言程序验证转换的正确性，		其中ch1与caps均为字节变量。（题库第5章简答题3）			if (ch1> =’a’ && ch1< =’z’)			caps=0;        if (ch1> =’A’ && ch1< =’Z’) 	        caps=1;
*/
include vcIO.inc

.data
	chl dword 'A'
	caps dword ?
	frmStr byte '%d',0ah
.code
main proc
	pushad
		mov eax, chl
		cmp eax, 'a'
		jb next			; // jump if below 
		cmp eax, 'z'
		ja next			; // jump if above
		mov caps, 0
	next:
		cmp eax, 'A'
		jb done
		cmp eax, 'Z'
		ja done
		mov caps, 1
	done:
	popad

	invoke printf, offset frmStr, caps
	invoke _getch
	ret
main endp
end main