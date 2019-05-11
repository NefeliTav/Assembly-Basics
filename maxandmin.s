.text         
        .globl __start  
 __start:    
        #initialize variables
         li $a0,-10 
         li $a1,-30  
         li $a2,120  
         li $a3,200  
                                
         li $s0,-101
         li $s1,-301 
         li $s2,1201  
         li $s3,2002 
         li $s4,-102 
         li $s5,-302  
         li $s6,1203  
         li $s7,2003 
         
         jal HERE
         
         move $t0,$v0  
         move $t1,$v1  
         la $a0,max  
         li $v0,4  
         syscall   
         move $a0,$t0
         li $v0,1 
         syscall   
         la $a0,endl 
         li $v0,4 
         syscall  
         la $a0,min
         li $v0,4 
         syscall
         move $a0,$t1   
         li $v0,1  
         syscall  
         la $a0,endl  
         li $v0,4 
         syscall 
         li $v0,10   
         syscall  
         
        #procedure
HERE:

        addi $sp, $sp, -32
        sw $s0, 0($sp)
        sw $s1, 4($sp)
        sw $s2, 8($sp)
        sw $s3, 12($sp)
        sw $s4, 16($sp)
        sw $s5, 20($sp)
        sw $s6, 24($sp)
        sw $s7, 28($sp)

        add $s0, $a0, 0
        add $s1, $a1, 0
        add $s2, $a2, 0
        add $s3, $a3, 0        
        
        bge $s0, $s1, A
        add $s5, $s0, 0                #min
        add $s4, $s1, 0                #max
        j O
        
A:      add $s4, $s0, 0                #max
        add $s5, $s1, 0                #min
        
O:      bge $s3, $s2, B
        add $s7, $s2, 0                #min
        add $s6, $s3, 0                #max
        j E
B:      add $s6, $s2, 0                #max
        add $s7, $s3, 0                #min
        
E:      bge $s7, $s5, X
        move $v0, $s5
        j F
X:        move $v0, $s7
F:        bge $s4, $s6, Y
        move $v1, $s4
        j END
Y:        move $v1, $s6
END:        jr $ra
        
        
.data 
        max:  .asciiz "Max is : " 
        min:  .asciiz "Min is : " 
        endl:  .asciiz "\n"