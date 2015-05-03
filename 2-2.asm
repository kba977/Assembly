comment /*
*/
include vcIO.inc

.data
	chl dword 'A'
	caps dword ?
	frmStr byte '%d',0ah
.code
main proc
	pushad
		mov eax, chl
		cmp eax, 'a'
		jb next			; // jump if below 
		cmp eax, 'z'
		ja next			; // jump if above
		mov caps, 0
	next:
		cmp eax, 'A'
		jb done
		cmp eax, 'Z'
		ja done
		mov caps, 1
	done:
	popad

	invoke printf, offset frmStr, caps
	invoke _getch
	ret
main endp
end main