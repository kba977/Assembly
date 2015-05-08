comment /*
    3.  编程写一个名为Bubble的冒泡排序子程序, 主子程序间的参数传递通过堆栈完成； 并写主程序验证它。        注意：子程序中处理一维数组时只能采用间接寻址！        ecx=n-1;        while ecx>0        {             esi=array;     数组的首地址            ebx=ecx;            while ebx>0            {                 if [esi]>[esi+4]                    swap [esi],[esi+4];                esi=esi+4;                ebx--;            }            ecx--;        }
*/

include vcIO.inc
.data
    array dword 12,4,168,122,-33,56,78,99,345,66,-5
    count equ lengthof array
    frmStr byte '%d',13, 10, 0
.code
main proc
    push offset array   ;// array 的首地址进栈
    push count          ;// 数组元素个数进栈
    call Bubble
    xor esi, esi
    .while (esi<count)
        mov eax, array[esi*4]
        inc esi
            pushad
                invoke printf, offset frmStr, eax
            popad
    .endw
    invoke _getch
    ret
main endp

Bubble proc
;// function: Bubble Sort
;// Receivies: array, count
;// Returns: None
    
    push ebp
    mov ebp, esp
    
    push eax
    push ebx
    push ecx
    push esi
    push edi

    mov esi, [ebp+12]
    mov edi, esi
    mov ecx, [ebp+8]

    dec ecx
again:
    mov esi, edi        ;// esi=array 的首地址
    mov ebx, ecx
    .while (ebx>0)
        mov eax, [esi]
        cmp eax, [esi+4]
        jl next
        xchg eax, [esi+4]
        mov [esi], eax  ;// 交换两个相邻的元素
    next:
        add esi, 4
        dec ebx
    .endw
    loop again

restore:
        pop edi
        pop esi
        pop ecx
        pop ebx
        pop eax
        pop ebp
        ret 2*4
Bubble endp
end main