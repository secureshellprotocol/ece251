#	Question 2

.data
### Setup Strings ###
    newline: .asciiz "\n"
    strOriginalA : .asciiz "Original A: "
    strOriginalB : .asciiz "Original B: "
    strSwappedA: .asciiz "Swapped A: "
    strSwappedB: .asciiz "Swapped B: "

### Setup Test Input ###
    A: .word 32
    B: .word -5

.text
.globl main
main:
### Load Data Values Into Registers ###
    la $s0, A
    la $s1, B

### Print ###
    li $v0, 4
    la $a0, strOriginalA
    syscall

    li $v0, 1
    lw $a0, 0($s0)
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 4
    la $a0, strOriginalB
    syscall

    li $v0, 1
    lw $a0, 0($s1)
    syscall

    li $v0, 4
    la $a0, newline
    syscall

### Call Swap Function ###
    move $a0, $s0
    move $a1, $s1
    jal swap

    lw $s2, 0($a0)
    lw $s3, 0($a1)

### Print ###
    li $v0, 4
    la $a0, strSwappedA
    syscall

    li $v0, 1
    move $a0, $s2
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    la $a0, strSwappedB
    syscall

    li $v0, 1
    move $a0, $s3
    syscall

### Exit Program ###
    li $v0, 10
    syscall

### Your code for Q2 goes here ###
swap:
	# alloc stack pointers
	addi	$sp, $sp, -8
	sw	$t0, 4($sp)
	sw	$t1, 0($sp)
	
	# This works, but it moves the addresses around
 	# rather than moving the actual data around. So
	# its not the same thing.
	#add	$t0, $zero, $a0
	#add	$a0, $zero, $a1
	#add	$a1, $zero, $t0

	lw	$t0, 0($a0) # copy whatevers in a0 to t0
	lw	$t1, 0($a1) # copy whatevers in a1 to t1
	sw	$t1, 0($a0) # store whatevers in t1 to a0
	sw	$t0, 0($a1) # store whatevers in t0 to a1

	# dealloc and return
	lw	$t0, 4($sp)
	lw	$t1, 0($sp)
	addi	$sp, $sp, 8

	jr $ra
