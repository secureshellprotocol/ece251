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

	jal fib

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

fib:
	addi $sp, $sp, -12
	sw $a0, 0($sp)
	sw $ra, 4($sp)
	slti $t0, $a0, 1
	beq $t0, $zero, Else
		addi $v0, $zero, 1
		j Done
	Else:
		addi $t1, $a0, 0
		sw $t1, 8($sp)
		addi $a0, $a0, -1
		jal fib
		lw $t1, 8($sp)
		mult $t1, $v0
		mflo $v0
	Done:
		lw $a0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 12
		jr $ra
