.text

.globl __start

__start:

        la $t0, num1
        
        lw $t1, 0($t0)
        lw $t2, 4($t0)
        
        mult $t1, $t2
        mflo $s0
        mfhi $s1
        multu $t1, $t2
        mflo $s2
        mfhi $s3
        
        la $t0, num2
        
        lw $t1, 0($t0)
        lw $t2, 4($t0)
        
        mult $t1, $t2
        mflo $s4
        mfhi $s5
        multu $t1, $t2
        mflo $s6
        mfhi $s7
        
        la $t0, num3
        
        lw $t1, 0($t0)
        lw $t2, 4($t0)
        
        mult $t1, $t2
        mflo $t4
        mfhi $t5
        multu $t1, $t2
        mflo $t6
        mfhi $t7
        
        li $v0, 10 #End
        syscall

.data
        num1: .word 0x0000000a       
              .word 0x00000008
        
        num2: .word 0x00000002       
              .word 0xffffffff
        
        num3: .word 0x80000000
              .word 0x80000000
