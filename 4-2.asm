comment /*
    2.  ���дһ����ΪGcd�������������Լ���ӳ������ӳ����
        �Ĳ�������ͨ����ջ��ɡ�����Gcd�ӳ����������˫�ֱ�����
        dvar1��dvar2 �� dvar3 �����Լ���������

        Ŀ��:ѧϰ�ӳ���Ĺ���������Ĵ��ݷ��������ö�ջ���ݲ�����  

        �㷨˼��
*/

include vcIO.inc
.data
    dvar1 dword 2012
    dvar2 dword 128
    dvar3 dword 456
    dgcd dword ?         ;// ������Լ��
    frmStr byte 'gcd(%d,%d,%d)=%d', 13, 10, 0
.code
main proc

    push dvar1
    push dvar2
    push offset dgcd
    call Gcd

    push dvar3
    push dgcd
    push offset dgcd
    call Gcd

    invoke printf, offset frmStr, dvar1, dvar2, dvar3, dgcd
    
    invoke _getch
    ret
main endp

Gcd proc

    push ebp
    mov ebp, esp

    push eax
    push ebx
    push ecx
    push edx
 
    mov ebx, [ebp+8]
    mov ecx, [ebp+12]
    mov eax, [ebp+16]

    .while (ecx!=0)
        xor edx, edx
        div ecx
        mov eax, ecx
        mov ecx, edx
    .endw
    mov [ebx], eax

restore:
    pop edx
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ret 3*4

Gcd endp
end main