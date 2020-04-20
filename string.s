.text
    .globl __start
__start:

      li $v0, 8                   #read string
      la $a0, buffer
      li $a1, 21
      #move $t0,$a0 #save string to t0
      syscall

      li $v0, 4                   #print string
      syscall

      sb $zero,5($a0)
      syscall

      li $v0, 10
      syscall
.data
        buffer: .space 21
