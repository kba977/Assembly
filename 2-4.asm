comment /*
	4.����һ�����(����readuid�ӳ����scanf����),�ж����Ƿ������ꡣ        ��ʾ������divָ����������α�����������£�        read year        if (year mod 4=0 and year mod 100 <>0) 								or (year mod 400=0) then             print year ��'is leap year. '        else             print year ��'is not leap year. '   
*/

include vcIO.inc

.data
	year dword ?
	frmStr	  byte	'%d',0
	leap byte ' is leap year', 13, 10, 0
	notleap byte ' is not leap year', 13, 10, 0
	prompt byte 'Enter a year : ', 0
.code
main proc
	pushad
		invoke printf, offset prompt
		invoke scanf, offset frmStr, offset year
		mov eax, year
		xor dx, dx
		mov bx, 400
		div bx
		cmp dx, 0
		jz leapyear

		mov eax, year
		xor dx, dx
		mov bx, 4
		div bx
		cmp dx, 0
		jnz notleapyear

		mov eax, year
		xor dx, dx
		mov bx, 100
		div bx
		cmp dx, 0
		jnz leapyear
	leapyear:
		invoke printf, offset frmStr, year 
		invoke printf, offset leap
		jmp done
	notleapyear:
		invoke printf, offset frmStr, year
		invoke printf, offset notleap
	done:
	popad
	invoke _getch
	ret
main endp
end main