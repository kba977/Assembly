comment /*
	2. Fibonacci numbers�Ķ��壺		f1 = 1,		f2 = 1, 		fn = fn-1 + fn-2    (n>=3)      		������Fibonacci numbers��ǰ20�	˼���⣺�ڲ���������������n�����ֵ�Ƕ��٣�
*/

include vcIO.inc

.data
    frmStr byte '%5d',13, 10, 0
.code
main proc
        mov ecx, 20
        mov eax, 1
        mov ebx, 1
    again:
        pushad
            invoke printf, offset frmStr, ebx
        popad
        add ebx, eax
        xchg eax, ebx
        loop again
    invoke _getch
    ret
main endp
end main