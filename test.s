	.text
	.globl main
_fib:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 12		#set frame pointer to first parameter
	subu  $sp, $sp, 0
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#less than
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D0		#skip if-then body
	.data
.S1:	.asciiz "input must be non-negative"
	.text
	la    $t0, .S1		#load string .S1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $zero, $t0		#negate value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _fib_Exit		#jump to function exit for fib
.D0:
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .T4
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .T4
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	b     .D5
.T4:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.D5:
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .E3		#jump to else body
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _fib_Exit		#jump to function exit for fib
	b     .D2		#leave if-then-else statement
.E3:
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $t0, $t1		#subtraction
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fib		#jump and link to fib
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 2		#load value 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $t0, $t1		#subtraction
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fib		#jump and link to fib
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	add   $t0, $t0, $t1		#addition
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _fib_Exit		#jump to function exit for fib
.D2:
_fib_Exit:
	lw    $ra, -4($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -8($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
_fact:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 12		#set frame pointer to first parameter
	subu  $sp, $sp, 0
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#less than
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D6		#skip if-then body
	.text
	la    $t0, .S1		#load string .S1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $zero, $t0		#negate value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _fact_Exit		#jump to function exit for fact
.D6:
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .E8		#jump to else body
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _fact_Exit		#jump to function exit for fact
	b     .D7		#leave if-then-else statement
.E8:
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $t0, $t1		#subtraction
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fact		#jump and link to fact
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 0($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	mul   $t0, $t0, $t1		#product
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _fact_Exit		#jump to function exit for fact
.D7:
_fact_Exit:
	lw    $ra, -4($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -8($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
_recursionTests:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		#set frame pointer to first parameter
	subu  $sp, $sp, 8
	.data
.S9:	.asciiz "welcome to recursion tests!\n"
	.text
	la    $t0, .S9		#load string .S9
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $zero, $t0		#negate value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -12($fp)	#load local address
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, 0($t1)	#assign to factn
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -8($fp)	#load local address
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, 0($t1)	#assign to fibn
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	.data
.S10:	.asciiz "testing Fibonacci function... \n"
	.text
	la    $t0, .S10		#load string .S10
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
.W.L11:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#less than
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D.L12		#leave while loop
	.data
.S13:	.asciiz "please enter a non-negative Fibonacci index:\n"
	.text
	la    $t0, .S13		#load string .S13
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $v0, 5		#load code for read
	syscall		#read
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -8($fp)	#load local address
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, 0($t1)	#read value to fibn
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#less than
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D14		#skip if-then body
	.data
.S15:	.asciiz "the Fibonacci index entered is out of range.\n"
	.text
	la    $t0, .S15		#load string .S15
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
.D14:
	b     .W.L11		#jump back to while-condition
.D.L12:
	.data
.S16:	.asciiz "computing the Fibonacci number at index "
	.text
	la    $t0, .S16		#load string .S16
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#load code for write
	syscall		#write int
	.data
.S17:	.asciiz "... \n"
	.text
	la    $t0, .S17		#load string .S17
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S18:	.asciiz "The result is "
	.text
	la    $t0, .S18		#load string .S18
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fib		#jump and link to fib
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#load code for write
	syscall		#write int
	.data
.S19:	.asciiz "\n"
	.text
	la    $t0, .S19		#load string .S19
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S20:	.asciiz "testing factorial function... \n"
	.text
	la    $t0, .S20		#load string .S20
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
.W.L21:
	lw    $t0, -12($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#less than
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D.L22		#leave while loop
	.data
.S23:	.asciiz "please enter a non-negative factorial index:\n"
	.text
	la    $t0, .S23		#load string .S23
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $v0, 5		#load code for read
	syscall		#read
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -12($fp)	#load local address
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, 0($t1)	#read value to factn
	lw    $t0, -12($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1		#less than
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D24		#skip if-then body
	.data
.S25:	.asciiz "the factorial index entered is out of range.\n"
	.text
	la    $t0, .S25		#load string .S25
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
.D24:
	b     .W.L21		#jump back to while-condition
.D.L22:
	.data
.S26:	.asciiz "computing the factorial of "
	.text
	la    $t0, .S26		#load string .S26
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	lw    $t0, -12($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#load code for write
	syscall		#write int
	.text
	la    $t0, .S17		#load string .S17
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.text
	la    $t0, .S18		#load string .S18
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	lw    $t0, -12($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   _fact		#jump and link to fact
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#load code for write
	syscall		#write int
	.text
	la    $t0, .S19		#load string .S19
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S27:	.asciiz "exiting recursion tests...\n"
	.text
	la    $t0, .S27		#load string .S27
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
_recursionTests_Exit:
	lw    $ra, 0($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -4($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
_parameterTests:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		#set frame pointer to first parameter
	subu  $sp, $sp, 0
_parameterTests_Exit:
	lw    $ra, 0($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -4($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
_scopeTests:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		#set frame pointer to first parameter
	subu  $sp, $sp, 0
_scopeTests_Exit:
	lw    $ra, 0($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -4($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
_arithmeticTests:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		#set frame pointer to first parameter
	subu  $sp, $sp, 8
	li    $t0, 100		#load value 100
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -8($fp)	#load local address
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, 0($t1)	#assign to a
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $t0, 7		#load value 7
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -12($fp)	#load local address
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, 0($t1)	#assign to b
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	.data
.S28:	.asciiz "the result is: "
	.text
	la    $t0, .S28		#load string .S28
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $t0, 100		#load value 100
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 7		#load value 7
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	div   $t0, $t0, $t1		#quotient
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1		#load code for write
	syscall		#write int
	.text
	la    $t0, .S19		#load string .S19
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
_arithmeticTests_Exit:
	lw    $ra, 0($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -4($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
_logicTests:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		#set frame pointer to first parameter
	subu  $sp, $sp, 0
_logicTests_Exit:
	lw    $ra, 0($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -4($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
_stringTests:
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		#set frame pointer to first parameter
	subu  $sp, $sp, 0
_stringTests_Exit:
	lw    $ra, 0($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -4($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	jr    $ra		#return control to the caller
	.text
	.globl main
main:		# METHOD ENTRY
__start:		# add __start label for main only
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8		#set frame pointer to first parameter
	subu  $sp, $sp, 4
.W.L29:
	li    $t0, 1		#load true
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D.L30		#leave while loop
	.data
.S31:	.asciiz "==================================================\n"
	.text
	la    $t0, .S31		#load string .S31
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S32:	.asciiz "Please enter one of the following codes:\n"
	.text
	la    $t0, .S32		#load string .S32
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S33:	.asciiz "0. Exit testing\n"
	.text
	la    $t0, .S33		#load string .S33
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S34:	.asciiz "1. Recursions\n"
	.text
	la    $t0, .S34		#load string .S34
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S35:	.asciiz "2. Parameters\n"
	.text
	la    $t0, .S35		#load string .S35
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S36:	.asciiz "3. Scopes\n"
	.text
	la    $t0, .S36		#load string .S36
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S37:	.asciiz "4. Arithmetics\n"
	.text
	la    $t0, .S37		#load string .S37
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S38:	.asciiz "5. Logic\n"
	.text
	la    $t0, .S38		#load string .S38
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S39:	.asciiz "6. Strings\n"
	.text
	la    $t0, .S39		#load string .S39
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.text
	la    $t0, .S31		#load string .S31
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	.data
.S40:	.asciiz "Enter the test code: \n"
	.text
	la    $t0, .S40		#load string .S40
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $v0, 5		#load code for read
	syscall		#read
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	la    $t0, -8($fp)	#load local address
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sw    $t0, 0($t1)	#read value to code
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D41		#skip if-then body
	.data
.S42:	.asciiz "Exit testing...\n"
	.text
	la    $t0, .S42		#load string .S42
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	li    $t0, 0		#load value 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _main_Exit		#jump to function exit for main
.D41:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D43		#skip if-then body
	.data
.S44:	.asciiz "Test 1: Recursions\n"
	.text
	la    $t0, .S44		#load string .S44
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	jal   _recursionTests		#jump and link to recursionTests
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
.D43:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 2		#load value 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D45		#skip if-then body
	.data
.S46:	.asciiz "Test 2: Parameters\n"
	.text
	la    $t0, .S46		#load string .S46
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	jal   _parameterTests		#jump and link to parameterTests
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
.D45:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 3		#load value 3
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D47		#skip if-then body
	.data
.S48:	.asciiz "Test 2: Scopes\n"
	.text
	la    $t0, .S48		#load string .S48
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	jal   _scopeTests		#jump and link to scopeTests
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
.D47:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 4		#load value 4
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D49		#skip if-then body
	.data
.S50:	.asciiz "Test 4:Arithmetics\n"
	.text
	la    $t0, .S50		#load string .S50
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	jal   _arithmeticTests		#jump and link to arithmeticTests
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
.D49:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 5		#load value 5
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D51		#skip if-then body
	.data
.S52:	.asciiz "Test 5: Logic\n"
	.text
	la    $t0, .S52		#load string .S52
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	jal   _logicTests		#jump and link to logicTests
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
.D51:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 6		#load value 6
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1		#compare for equality
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D53		#skip if-then body
	.data
.S54:	.asciiz "Test 6: Strings\n"
	.text
	la    $t0, .S54		#load string .S54
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
	jal   _stringTests		#jump and link to stringTests
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
.D53:
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 1		#load value 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sub   $t0, $zero, $t0		#negate value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sle   $t0, $t0, $t1		#less than or equal to
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .T56
	lw    $t0, -8($fp)	#load local value
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	li    $t0, 6		#load value 6
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	sgt   $t0, $t0, $t1		#greater than
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 1, .T56
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	b     .D57
.T56:
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
.D57:
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .D55		#skip if-then body
	.data
.S58:	.asciiz "invalid code\n"
	.text
	la    $t0, .S58		#load string .S58
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 4		#load code for write
	syscall		#write String
.D55:
	b     .W.L29		#jump back to while-condition
.D.L30:
_main_Exit:
	lw    $ra, 0($fp)	#load caller's return address
	move  $t0, $fp		#move frame pointer to $t0
	lw    $fp, -4($fp)	#set frame pointer back to caller's frame pointer
	move  $sp, $t0		#set stack pointer to callee's frame pointer
	li    $v0, 10		#set syscall code to exit
	syscall		#exit main
