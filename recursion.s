     .text       
                .globl __start 
__start:    
 
# start of main program 

        la $a0,prompt  
        li $v0,4 
        syscall   # display "Enter integer number :"   
        li $v0,5  
        syscall   # read integer 
        move $t0,$v0 
        la $a0,endl   
        li $v0,4 
        syscall   # display end of line 
        move $a0,$t0 
        jal TENNIS
        li $v0,10   
        syscall   # exit  
        
# end of main program 
 
 
# start of procedure
TENNIS:
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        
        beqz $a0, END
        
        addi $a0, -1
        jal TENNIS
        addi $a0, 1
        li $v0,1  
        syscall  
END: 
        lw $ra, 0($sp)
        addi $sp, $sp, 4
        jr $ra
        

# end of procedure  
 
 
.data 
          prompt:   .asciiz "Enter integer number :" 
          endl:  .asciiz "\n" 