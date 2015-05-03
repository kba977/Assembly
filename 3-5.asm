comment /*
	5.	有一个首地址为string的字符串 ，剔除string中所有的空格字符。		请从字符串最后一个字符开始逐个向前判断、并进行处理。(题库第5章应用题13)		1.	scanP=tailP=Len(msg)-2; 		2.	while (scanP>=0) do				if (msg[scanP]==' ')				{ 					for moveP=scanP+1 to tailP do						msg[moveP-1]=msg[moveP];						tailP--; 				}				else					scanP++;		3.	print msg;  合理分配寄存器:tailP=edi,scanP=esi ,moveP=ebx  采用相对寻址处理数组。
*/

include vcIO.inc
.data
	msg byte ' Hel l o, wo rl D ', 13, 10, 0
.code
main proc

	invoke printf, offset msg

	mov edi, lengthof msg - 2			; // 尾指针tailP
	mov esi, edi						; // 从右向左的扫描指针scanP
	.while	sdword ptr esi > 0			; // sdword 将 esi 当做有符号数
		cmp msg[esi], 20h				; // 检测是否为空格 空格的Ascii码为20
		jnz next
		lea ebx, [esi+1]				; // 移动指针moveP=scanP+1
		.while ebx <= edi
			mov al, msg[ebx]
			mov msg[ebx-1], al
			inc ebx
		.endw
		dec edi							; // 尾指针向前移动一个位置
	next:
		dec esi							; // 扫面指针向前移动一个位置
	.endw

	mov byte ptr msg[edi+1], 0
	
	invoke printf, offset msg
	
	invoke _getch
	ret
main endp
end main