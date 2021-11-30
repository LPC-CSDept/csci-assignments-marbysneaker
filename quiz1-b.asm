
#
# Quiz1Question2.asm
#
#Marcelino Pangilinan
#quiz 1 question 2


	.data
prompt:	.asciiz		"Enter a value for x: \n"	
prompta: .asciiz	"Enter a value for a: \n"	
promptb: .asciiz	"Enter a value for b: \n"	
promptc: .asciiz	"Enter a value for c: \n"	
zero:	.float	0.0

	.text
	.globl	main
main:	
	l.s $f6, zero

	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 6 # read single precision
	syscall   # $f0 <= x
	
	add.s $f5, $f0, $f6
	
  
	la	$a0, prompta
	li	$v0, 4
	syscall

	li	$v0, 6 # read single precision
	syscall   # $f0 <= a
	
	add.s $f1, $f0, $f6

	la	$a0, promptb
	li	$v0, 4
	syscall

	li	$v0, 6 # read single precision
	syscall   # $f0 <= b
	
	add.s $f2, $f0, $f6

	la	$a0, promptc
	li	$v0, 4
	syscall

	li	$v0, 6 # read single precision
	syscall   # $f0 <= c
	
	add.s $f3 $f0, $f6
	

	# $f4 = ax^2
	# $f4 = $f4 + bx
	# $f4 = $f4 + c 

	# sum = ax^2 + bx + c

	mul.s $f4, $f5, $f5 	# $f4 = x^2
	mul.s $f4, $f4, $f1 	# $f4 = ax^2
	mul.s $f2, $f2, $f5 	# $f2 = bx
  	add.s $f4, $f2, $f4   # $f4 = ax^2 + bx
  	add.s $f4, $f4, $f3   # $f4 = ax^2 + bx + c
  
  	mov.s $f12,$f4
  	li $v0, 2
  	syscall

  
  	li $v0, 10 		# return to OS
  	syscall 

# end