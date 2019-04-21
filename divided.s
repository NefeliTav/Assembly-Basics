.text

.globl __start

__start:

                li $v0, 5                #read int
                syscall
                li $t6, 1
                add $t0, $v0, 0

CASE0:        li $t1, 2
                div $t0, $t1
                mfhi $t2
                bne $zero, $t2, CASE1
                li $t5, 1
                li $v0, 4                #print string
                la $a0, str2
                syscall
                j End

CASE1:        li $t1, 3
                div $t0, $t1
                mfhi $t2
                bne $zero, $t2, CASE2
                li $t5, 1
                li $v0, 4                #print string
                la $a0, str3
                syscall
                j End

CASE2:        li $t1, 5
                div $t0, $t1
                mfhi $t2
                bne $zero, $t2, DEF
                li $t5, 1
                li $v0, 4                #print string
                la $a0, str5
                syscall
                j End

DEF:        beq $t5, $t6, End
                li $v0, 4                #print string
                la $a0, str0
                syscall

End:        li $v0, 10 #End
                syscall

.data
        str2: .asciiz "It can be divided by 2"
        str3: .asciiz "It can be divided by 3"
        str5: .asciiz "It can be divided by 5"
        str0: .asciiz "It cant be divided by any"
