.text

.globl __start

__start:
        
        la $t0, value
        lw $s0, 0($t0)
        
        srl $t1, $s0, 24  #shift right logical  3->0 byte
        
        sll $t4, $s0, 24  #shift left logical   0->3 byte
        
        sll $t2, $s0, 8   #shift left logical   
        srl $t2, $t2, 24  #shift right logical   2->3->0->1
        sll $t2, $t2, 8   #shift left logical
         
        srl $t3, $s0, 8  #shift right logical
        sll $t3, $t3, 24  #shift left logical    1->0->3->2
        srl $t3, $t3, 8  #shift right logical
        
        or $s1, $t1, $t2
        or $s1, $s1, $t3    logical or
        or $s1, $s1, $t4

        
        li $v0, 10 #End
        syscall

.data
        
        value: .word 0x12345678      
       
