.data
### Setup Test Input ###
    A: .word 9, 8, 7, 6, 5
    B: .word 0, 1, 2, 3, 4
    g: .word 5

.text
.globl main
main:
### Load Data Values Into Registers ###
    lw $s1, g
    la $s6, A
    la $s7, B
    
### Your code for Q1 goes here ###
	lw	$t0, 16($s7)
	sll	$t1, $t0, 2
	add	$t2, $t1, $s6
	lw	$t3, 0($t2)
	sub	$s0, $s1, $t3

### Print S0 Register ###
    move $a0, $s0
    li $v0, 1
    syscall

### Exit Program ###
    li $v0, 10
    syscall
