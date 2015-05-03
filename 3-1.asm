comment /*
	 1.	编程写一个完整的程序,将数组array中的元素按逆序存放，		要求程序中附加的变量最少。（题库第5章应用题3）	  算法描述		 left,right分别指向数组的第一个和最后一个元素，采用首尾交换。			1. left=0, right=n-1；			2. while （left<right do）			{ 				swap a[left],a[right] ;				left++;				right--;			} 		合理分配寄存器:left=esi, right=edi 		采用带比例因子的相对寻址处理数组 
	*/

include vcIO.inc

.data
	array dword 12,4,168,122,-33,56,78,99,345,66,-5
	;count dword lengthof array
	frmStr byte '%4d',0
.code
main proc

	mov esi, 0						; // left 指针
	mov edi, lengthof array -1		; // right 指针
	.while (esi<edi)
		mov eax, array[esi*4]		; // 交换首尾两项
		xchg eax, array[edi*4]
		mov array[esi*4], eax
		inc esi						; // 指针向后移动
		dec edi						; // 指针向前移动
	.endw
		
		mov ecx, lengthof array
		mov esi, offset array

	again:
		mov eax, [esi]
		pushad						; // printf 影响 eax 和 ecx 的值，必须在打印之前先保存起来		
			invoke printf ,offset frmStr, eax
		popad
		add esi, 4
		loop again
	
	invoke _getch
	ret
main endp
end main