comment /*    3.  ������C���Գ���Ĵ���Ƭ��ת��Ϊ���ܵȼ۵Ļ�����Դ���Ƭ�Σ�        ��дһ�����Ļ�����Գ�����֤ת������ȷ�ԣ�����sum��i��Ϊ˫        �ֱ�����        ������5�¼����4��        sum=0;         for (i=1;i<=100;i++)            if (i%2 == 0)	                sum=sum+i;        ��ʾ������divָ��������
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