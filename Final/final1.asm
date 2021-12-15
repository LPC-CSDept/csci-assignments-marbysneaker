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
    sub     $t9, $t9, 1
    beq		$t9, $s0, 10

    mul     $s1, $s0, 10

    b   wait
    
    
    
read:
    li      $v0, 10         # end program
    syscall                 # return to OS













loop: