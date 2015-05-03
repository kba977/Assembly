comment /*
	3.	能被4整除但不能被100整除，或者年被400整除的年份是闰年。		编程写一个完整的程序,求出2012年～2099年中的所有闰年年份,		并把它们存放在数组Lyear中。目的:学习如何利用条件转移指令		构造复杂逻辑运算结构。（题库第5章应用题1）			1.	esi=0闰年个数计数器;  ecx=2012年份计数器;			2.	while (ecx<2100)			{ 				if (year mod 4=0 and year mod 100 <>0) or (year mod 400=0) 				then				{					Lyear[esi]=ecx;					esi++;				}				ecx++;			}			3.	Lcounter=esi;		采用div指令求余数来判断整除性,采用带比例因子的相对寻址处理数组
*/

include vcIO.inc
.data
	Lyear dword 100 dup(?)
	Lcounter dword 0
	frmStr byte '%5d',13, 10, 0
.code
	main proc
		xor esi, esi			; //esi 闰年个数计数器， 兼做Lyear 下标
		mov ecx, 2012		; //ecx 年份计数器
		.while (ecx<2100)
			mov eax, ecx
			xor dx, dx
			mov bx, 400
			div bx
			cmp dx, 0
			jz leap			; //if year mod 400=0 then goto leap

			mov eax, ecx
			xor dx, dx
			mov bx, 4
			div bx
			cmp dx, 0
			jnz next			; //if year mod 4!=0 then goto next

			mov eax, ecx
			xor dx, dx
			mov bx, 100
			div bx
			cmp dx, 0
			jz next			; //if year mod 100=0 then goto next
		leap:
			mov Lyear[esi*4], ecx
			inc esi
			mov eax, ecx	
			pushad
				invoke printf, offset frmStr, eax
			popad
		next:
			inc ecx
		.endw
		mov Lcounter, esi
		mov eax, esi
		pushad
			invoke printf, offset frmStr, eax
		popad			
		invoke _getch
		ret
	main endp
	end main