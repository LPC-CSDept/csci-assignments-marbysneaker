# Final Exam : Quesiton No1

# Name :Marcelino Pangilinan

    .data

msg1: .asciiz "\nEnter your number:  "

    .data
num3: .word 3

    .text

    .globl main 

main:
    lw      $t3, num3
    lui     $t0, 0xffff     # load upper immediate
    li		$v0, 4 
    la		$a0, msg1
    syscall		
    		
wait:
    lw		$t1, 0($t0)
    andi 	$t1, $t1, 0x0001
    beq		$t1, $zero, wait
    lw		$s0, 4($t0)

    sub     $s0, $s0, 48    # s0 = v0 -48

    beq     $t3, 3, third_num
    sub     $t3, $t3, 1     # subtracting 3 -1 for every loop
    beq		$t3, $zero,read # if state ment if t3 == 0 branch to read

    mul     $s1, $s0, 10    # get second digit store it in s1
   

    b   wait
    
third_num:
    mul     $s2, $s0, 100  # get first digit store it in s2
    sub     $t3, $t3, 1
    b		wait			# branch to wait
    
    
read:
    add		$a0, $s1, $s0   # add 3rd and 2nd digit to register a0
    add		$a0, $a0, $s2  # add 1st digit to a0
    li      $v0, 1          #read 3 digits 
    syscall
    
    li      $v0, 10         # end program
    syscall                 # return to OS












