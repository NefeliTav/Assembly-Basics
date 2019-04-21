.text                  #text segment
    .globl __start
__start:
      la $t8, bytes   #load address
      lbu $t0, 0($t8)  #load byte
      lhu $t1, 0($t8)  #load halfword
      lw $t2, 0($t8)   #load word

      lbu $t3, 4($t8)
      lhu $t4, 4($t8)   #same as above but for larger address
      lw $t5, 4($t8)

      lb $t0, 0($t8)
      lh $t1, 0($t8)   #same as before but for signed numbers
      lw $t2, 0($t8)

      lb $t3, 4($t8)
      lh $t4, 4($t8)   #same
      lw $t5, 4($t8)

      lb $t6, 4($t8)
      sb $t6, 0x10010010  #store byte

      li $v0, 10  #exit
          syscall


.data      #data segment
bytes: .byte 0x01, 0x02, 0x03, 0x04, 0x81, 0x82, 0x83, 0x84
words: .word 0x12345678, 0x87654321
