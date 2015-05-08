comment /*
    2.  编程写一个名为Gcd的求两个数最大公约数子程序，主子程序间
        的参数传递通过堆栈完成。调用Gcd子程序求出三个双字变量：
        dvar1、dvar2 与 dvar3 的最大公约数并输出。

        目的:学习子程序的构造与参数的传递方法。采用堆栈传递参数。  

        算法思想            欧几里得算法：                        gcd(a,0)=a;                        gcd(a,b)=gcd(b,a mod b)            算法描述                                      1.  while b!=0 do                        {                             r=a mod b;                            a=b;                            b=r;                        }                    2.  gcd=a;                   注意合理的分配使用寄存器，edx，eax做被除数            ebx=gcd的地址，eax=a,ecx=b  
*/

include vcIO.inc
.data
    dvar1 dword 2012
    dvar2 dword 128
    dvar3 dword 456
    dgcd dword ?         ;// 存放最大公约数
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