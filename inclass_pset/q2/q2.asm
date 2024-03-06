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
	add	$t0, $zero, $a0
	add	$a0, $zero, $a1
	add	$a1, $zero, $t0
	jr $ra
