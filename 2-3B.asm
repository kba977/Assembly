comment /*
*/

include vcIO.inc
.data
    sum dword 0
    frmStr byte '%d',13, 10, 0  
.code
main proc
    pushad
        mov ebx, sum    ; // �� ebx �������ܺ�
        mov ecx, 100
    again:
        test ecx, 1h    ; // �������λ��1�����������ж���ż��
        jnz next        
        add ebx, ecx
    next:
    loop again
        mov sum, ebx
    invoke printf, offset frmStr, sum
    popad
    invoke _getch
    ret
main endp
end main