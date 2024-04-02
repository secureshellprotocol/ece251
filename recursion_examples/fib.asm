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

	add $a0, $v0, $zero
	li $v0, 1
	syscall

	li $v0, 10
	syscall

fib:
	# alloc stack
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $s0, 4($sp)
	sw $s1, 0($sp)

	#check if $a0 == 0
	bne $a0, $zero, elseif
		li $v0, 0
		j exit

elseif:	
	addi $t0, $zero, 1
	bne $a0, $t0, else
		li $v0, 1
		j exit

else: 

	add $s0, $a0, $zero

	addi $a0, $s0, -1
	jal fib
	add $s1, $v0, $zero
	addi $a0, $s0, -2
	jal fib
	add $v0, $v0, $s1

exit:
	lw $s1, 0($sp)
	lw $s0, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	jr $ra
