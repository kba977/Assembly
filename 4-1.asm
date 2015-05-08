comment /*
    1.  ��дһ����n!���ӳ���, ��������                1! + 2! +3! +4! +5! +6! +7! +8! �ĺͲ������        Ҫ������Ĵ��ݷֱ���ã�                    һ.�Ĵ�������            ��.ȫ�ֱ�������            ��.��ջ��������        ��ͬ�ķ���ʵ��, ����˵�����ֲ�ͬ�Ĳ����Ĵ����ص㡣
*/

;// ��ջ������

include vcIO.inc
.data
    sum dword ?             ;// ������ս��
    num dword 8         
    tmp dword ?             ;// �����ʱ��� �磺8!, 7!, 6!��
    frmStr byte '%d', 13, 10, 0
.code
main proc
    xor eax, eax            ;// �ۼ���, ������ս��
    .while (num>0)
        push num        
        push offset tmp
        call Factor
        add eax, tmp
        dec num
    .endw

    mov sum, eax

    invoke printf, offset frmStr, sum
    invoke _getch
    ret
main endp

Factor proc 
;// function: calculate factorial
;// Receivies: num, tmp         ( num=n, tmp=0)
;// Returns: tmp                ( tmp=n!)    
    push ebp
    mov ebp, esp

    push eax
    push ebx
    push ecx

    mov ecx, [ebp+8]
    mov eax, [ebp+12]
    
    mov ebx, 1

    .while (eax>1)
        imul ebx, eax
        dec eax
    .endw

    mov [ecx], ebx

restore:
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ret 2*4

Factor endp

end main