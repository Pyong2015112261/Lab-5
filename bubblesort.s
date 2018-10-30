/*******************************************************************************
Paul Yong, Shelby Castillo
*******************************************************************************/
  
  PUBLIC BubbleSort                
  SECTION `.text`:CODE:NOROOT(1)
  THUMB


BubbleSort:
  PUSH  {R3-R7, LR}             
  MOV   R3,#+1                  

OuterLoop:
  CMP   R3,#+1                  
  BNE   FINISH                  
  MOV   R3,#+0                  
  MOV   R4,#+1                  
  B     InnerLoop               
  
InnerLoop:  
  CMP   R4,R1                   
  BNE   Compare_Array           
  B     OuterLoop               

Compare_Array:
  SUB   R5,R4,#+1               
  LDR   R6,[R0,R5,LSL #+2]      
  LDR   R7,[R0,R4,LSL #+2]     
  CMP   R2,#+1                    
  BEQ   Ascending
  BNE   Descending
  
Ascending:
  CMP   R6,R7                   
  B     Swap_and_Increment
  
Descending:
  CMP   R7,R6                   
  B     Swap_and_Increment

Swap_and_Increment:
  BGT   Swap                   
  B     Increment              

Swap:
  STR   R6,[R0, R4, LSL #+2]    
  STR   R7,[R0, R5, LSL #+2]   
  MOV   R3,#+1                 
  B Increment                 
  
Increment:
  ADD   R4,R4,#+1               
  B     InnerLoop               
  
FINISH:  
  POP   {R3-R7}                
  MOV   pc,lr                   
  END
