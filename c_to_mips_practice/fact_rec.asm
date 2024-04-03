.data
### Setup Strings ###
    newline: .asciiz "\n"
    in : .asciiz "input: "
    out : .asciiz "output: "

### Setup Test Input ###
    A: .word 3

.text
.globl main
main:
	li $v0, 4
	la $a0, in
	syscall

	li $v0, 5
	syscall
	add $a0, $zero, $v0

	jal .fact

	addi $t0, $v0, 0

	li $v0, 4
	la $a0, out
	syscall

	add $a0, $t0, $zero
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 10
	syscall

.fact:
	slti $t0, $a0, 2
	bne $t0, $zero, return_one
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	addi $a0, $a0, -1
	jal .fact
	lw $t0, 4($sp)
	mult $t0, $v0
	mflo $v0
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra

	return_one:
	addi $v0, $zero, 1
	jr $ra
