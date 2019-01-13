
.586
.MODEL FLAT

INCLUDE io.h            

.STACK 4096

.DATA

.CODE
_MainProc PROC

  ;7.1.1 

	    mov bx, 0FA75h    ;a
		mov cx, 03102h
		and bx, cx

		mov bx, 0FA75h    ;b
		mov cx, 03102h
		or bx, cx

		mov bx, 0FA75h    ;c
		mov cx, 03102h
		xor bx, cx

		mov bx, 0FA75h    ;d
		not bx

		mov ax, 0FA75h    ;e
		and ax, 000fh

		mov ax, 0FA75h   ;f
		or ax, 0fff0h

		mov ax, 0FA75h   ;g
		xor ax, 0ffffh

		mov ax, 0FA75h   ;h
		test ax, 0004h

		mov cx, 08EBAh  ;i
		not cx

		mov cx, 08EBAh   ;j
		or cx, 00EDF2h

		mov cx, 08EBAh    ;k
		and cx, 00EDF2h

		mov cx, 08EBAh    ;l
		xor cx, 00EDF2h

		mov cx, 08EBAh    ;m
		test cx, 00EDF2h

		mov dx, 0B6A3h    ;n
		not dx

		mov dx, 0B6A3h    ;o
		or dx, 064C8h

		mov dx, 0B6A3h     ;p
		and dx, 064C8h

		mov dx, 0B6A3h    ;q
		xor dx, 064C8h

		mov dx, 0B6A3h     ;r
		test dx, 064C8h

	
	
	
; 7.2.1 
	
	
	  
	  mov ax, 0A8B5h   ;a
	  shl ax,1

	  mov ax, 0A8B5h   ;b
	  shr ax,1

	  mov ax, 0A8B5h   ;c
	  sar ax,1

	  mov ax, 0A8B5h  ;d
	  rol ax,1

	  mov ax, 0A8B5h  ;e
	  ror ax,1

	  mov ax, 0A8B5h  ;f
	  mov cl, 004h
	  sal ax,cl

	  mov ax, 0A8B5h  ;g
	  mov cl, 004h
	  shr ax,4


	  mov ax, 0A8B5h  ;h
	  mov cl, 004h
	  sar ax,cl

	  mov ax, 0A8B5h   ;i 
	  mov cl, 004h
	  rol ax,cl

	  mov ax, 0A8B5h  ;j
	  ror ax,4

	  mov ax, 0A8B5h  ;k
	  stc               
	  rcl ax, 1
	  
	

	  mov ax, 0A8B5h ;l
	  clc                
	  rcr ax,1

	  mov bx, 08EBAh ;m
	  shl bx,3

	  mov bx, 08EBAh ; n
	  shr bx,3

	  mov bx, 08EBAh ; o
	  sal bx,3

	  mov bx, 08EBAh ; p
	  sar bx,3


	 mov eax,0


 

 ret
 _MainProc ENDP
        
end