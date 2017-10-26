
.586
.MODEL FLAT
.STACK 4096
.DATA

primeCount		BYTE	?
Candidate		DWORD ?
primeArray		DWORD 101 DUP (?)
Index			BYTE	?

.CODE

main PROC

    mov DWORD PTR primeARRAY[0*4],2
    mov DWORD PTR primeArray[1*4],3
	mov primeCount, 1
    mov    Candidate, 5

    primeWhileLoop:
            cmp primeCount,100     ;Compares primeCount >100
            jnl endprimeWhileLoop  ;jump if not less primwhilloop
            mov Index, 1			; index 1
    
 IndexWhileLoop:
        mov cl, Index			; copyng index value in cl reg
		cmp cl, primeCount		; comparing cl reg with primcount
		jnle endIndexWhileLoop	; it jumps to enindexwhile loop if value is not less or equals
	

        mov eax, candidate
        mov edx, 0            ;clear edx to divide correctly
        mov ecx, 0            ;clear ecx
		mov cl, Index         ;copyng index value to cl
		dec cl				  ; decrementing cl reg
		mov ebx, DWORD PTR primeArray[4*ecx]
		div ebx                
		cmp edx, 0
		je endIndexWhileLoop
		inc index
		jmp IndexWhileLoop

endIndexWhileLoop:
			mov cl, index
			cmp cl, primeCount
			jng IfNotPrime
			inc primeCount
			mov ebx, Candidate
			mov ecx, 0
			mov cl, primeCount
			dec cl
			mov DWORD PTR primeArray[4*ecx], ebx

IfNotPrime:
        add candidate, 2       ;
        jmp primeWhileLoop
  
  endPrimeWhileLoop:
        mov eax, 0
    ret
main ENDP    ; end of main programs
end          ; end of source code