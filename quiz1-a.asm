#
# Quiz1Question1.asm
#
#Marcelino Pangilinan
#quiz 1 question 1

# Make a Assembly Code for converting single-precision temperatures from Fahrenheit to Celsius.
# celsius= (fahrenheit-32.0) × 5.0 ⁄ 9.0
##


	.data
pr1:	.asciiz "Enter a Farenheit Degree\n"
faren: .asciiz "Farenheit: "
lf:	.asciiz	"\nCelsius:"
val1:	.float	32.0
val2:	.float 	5.0
val3: 	.float  9.0

	.text
	.globl main
main:
	li 	$v0, 4
	la  $a0, pr1
	syscall

	li $v0, 5 # get an integer
	syscall

	mtc1 	$v0, $f4
	cvt.s.w $f5, $f4  # $f5 = converted floating value

    li $v0, 4
  	la $a0, faren
  	syscall

    mov.s $f12, $f5
	li  $v0, 2 	# print single
	syscall


	l.s $f1, val1
	l.s $f2, val2
	l.s $f3, val3

  	sub.s $f1, $f5, $f1 # (Farenheit -32)
 	mul.s $f1, $f1, $f2 # (Farenheit -32)*5.0
  	div.s $f1, $f1, $f3 #((Farenheit -32)*5.0)/9.0

 	li $v0, 4
  	la $a0, lf
  	syscall

	mov.s $f12, $f1 
	li  $v0, 2 	# print single
	syscall

	li $v0, 10 # end of program
	syscall