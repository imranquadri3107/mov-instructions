.586
.MODEL FLAT
.STACK 4096
.DATA
num				BYTE ?
saveaddress		DWORD ?
sum				DWORD ?


.CODE
main  PROC
    CodeBegin:
		mov num, 254
		mov sum,0

	CodeLoop1:
		add num,1
		mov eax, sum
		add al, num
		mov sum, eax
		jmp CodeLoop1
		mov sum,0
		jmp saveaddress
		mov eax, sum
		jmp eax
		mov sum,0
		jmp DWORD PTR [ebx]
		mov eax, 0

        ret
main  ENDP
END                             ; end of source code