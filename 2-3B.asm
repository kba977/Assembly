comment /*    3.  将下面C语言程序的代码片段转换为功能等价的汇编语言代码片段；        编写一完整的汇编语言程序验证转换的正确性，其中sum与i均为双        字变量。        （题库第5章简答题4）        sum=0;         for (i=1;i<=100;i++)            if (i%2 == 0)	                sum=sum+i;        提示：采用div指令求余数
*/

include vcIO.inc
.data
    sum dword 0
    frmStr byte '%d',13, 10, 0  
.code
main proc
    pushad
        mov ebx, sum    ; // 用 ebx 来保存总和
        mov ecx, 100
    again:
        test ecx, 1h    ; // 测试最低位和1的与结果，来判断奇偶数
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