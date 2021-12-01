
#
# Quiz1Question2.asm
#
#Marcelino Pangilinan
#quiz 1 question 2


	.data
prompt:	.asciiz		"Enter a value for x: " 	
prompta: .asciiz	"\nEnter a value for a: "	
promptb: .asciiz	"\nEnter a value for b: "	
promptc: .asciiz	"\nEnter a value for c: "	
equation: .asciiz    "\nax^2 + bx + c = "
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

    mov.s $f12,$f5
  	li $v0, 2           # print value of x
  	syscall
	
  
	la	$a0, prompta
	li	$v0, 4
	syscall

	li	$v0, 6 # read single precision
	syscall   # $f0 <= a
	
	add.s $f1, $f0, $f6

    mov.s $f12,$f1
  	li $v0, 2           # print value of a
  	syscall

	la	$a0, promptb
	li	$v0, 4
	syscall

	li	$v0, 6 # read single precision
	syscall   # $f0 <= b
	
	add.s $f2, $f0, $f6

    mov.s $f12,$f2
  	li $v0, 2           # print value of b
  	syscall

	la	$a0, promptc
	li	$v0, 4
	syscall

	li	$v0, 6 # read single precision
	syscall   # $f0 <= c
	
	add.s $f3 $f0, $f6

    mov.s $f12,$f3
  	li $v0, 2           # print value of c
  	syscall
	

	# $f4 = ax^2
	# $f4 = $f4 + bx
	# $f4 = $f4 + c 

	# sum = ax^2 + bx + c

	mul.s $f4, $f5, $f5 	# $f4 = x^2
	mul.s $f4, $f4, $f1 	# $f4 = ax^2
	mul.s $f2, $f2, $f5 	# $f2 = bx
  	add.s $f4, $f2, $f4   # $f4 = ax^2 + bx
  	add.s $f4, $f4, $f3   # $f4 = ax^2 + bx + c
  
    la	$a0, equation
	li	$v0, 4      # print equation 
	syscall

  	mov.s $f12,$f4
  	li $v0, 2       # print answer
  	syscall

  
  	li $v0, 10 		# return to OS
  	syscall 

# end