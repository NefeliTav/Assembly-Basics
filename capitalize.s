.text

.globl __start

__start:
        li $t2, 0

        li $t3, 97
        li $t4, 122

        li $v0, 8         #read string
        la $a0, str        #buffer
        li $a1, 10        #length
        syscall

        while:         lbu $t0, str($t1)  # load a character
                        beq $t0, $t2, END  # if character to end copy then exit loop

                        blt $t0, $t3, here
                        bgt $t0, $t4, here
                        addi $t0, $t0, -32  #convert a to A
        here:           sb  $t0, str($t1)
                        addi $t1,$t1,1  # increment counter
                        j while   # repeat while loop



        END:
                li $v0, 4                #print string
                la $a0, str
                syscall
                li $v0, 10 #End
                syscall

.data
        str: .space 11
