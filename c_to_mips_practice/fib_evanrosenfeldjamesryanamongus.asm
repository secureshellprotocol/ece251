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

	jal .fib

	add $a0, $v0, $zero
	li $v0, 1
	syscall

	li $v0, 10
	syscall

.fib:
	beq $a0, $zero, return_one
	addi $t0, $zero, 1
	beq $a0, $t0, return_one

	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	addi $a0, $a0, -1
	jal .fib
	lw $a0, 4($sp)
	addi $a0, $a0, -2
	sw $v0, 8($sp)
	jal .fib
	lw $t0, 8($sp)
	add $v0, $v0, $t0
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	add $sp, $sp, 12
	jr $ra

return_one:
	addi $v0, $zero, 1
	jr $ra
