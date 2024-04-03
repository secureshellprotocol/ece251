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
	addi $t0, $zero, 1
	
	.loop:
	slti $t2, $a0, 2
	bne $zero, $t2, .brk
	mult $t0, $a0
	mflo $t0
	addi $a0, $a0, -1
	j .loop
	.brk:
	addi $v0, $t0, 0
	jr $ra
