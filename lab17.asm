.586
.MODEL FLAT
INCLUDE io.h            ; header file for input/output
.STACK 4096

.DATA
promptInput BYTE    "Enter a string to trim", 0
strInput BYTE       80 DUP(?), 0
StrResult BYTE      80 DUP(?)
resultLbl BYTE      "After trim:", 0

.CODE
;==============================================================================
; int strlen(char str[])
; Description: Calculates the length of the given string 
; Parameter: NULL terminated string
; Return Value: Length of the string in EAX
strlen	PROC	
		push ebp
		mov ebp, esp
		push ebx
		mov eax, 0
		mov ebx, [ebp+8]
	WhileChar:
		cmp BYTE PTR [ebx], 0  ; NULL terminator ?
		je	EndWhileChar
		inc eax
		inc ebx
		jmp WhileChar

	EndWhileChar:		
		pop ebx
		pop ebp
		ret
strlen ENDP

;==============================================================================
; strltrim(char str[])
; Description: Removes the leading whitespaces in the given string 
; Parameter: NULL terminated string
; Return Value: None
strltrim	PROC	
		push ebp
		mov ebp, esp
		push eax
		push ebx
		push esi
		push edi

	   ;Finding strleng
		mov ebx, [ebp+8]
		push ebx
		call strlen
		add esp, 4
		mov ebx, [ebp+8]
		mov ecx, 0

	WhileWhiteSpaceChar:
		cmp BYTE PTR [ebx], 9
		je SkipWhiteSpace
		cmp BYTE PTR [ebx], 10
		je SkipWhiteSpace
		cmp BYTE PTR [ebx], 12
		je SkipWhiteSpace
		cmp BYTE PTR [ebx], 32
		je SkipWhiteSpace
		jmp EndWhileWhiteSpaceChar

	SkipWhiteSpace:
		inc ecx
		inc ebx
		jmp WhileWhiteSpaceChar

	EndWhileWhiteSpaceChar:
		sub eax, ecx
		inc eax
		mov ecx, eax
		mov edi, [ebp+8]
		mov esi, ebx
		rep movsb

		pop edi 
		pop esi
		pop ecx
		pop ebx
		pop eax
		pop ebp
		ret

	; Write the procedure code
strltrim ENDP

;==============================================================================
; strrtrim(char str[])
; Description: Removes the trailing whitespaces in the given string 
; Parameter: NULL terminated string
; Return Value: None
strrtrim	PROC	
		push ebp
		mov ebp, esp
		push ebx
		mov ebx, [ebp+8]

		push ebx
		call strlen
		add esp, 4

		mov ebx, [ebp+8]
		add ebx, eax

	WhileWhiteSpaceChar:
        cmp BYTE PTR [ebx], 9
		je SkipWhiteSpace
		cmp BYTE PTR [ebx], 10
		je SkipWhiteSpace
		cmp BYTE PTR [ebx], 12
		je SkipWhiteSpace
		cmp BYTE PTR [ebx], 32
		je SkipWhiteSpace
		jmp EndWhileWhiteSpaceChar

	SkipWhiteSpace:
		mov BYTE PTR [ebx], 0
		dec ebx
		jmp WhileWhiteSpaceChar
	EndWhileWhiteSpaceChar:
		
		pop ebx
		pop eax
		pop ebp
		ret

strrtrim ENDP

;==============================================================================
; strtrim(char str[])
; Description: Removes the leading and trailing whitespaces in the given string 
; Parameter: NULL terminated string
; Return Value: None
strtrim	PROC	
	; Write the procedure code
		
		push ebp
		mov ebp, esp
		push [ebp+8]

		call strltrim
		call strrtrim
		add esp, 4
		pop ebp
		ret

strtrim ENDP


;==============================================================================
_MainProc PROC
        input   promptInput, strInput, 80      
        		lea ebx, strInput
		push ebx
		call strtrim
		add esp, 4
		output resultLbl, strInput

        mov     eax, 0  ;exit,return code 0
        ret
_MainProc ENDP
END                    ; end of source code