; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
;value DWORD ?
;COUNT BYTE ?

bval BYTE 10

wval WORD 206

dwval DWORD 1014

.CODE
_MainProc PROC
        mov AL, -20
		mov dl, 25
		mov bh, 0ffh
		mov bl, al
		
	
		mov al, bval
		mov bval, 1101b
		mov bval, al
		mov bval, ch

		mov ax, -201
		mov dx, 254
		mov bx, 0ffh
		mov bx, ax
		mov ax, wval
		mov wval, 110101b
		mov wval, ax
		mov wval, cx
		

		mov eax, -320
		mov edx, 425
		mov ebx, 0ffh
		mov ecx, eax
		mov eax, dwval
		mov dwval, eax
		mov dwval, ecx
      
        ret
_MainProc ENDP
END                             ; end of source code

