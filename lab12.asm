; Macro Exercise of addition, minimum, maximum, upper 

add3     MACRO  number1, number2, number3
 
            mov    eax,    number1
            add     eax,    number2
            add     eax, number3
            ENDM  
			

			
 max2     MACRO  number1, number2

            LOCAL end
            mov eax, number1
            cmp eax, number2
            jge end
   
            mov eax, number2
    end:
           
     
        ENDM  
		

		

 min3     MACRO  number1, number2, number3
           
            LOCAL end, CmpIfLess

            mov eax, number1
            cmp eax, number2
            jl CmpIfLess
            mov eax, number2
           

    CmpIfLess:
           
            cmp eax, number3
            jle end
            mov eax, number3
           

    end:

           
     
        ENDM  

		
		
toUpper        MACRO number1
       
        LOCAL end
        mov al, number1
        cmp al, 65h
        jl end
        cmp al, 7Bh
        jg end
        sub al, 32
        mov number1, al
    end:
     
        ENDM  