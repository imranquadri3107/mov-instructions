; Example assembly language program -- adds two numbers
; Author:  R. Detmer
; Date:    1/2008

.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
number1 DWORD   ?
number2 DWORD   ?
prompt1 BYTE    "Enter a valid string of number (String may contain leading + or -):", 0
string  BYTE    40 DUP (?)
resultLbl BYTE  "The octal to integer is", 0
sum     BYTE    11 DUP (?), 0

.CODE
OctalStringToDecimal	PROC

						push	ebp
						mov		ebp, esp
						sub     esp, 4		;local space for sign
						push	ebx
						push	edx
						push	esi
						pushfd

						mov		esi, [ebp+8]

			WhileBlankD:cmp    BYTE PTR [esi],' '  ; space?
						jne    EndWhileBlankD      ; exit if not
						inc    esi                 ; increment character pointer
						jmp    WhileBlankD         ; and try again
			EndWhileBlankD:

						mov    eax,1               ; default sign multiplier

			IfPlusD:    cmp    BYTE PTR [esi],'+'  ; leading + ?
						je     SkipSignD           ; if so, skip over
			IfMinusD:   cmp    BYTE PTR [esi],'-'  ; leading - ?
						jne    EndIfSignD          ; if not, save default +
						mov    eax,-1              ; -1 for minus sign
			SkipSignD:  inc    esi              ; move past sign
			EndIfSignD:

						mov    [ebp-4],eax         ; save sign multiplier
						mov    eax,0               ; number being accumulated

			WhileDigitD:cmp    BYTE PTR [esi],'0'  ; compare next character to '0'
						jl     EndWhileDigitD      ; It's not an octal digit if smaller than '0'
						cmp    BYTE PTR [esi],'7'  ; compare to '7'
						jg     EndWhileDigitD      ; it's not a octal digit if bigger than '7'
						imul   eax,8               ; multiply old number by 8
						mov    bl,[esi]            ; ASCII character to BL
						and    ebx,0000000Fh       ; convert to single-digit integer
						add    eax,ebx             ; add to sum
						inc    esi                 ; increment character pointer
						jmp    WhileDigitD         ;  try next character
			EndWhileDigitD:

						cmp    eax,80000000h       ; 80000000h?
						jnb    endIfMaxD           ; skip if not
						imul   DWORD PTR [ebp-4]   ; make signed number

			endIfMaxD:

						popfd                      ; restore flags
						pop    esi                 ; restore registers
						pop    edx
						pop    ebx
						mov    esp, ebp            ; delete local variable space
						pop    ebp 
						ret                        ; exit

OctalStringToDecimal	ENDP

_MainProc PROC
        input   prompt1, string, 40      ; read ASCII characters
		lea		eax, string				 ; copying the address of the string to eax
		push	eax						 ; pushing the address of the string on the stack

        call	OctalStringToDecimal	 ; convert octal to integer
        mov     number1, eax			 ; store in memory

        dtoa    sum, eax				 ; convert to ASCII characters
        output  resultLbl, sum           ; output label and sum

        mov     eax, 0					 ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code

