# Final Exam : Quesiton No1

# Name :Marcelino Pangilinan

    .data

msg1: .asciiz "\n Enter your number "

    .data
num3: .word 3

    .text

    .globl main 

main:
    lw      $t3, num3
    lui     $t0, 0xffff     # load upper immediate

wait:
    lw      $t1, 0($t0)
    andi	$t0, $t1, 0	
    beq		$t0, $t1, wait
    lw      $s0, 4($t0)

    sub     $s0, $s0, 48    # s0 = v0 -48
    sub     $t3, $t3, 1
    beq		$t3, $zero,read

    mul     $s1, $s0, 10    # get first digit
    srl     $s2, $s1, 1   # get second digit
    mul     $s2, $s2, 10

    b   wait
    
    
    
read:
    add		$a0, $s1, $s0   
    add		$a0, $$a0, $s2
    li      $v0, 1
    syscall
    
    li      $v0, 10         # end program
    syscall                 # return to OS












