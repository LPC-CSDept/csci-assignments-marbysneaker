# Final Exam : Quesiton No2

# Name :Marcelino Pangilinan

    .kdata

s1:     .word 10
s2:     .word 11

new_line:   .asciiz     "\n"
testing:    .asciiz     "q was entered\n"

        .text
        .globl  main

main:

        mfc0        $a0, $12    #read from status register
        ori         $a0,   0xff11     # enable all interrupts     
		mtc0 	    $a0, $12     # write back to the status register     
		lui         $t0, 0xFFFF     #   $t0 =   0xFFFF0000     
		ori          $a0, $0, 2     #   enable keyboard interrupt     
		sw      	$a0, 0($t0)     # write back to 0xFFFF0000;     Receiver Control 

here:

        j here     #   stay here forever     
		
		li 	$v0, 10     #   exit,if     it ever comes here     
		syscall     
		