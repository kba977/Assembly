comment /*
    1.  编写一个求n!的子程序, 利用它求                1! + 2! +3! +4! +5! +6! +7! +8! 的和并输出。        要求参数的传递分别采用：                    一.寄存器传递            二.全局变量传递            三.堆栈传递三种        不同的方法实现, 分析说明三种不同的参数的传递特点。
*/

;// 堆栈传参数

include vcIO.inc
.data
    sum dword ?             ;// 存放最终结果
    num dword 8         
    tmp dword ?             ;// 存放临时结果 如：8!, 7!, 6!等
    frmStr byte '%d', 13, 10, 0
.code
main proc
    xor eax, eax            ;// 累加器, 存放最终结果
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