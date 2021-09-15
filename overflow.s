.text

.globl __start

__start:
        
        #first addition
        la $t0, num1
        lw $t1, 0($t0)
        
	add $s0, $t1, $t1
        addu $s1, $t1, $t1
        
        add $a0, $s0 0        #moves int from s0 to a0
        syscall
        add $a0, $s1 0        #moves int from s0 to a0
        syscall
        
    
        
        #second addition
        la $t0, num2
        la $t1, num3
        lw $t2, 0($t0)
        lw $t3, 0($t1)
        
        #add $s2, $t2, $t3       overflow
        addu $s3, $t2, $t3
        
        add $a0, $s3 0       
        syscall
        add $a0, $s3 0        
        syscall
        
     
        #third addition          underflow              
        la $t0, num4
        la $t1, num5
        lw $t2, 0($t0)
        lw $t3, 0($t1)
        
        #add $s4, $t2, $t3
        addu $s5, $t2, $t3
        
        add $a0, $s5 0        
        syscall
        add $a0, $s5 0        
        syscall
        
       
        
        #fourth addition
        la $t1, num5
        lw $t3, 0($t1)
        add $s6, $t3, $t3
        addu $s7, $t3, $t3
        
        add $a0, $s6 0        
        syscall
        add $a0, $s7 0        
        syscall
        
     
        li $v0, 10 #End
        syscall

        
        
.data
        num1: .word 0x3fffffff #2 times
        
        num2: .word 0x7fffffff                                      #the numbers i add
        num3: .word 0x00000001
        
        num4: .word 0x80000000
        num5: .word 0xffffffff #3 times

       
