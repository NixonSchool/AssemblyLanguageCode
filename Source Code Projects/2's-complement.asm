 

.model small                                          
 .data  
 a dw 1234H  
 .code  
      mov      ax, @data          ; Initialize data section       
      mov      ds, ax  
      mov      ax, a              ; Load number1 in ax                             
      neg      ax                 ; find 2's compement. Result in ax  
      mov      ch, 04h            ; Count of digits to be displayed  
      mov      cl, 04h            ; Count to roll by 4 bits  
      mov      bx, ax             ; Result in reg bx  
 l2:     rol      bx, cl          ; roll bl so that msb comes to lsb   
      mov      dl, bl             ; load dl with data to be displayed  
      and      dl, 0fH            ; get only lsb  
      cmp      dl, 09             ; check if digit is 0-9 or letter A-F  
      jbe      l4  
      add      dl, 07             ; if letter add 37H else only add 30H  
 l4:     add      dl, 30H  
      mov      ah, 02             ; Function 2 under INT 21H (Display character)  
      int      21H  
      dec      ch                 ; Decrement Count  
      jnz      l2  
      mov      ah, 4cH            ; Terminate Program  
      int      21H  
      end