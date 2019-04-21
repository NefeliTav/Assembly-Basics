 .text
 .globl __start
__start:
# Input

 la $a0,dividend
 li $v0,4
 syscall                              #ask for dividend
 li $v0,5
 syscall                              #read dividend
 move $t0,$v0                         #dividend in $t0
 la $a0,divisor
 li $v0,4
 syscall                              #ask for divisor
 li $v0,5
 syscall 							  #read divisor
 move $t1,$v0 						  #divisor in $t1

#now i've read the two numbers i need 

#Calculations

div $t0, $t1                         #divide $t0 by $t1

mflo $t4                             #quotient 
mfhi $t5                             #remainder

#Output
 la $a0,quotient
 li $v0,4
 syscall 							 #print quotient
 move $a0,$t4                        #quotient in $a0
 li $v0,1                            
 syscall                             #print quotient
 la $a0,endl
 li $v0,4
 syscall 							 #newline 


 la $a0,remainder
 li $v0,4
 syscall                            #print remainder
 move $a0,$t5                       #remainder in $a0
 li $v0,1                           
 syscall                            #print remainder
 la $a0,endl
 li $v0,4
 syscall                            #newline
 li $v0,10
 syscall                            #exit


 .data
dividend: .asciiz "Enter dividend:"
divisor: .asciiz "Enter divisor:"
endl: .asciiz "\n"
quotient: .asciiz "quotient is :"
remainder: .asciiz "remainder is :" 

